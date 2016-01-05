From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2016 10:28:09 +0000
Subject: [patch v2] usb: gadget: f_midi: missing unlock on error path
Message-Id: <20160105102809.GA26420@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We added a new error path to this function and we forgot to drop the
lock.

Fixes: e1e3d7ec5da3 ('usb: gadget: f_midi: pre-allocate IN requests')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Felipe asked for this to be fixed a different way.

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index fb1fe96d..7d28944 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -1163,24 +1163,25 @@ static void f_midi_unbind(struct usb_configuration *c, struct usb_function *f)
 
 static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 {
-	struct f_midi *midi;
+	struct f_midi *midi = NULL;
 	struct f_midi_opts *opts;
-	int status, i;
+	int status;
+	int i = 0;
 
 	opts = container_of(fi, struct f_midi_opts, func_inst);
 
 	mutex_lock(&opts->lock);
 	/* sanity check */
 	if (opts->in_ports > MAX_PORTS || opts->out_ports > MAX_PORTS) {
-		mutex_unlock(&opts->lock);
-		return ERR_PTR(-EINVAL);
+		status = -EINVAL;
+		goto setup_fail;
 	}
 
 	/* allocate and initialize one new instance */
 	midi = kzalloc(sizeof(*midi), GFP_KERNEL);
 	if (!midi) {
-		mutex_unlock(&opts->lock);
-		return ERR_PTR(-ENOMEM);
+		status = -ENOMEM;
+		goto setup_fail;
 	}
 
 	for (i = 0; i < opts->in_ports; i++) {
@@ -1188,7 +1189,6 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 
 		if (!port) {
 			status = -ENOMEM;
-			mutex_unlock(&opts->lock);
 			goto setup_fail;
 		}
 
@@ -1202,7 +1202,6 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 	midi->id = kstrdup(opts->id, GFP_KERNEL);
 	if (opts->id && !midi->id) {
 		status = -ENOMEM;
-		mutex_unlock(&opts->lock);
 		goto setup_fail;
 	}
 	midi->in_ports = opts->in_ports;
@@ -1229,6 +1228,7 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 	return &midi->func;
 
 setup_fail:
+	mutex_unlock(&opts->lock);
 	for (--i; i >= 0; i--)
 		kfree(midi->in_port[i]);
 	kfree(midi);
