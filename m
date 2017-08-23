From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Aug 2017 08:25:49 +0000
Subject: [PATCH 3/6] ALSA: pcm: Adjust 11 checks for null pointers
Message-Id: <fc79090d-7ed8-9083-4726-29769e0ef8d8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b8c9e41b-a47e-1d99-3d1a-5d39772e4b54@users.sourceforge.net>
 <s5h378isw2d.wl-tiwai@suse.de>
 <800d7aa6-d8f2-cbf5-caaa-7e4006976e68@users.sourceforge.net>
In-Reply-To: <800d7aa6-d8f2-cbf5-caaa-7e4006976e68@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Vegard Nossum <vegard.nossum@oracle.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Aug 2017 09:28:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/core/pcm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index c790f79e45ae..24047a07dc7f 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -132,7 +132,7 @@ static int snd_pcm_control_ioctl(struct snd_card *card,
 				return -EFAULT;
 			mutex_lock(&register_mutex);
 			pcm = snd_pcm_get(card, device);
-			if (pcm = NULL) {
+			if (!pcm) {
 				err = -ENXIO;
 				goto _error;
 			}
@@ -149,7 +149,7 @@ static int snd_pcm_control_ioctl(struct snd_card *card,
 			     substream = substream->next)
 				if (substream->number = (int)subdevice)
 					break;
-			if (substream = NULL) {
+			if (!substream) {
 				err = -ENXIO;
 				goto _error;
 			}
@@ -733,7 +733,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 		substream->stream = stream;
 		sprintf(substream->name, "subdevice #%i", idx);
 		substream->buffer_bytes_max = UINT_MAX;
-		if (prev = NULL)
+		if (!prev)
 			pstr->substream = substream;
 		else
 			prev->next = substream;
@@ -743,7 +743,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 			if (err < 0) {
 				pcm_err(pcm,
 					"Error in snd_pcm_stream_proc_init\n");
-				if (prev = NULL)
+				if (!prev)
 					pstr->substream = NULL;
 				else
 					prev->next = NULL;
@@ -951,7 +951,7 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 		return -EINVAL;
 	*rsubstream = NULL;
 	pstr = &pcm->streams[stream];
-	if (pstr->substream = NULL || pstr->substream_count = 0)
+	if (!pstr->substream || pstr->substream_count = 0)
 		return -ENODEV;
 
 	card = pcm->card;
@@ -993,16 +993,16 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 		     substream->number = prefer_subdevice))
 			break;
 	}
-	if (substream = NULL)
+	if (!substream)
 		return -EAGAIN;
 
 	runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
-	if (runtime = NULL)
+	if (!runtime)
 		return -ENOMEM;
 
 	size = PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status));
 	runtime->status = snd_malloc_pages(size, GFP_KERNEL);
-	if (runtime->status = NULL) {
+	if (!runtime->status) {
 		kfree(runtime);
 		return -ENOMEM;
 	}
@@ -1010,7 +1010,7 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 
 	size = PAGE_ALIGN(sizeof(struct snd_pcm_mmap_control));
 	runtime->control = snd_malloc_pages(size, GFP_KERNEL);
-	if (runtime->control = NULL) {
+	if (!runtime->control) {
 		snd_free_pages((void*)runtime->status,
 			       PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status)));
 		kfree(runtime);
@@ -1040,7 +1040,7 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 	if (PCM_RUNTIME_CHECK(substream))
 		return;
 	runtime = substream->runtime;
-	if (runtime->private_free != NULL)
+	if (runtime->private_free)
 		runtime->private_free(runtime);
 	snd_free_pages((void*)runtime->status,
 		       PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status)));
@@ -1107,7 +1107,7 @@ static int snd_pcm_dev_register(struct snd_device *device)
 		goto unlock;
 	for (cidx = 0; cidx < 2; cidx++) {
 		int devtype = -1;
-		if (pcm->streams[cidx].substream = NULL)
+		if (!pcm->streams[cidx].substream)
 			continue;
 		switch (cidx) {
 		case SNDRV_PCM_STREAM_PLAYBACK:
-- 
2.14.0

