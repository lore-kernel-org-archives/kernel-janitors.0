From: Michal Nazarewicz <mina86@mina86.com>
Date: Tue, 05 Jan 2016 13:55:31 +0000
Subject: Re: [patch v2] usb: gadget: f_midi: missing unlock on error path
Message-Id: <xa1twprot9kc.fsf@mina86.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160105102809.GA26420@mwanda>
In-Reply-To: <20160105102809.GA26420@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 05 2016, Dan Carpenter wrote:
> We added a new error path to this function and we forgot to drop the
> lock.
>
> Fixes: e1e3d7ec5da3 ('usb: gadget: f_midi: pre-allocate IN requests')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Michal Nazarewicz <mina86@mina86.com>

> ---
> v2: Felipe asked for this to be fixed a different way.
>
> diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
> index fb1fe96d..7d28944 100644
> --- a/drivers/usb/gadget/function/f_midi.c
> +++ b/drivers/usb/gadget/function/f_midi.c
> @@ -1163,24 +1163,25 @@ static void f_midi_unbind(struct usb_configuration *c, struct usb_function *f)
>  
>  static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
>  {
> -	struct f_midi *midi;
> +	struct f_midi *midi = NULL;
>  	struct f_midi_opts *opts;
> -	int status, i;
> +	int status;
> +	int i = 0;
>  
>  	opts = container_of(fi, struct f_midi_opts, func_inst);
>  
>  	mutex_lock(&opts->lock);
>  	/* sanity check */
>  	if (opts->in_ports > MAX_PORTS || opts->out_ports > MAX_PORTS) {
> -		mutex_unlock(&opts->lock);
> -		return ERR_PTR(-EINVAL);
> +		status = -EINVAL;
> +		goto setup_fail;
>  	}
>  
>  	/* allocate and initialize one new instance */
>  	midi = kzalloc(sizeof(*midi), GFP_KERNEL);
>  	if (!midi) {
> -		mutex_unlock(&opts->lock);
> -		return ERR_PTR(-ENOMEM);
> +		status = -ENOMEM;
> +		goto setup_fail;
>  	}
>  
>  	for (i = 0; i < opts->in_ports; i++) {
> @@ -1188,7 +1189,6 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
>  
>  		if (!port) {
>  			status = -ENOMEM;
> -			mutex_unlock(&opts->lock);
>  			goto setup_fail;
>  		}
>  
> @@ -1202,7 +1202,6 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
>  	midi->id = kstrdup(opts->id, GFP_KERNEL);
>  	if (opts->id && !midi->id) {
>  		status = -ENOMEM;
> -		mutex_unlock(&opts->lock);
>  		goto setup_fail;
>  	}
>  	midi->in_ports = opts->in_ports;
> @@ -1229,6 +1228,7 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
>  	return &midi->func;
>  
>  setup_fail:
> +	mutex_unlock(&opts->lock);
>  	for (--i; i >= 0; i--)
>  		kfree(midi->in_port[i]);
>  	kfree(midi);

How about some refactoring first:

---- >8 ----------------------------------------------------------------
From 81220372e4acce8f1ffee00338c24472469c1abe Mon Sep 17 00:00:00 2001
From: Michal Nazarewicz <mina86@mina86.com>
Date: Tue, 5 Jan 2016 14:43:42 +0100
Subject: [PATCH 1/2] usb: gadget: f_midi: use flexible array member for
 gmidi_in_port elements

Reduce number of allocations, simplify memory management and reduce
memory usage by stacking the gmidi_in_port elements at the end of the
f_midi structure using a flexible array.

Also, observe that gmidi_in_port::midi pointer is *never* used for any
purpose so it can be safely removed.

Signed-off-by: Michal Nazarewicz <mina86@mina86.com>
---
 drivers/usb/gadget/function/f_midi.c | 42 ++++++++++++------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 898a570..9338625 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -55,7 +55,6 @@ static const char f_midi_longname[] = "MIDI Gadget";
  * USB <- IN endpoint  <- rawmidi
  */
 struct gmidi_in_port {
-	struct f_midi *midi;
 	int active;
 	uint8_t cable;
 	uint8_t state;
@@ -78,7 +77,6 @@ struct f_midi {
 
 	struct snd_rawmidi_substream *in_substream[MAX_PORTS];
 	struct snd_rawmidi_substream *out_substream[MAX_PORTS];
-	struct gmidi_in_port	*in_port[MAX_PORTS];
 
 	unsigned long		out_triggered;
 	struct tasklet_struct	tasklet;
@@ -87,6 +85,8 @@ struct f_midi {
 	int index;
 	char *id;
 	unsigned int buflen, qlen;
+
+	struct gmidi_in_port	in_ports_array[/* in_ports */];
 };
 
 static inline struct f_midi *func_to_midi(struct usb_function *f)
@@ -529,11 +529,11 @@ static void f_midi_transmit(struct f_midi *midi, struct usb_request *req)
 	req->length = 0;
 	req->complete = f_midi_complete;
 
-	for (i = 0; i < MAX_PORTS; i++) {
-		struct gmidi_in_port *port = midi->in_port[i];
+	for (i = 0; i < midi->in_ports; i++) {
+		struct gmidi_in_port *port = midi->in_ports_array + i;
 		struct snd_rawmidi_substream *substream = midi->in_substream[i];
 
-		if (!port || !port->active || !substream)
+		if (!port->active || !substream)
 			continue;
 
 		while (req->length + 3 < midi->buflen) {
@@ -568,12 +568,12 @@ static int f_midi_in_open(struct snd_rawmidi_substream *substream)
 {
 	struct f_midi *midi = substream->rmidi->private_data;
 
-	if (!midi->in_port[substream->number])
+	if (substream->number > midi->in_ports)
 		return -EINVAL;
 
 	VDBG(midi, "%s()\n", __func__);
 	midi->in_substream[substream->number] = substream;
-	midi->in_port[substream->number]->state = STATE_UNKNOWN;
+	midi->in_ports_array[substream->number].state = STATE_UNKNOWN;
 	return 0;
 }
 
@@ -589,11 +589,11 @@ static void f_midi_in_trigger(struct snd_rawmidi_substream *substream, int up)
 {
 	struct f_midi *midi = substream->rmidi->private_data;
 
-	if (!midi->in_port[substream->number])
+	if (substream->number > midi->in_ports)
 		return;
 
 	VDBG(midi, "%s() %d\n", __func__, up);
-	midi->in_port[substream->number]->active = up;
+	midi->in_ports_array[substream->number].active = up;
 	if (up)
 		tasklet_hi_schedule(&midi->tasklet);
 }
@@ -1073,8 +1073,6 @@ static void f_midi_free(struct usb_function *f)
 	opts = container_of(f->fi, struct f_midi_opts, func_inst);
 	kfree(midi->id);
 	mutex_lock(&opts->lock);
-	for (i = opts->in_ports - 1; i >= 0; --i)
-		kfree(midi->in_port[i]);
 	kfree(midi);
 	--opts->refcnt;
 	mutex_unlock(&opts->lock);
@@ -1115,26 +1113,16 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 	}
 
 	/* allocate and initialize one new instance */
-	midi = kzalloc(sizeof(*midi), GFP_KERNEL);
+	midi = kzalloc(
+		sizeof(*midi) + opts->in_ports * sizeof(*midi->in_ports_array),
+		GFP_KERNEL);
 	if (!midi) {
 		mutex_unlock(&opts->lock);
 		return ERR_PTR(-ENOMEM);
 	}
 
-	for (i = 0; i < opts->in_ports; i++) {
-		struct gmidi_in_port *port = kzalloc(sizeof(*port), GFP_KERNEL);
-
-		if (!port) {
-			status = -ENOMEM;
-			mutex_unlock(&opts->lock);
-			goto setup_fail;
-		}
-
-		port->midi = midi;
-		port->active = 0;
-		port->cable = i;
-		midi->in_port[i] = port;
-	}
+	for (i = 0; i < opts->in_ports; i++)
+		midi->in_ports_array[i].cable = i;
 
 	/* set up ALSA midi devices */
 	midi->id = kstrdup(opts->id, GFP_KERNEL);
@@ -1161,8 +1149,6 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 	return &midi->func;
 
 setup_fail:
-	for (--i; i >= 0; i--)
-		kfree(midi->in_port[i]);
 	kfree(midi);
 	return ERR_PTR(status);
 }
---- >8 ----------------------------------------------------------------
From 57bbb33864f7480c15dfeea627d3589775ca2491 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 5 Jan 2016 13:28:09 +0300
Subject: [PATCH 2/2] usb: gadget: f_midi: missing unlock on error path

We added a new error path to this function and we forgot to drop the
lock.

Fixes: e1e3d7ec5da3 ('usb: gadget: f_midi: pre-allocate IN requests')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
[mina86@mina86.com: rebased on top of refactoring patch!
Signed-off-by: Michal Nazarewicz <mina86@mina86.com>
---
 drivers/usb/gadget/function/f_midi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 9338625..de0bac5 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -1099,7 +1099,7 @@ static void f_midi_unbind(struct usb_configuration *c, struct usb_function *f)
 
 static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 {
-	struct f_midi *midi;
+	struct f_midi *midi = NULL;
 	struct f_midi_opts *opts;
 	int status, i;
 
@@ -1108,8 +1108,8 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 	mutex_lock(&opts->lock);
 	/* sanity check */
 	if (opts->in_ports > MAX_PORTS || opts->out_ports > MAX_PORTS) {
-		mutex_unlock(&opts->lock);
-		return ERR_PTR(-EINVAL);
+		status = -EINVAL;
+		goto setup_fail;
 	}
 
 	/* allocate and initialize one new instance */
@@ -1117,8 +1117,8 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 		sizeof(*midi) + opts->in_ports * sizeof(*midi->in_ports_array),
 		GFP_KERNEL);
 	if (!midi) {
-		mutex_unlock(&opts->lock);
-		return ERR_PTR(-ENOMEM);
+		status = -ENOMEM;
+		goto setup_fail;
 	}
 
 	for (i = 0; i < opts->in_ports; i++)
@@ -1128,7 +1128,6 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 	midi->id = kstrdup(opts->id, GFP_KERNEL);
 	if (opts->id && !midi->id) {
 		status = -ENOMEM;
-		mutex_unlock(&opts->lock);
 		goto setup_fail;
 	}
 	midi->in_ports = opts->in_ports;
@@ -1149,6 +1148,7 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 	return &midi->func;
 
 setup_fail:
+	mutex_unlock(&opts->lock);
 	kfree(midi);
 	return ERR_PTR(status);
 }

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  ミハウ “mina86” ナザレヴイツ  (o o)
ooo +--<mpn@google.com>--<xmpp:mina86@jabber.org>--ooO--(_)--Ooo--
