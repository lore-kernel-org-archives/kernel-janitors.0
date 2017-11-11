From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 11:13:19 +0000
Subject: [PATCH 3/3] ALSA: rawmidi: Adjust 21 checks for null pointers
Message-Id: <51addc0f-81fe-1e55-347a-807b960c5430@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d4c89bda-5091-2d3c-ded1-ba2c3b061ff6@users.sourceforge.net>
In-Reply-To: <d4c89bda-5091-2d3c-ded1-ba2c3b061ff6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Fabian Frederick <fabf@skynet.be>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 11:48:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/core/rawmidi.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 34686000ecce..1934de257a1e 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -343,7 +343,7 @@ int snd_rawmidi_kernel_open(struct snd_card *card, int device, int subdevice,
 
 	mutex_lock(&register_mutex);
 	rmidi = snd_rawmidi_search(card, device);
-	if (rmidi = NULL) {
+	if (!rmidi) {
 		mutex_unlock(&register_mutex);
 		return -ENODEV;
 	}
@@ -391,7 +391,7 @@ static int snd_rawmidi_open(struct inode *inode, struct file *file)
 	} else
 		return -ENXIO;
 
-	if (rmidi = NULL)
+	if (!rmidi)
 		return -ENODEV;
 
 	if (!try_module_get(rmidi->card->module)) {
@@ -408,7 +408,7 @@ static int snd_rawmidi_open(struct inode *inode, struct file *file)
 	if ((file->f_flags & O_APPEND) || maj = SOUND_MAJOR) /* OSS emul? */
 		fflags |= SNDRV_RAWMIDI_LFLG_APPEND;
 	rawmidi_file = kmalloc(sizeof(*rawmidi_file), GFP_KERNEL);
-	if (rawmidi_file = NULL) {
+	if (!rawmidi_file) {
 		err = -ENOMEM;
 		goto __error;
 	}
@@ -552,7 +552,7 @@ static int snd_rawmidi_info(struct snd_rawmidi_substream *substream,
 {
 	struct snd_rawmidi *rmidi;
 	
-	if (substream = NULL)
+	if (!substream)
 		return -ENODEV;
 	rmidi = substream->rmidi;
 	memset(info, 0, sizeof(*info));
@@ -745,11 +745,11 @@ static long snd_rawmidi_ioctl(struct file *file, unsigned int cmd, unsigned long
 			return -EFAULT;
 		switch (params.stream) {
 		case SNDRV_RAWMIDI_STREAM_OUTPUT:
-			if (rfile->output = NULL)
+			if (!rfile->output)
 				return -EINVAL;
 			return snd_rawmidi_output_params(rfile->output, &params);
 		case SNDRV_RAWMIDI_STREAM_INPUT:
-			if (rfile->input = NULL)
+			if (!rfile->input)
 				return -EINVAL;
 			return snd_rawmidi_input_params(rfile->input, &params);
 		default:
@@ -764,12 +764,12 @@ static long snd_rawmidi_ioctl(struct file *file, unsigned int cmd, unsigned long
 			return -EFAULT;
 		switch (status.stream) {
 		case SNDRV_RAWMIDI_STREAM_OUTPUT:
-			if (rfile->output = NULL)
+			if (!rfile->output)
 				return -EINVAL;
 			err = snd_rawmidi_output_status(rfile->output, &status);
 			break;
 		case SNDRV_RAWMIDI_STREAM_INPUT:
-			if (rfile->input = NULL)
+			if (!rfile->input)
 				return -EINVAL;
 			err = snd_rawmidi_input_status(rfile->input, &status);
 			break;
@@ -789,7 +789,7 @@ static long snd_rawmidi_ioctl(struct file *file, unsigned int cmd, unsigned long
 			return -EFAULT;
 		switch (val) {
 		case SNDRV_RAWMIDI_STREAM_OUTPUT:
-			if (rfile->output = NULL)
+			if (!rfile->output)
 				return -EINVAL;
 			return snd_rawmidi_drop_output(rfile->output);
 		default:
@@ -803,11 +803,11 @@ static long snd_rawmidi_ioctl(struct file *file, unsigned int cmd, unsigned long
 			return -EFAULT;
 		switch (val) {
 		case SNDRV_RAWMIDI_STREAM_OUTPUT:
-			if (rfile->output = NULL)
+			if (!rfile->output)
 				return -EINVAL;
 			return snd_rawmidi_drain_output(rfile->output);
 		case SNDRV_RAWMIDI_STREAM_INPUT:
-			if (rfile->input = NULL)
+			if (!rfile->input)
 				return -EINVAL;
 			return snd_rawmidi_drain_input(rfile->input);
 		default:
@@ -885,7 +885,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 
 	if (!substream->opened)
 		return -EBADFD;
-	if (runtime->buffer = NULL) {
+	if (!runtime->buffer) {
 		rmidi_dbg(substream->rmidi,
 			  "snd_rawmidi_receive: input is not active!!!\n");
 		return -EINVAL;
@@ -999,7 +999,7 @@ static ssize_t snd_rawmidi_read(struct file *file, char __user *buf, size_t coun
 
 	rfile = file->private_data;
 	substream = rfile->input;
-	if (substream = NULL)
+	if (!substream)
 		return -EIO;
 	runtime = substream->runtime;
 	snd_rawmidi_input_trigger(substream, 1);
@@ -1052,7 +1052,7 @@ int snd_rawmidi_transmit_empty(struct snd_rawmidi_substream *substream)
 	int result;
 	unsigned long flags;
 
-	if (runtime->buffer = NULL) {
+	if (!runtime->buffer) {
 		rmidi_dbg(substream->rmidi,
 			  "snd_rawmidi_transmit_empty: output is not active!!!\n");
 		return 1;
@@ -1078,7 +1078,7 @@ int __snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
 	int result, count1;
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
 
-	if (runtime->buffer = NULL) {
+	if (!runtime->buffer) {
 		rmidi_dbg(substream->rmidi,
 			  "snd_rawmidi_transmit_peek: output is not active!!!\n");
 		return -EINVAL;
@@ -1151,7 +1151,7 @@ int __snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream, int coun
 {
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
 
-	if (runtime->buffer = NULL) {
+	if (!runtime->buffer) {
 		rmidi_dbg(substream->rmidi,
 			  "snd_rawmidi_transmit_ack: output is not active!!!\n");
 		return -EINVAL;
@@ -1369,21 +1369,21 @@ static unsigned int snd_rawmidi_poll(struct file *file, poll_table * wait)
 	unsigned int mask;
 
 	rfile = file->private_data;
-	if (rfile->input != NULL) {
+	if (rfile->input) {
 		runtime = rfile->input->runtime;
 		snd_rawmidi_input_trigger(rfile->input, 1);
 		poll_wait(file, &runtime->sleep, wait);
 	}
-	if (rfile->output != NULL) {
+	if (rfile->output) {
 		runtime = rfile->output->runtime;
 		poll_wait(file, &runtime->sleep, wait);
 	}
 	mask = 0;
-	if (rfile->input != NULL) {
+	if (rfile->input) {
 		if (snd_rawmidi_ready(rfile->input))
 			mask |= POLLIN | POLLRDNORM;
 	}
-	if (rfile->output != NULL) {
+	if (rfile->output) {
 		if (snd_rawmidi_ready(rfile->output))
 			mask |= POLLOUT | POLLWRNORM;
 	}
@@ -1547,7 +1547,7 @@ int snd_rawmidi_new(struct snd_card *card, char *id, int device,
 	INIT_LIST_HEAD(&rmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT].substreams);
 	INIT_LIST_HEAD(&rmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT].substreams);
 
-	if (id != NULL)
+	if (id)
 		strlcpy(rmidi->id, id, sizeof(rmidi->id));
 
 	snd_device_initialize(&rmidi->dev, card);
-- 
2.15.0

