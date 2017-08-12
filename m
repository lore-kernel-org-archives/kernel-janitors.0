From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 13:42:24 +0000
Subject: [PATCH 3/3] ALSA: rme96: Adjust five checks for null pointers
Message-Id: <9ae3600a-0a71-a957-15b2-f31e0ffab912@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b38ee17e-f2ed-2bd7-6bc1-524ab4b3eb02@users.sourceforge.net>
In-Reply-To: <b38ee17e-f2ed-2bd7-6bc1-524ab4b3eb02@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Julia Lawall <Julia.Lawall@lip6.fr>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 15:18:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/pci/rme96.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 0cdfd53b7796..b488d74c3b99 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -1199,7 +1199,7 @@ snd_rme96_playback_spdif_open(struct snd_pcm_substream *substream)
 
 	snd_pcm_set_sync(substream);
 	spin_lock_irq(&rme96->lock);	
-        if (rme96->playback_substream != NULL) {
+	if (rme96->playback_substream) {
 		spin_unlock_irq(&rme96->lock);
                 return -EBUSY;
         }
@@ -1248,7 +1248,7 @@ snd_rme96_capture_spdif_open(struct snd_pcm_substream *substream)
         }
         
 	spin_lock_irq(&rme96->lock);
-        if (rme96->capture_substream != NULL) {
+	if (rme96->capture_substream) {
 		spin_unlock_irq(&rme96->lock);
                 return -EBUSY;
         }
@@ -1268,7 +1268,7 @@ snd_rme96_playback_adat_open(struct snd_pcm_substream *substream)
 	
 	snd_pcm_set_sync(substream);
 	spin_lock_irq(&rme96->lock);	
-        if (rme96->playback_substream != NULL) {
+	if (rme96->playback_substream) {
 		spin_unlock_irq(&rme96->lock);
                 return -EBUSY;
         }
@@ -1315,7 +1315,7 @@ snd_rme96_capture_adat_open(struct snd_pcm_substream *substream)
         }
         
 	spin_lock_irq(&rme96->lock);	
-        if (rme96->capture_substream != NULL) {
+	if (rme96->capture_substream) {
 		spin_unlock_irq(&rme96->lock);
                 return -EBUSY;
         }
@@ -1578,9 +1578,9 @@ snd_rme96_free(void *private_data)
 {
 	struct rme96 *rme96 = (struct rme96 *)private_data;
 
-	if (rme96 = NULL) {
+	if (!rme96)
 	        return;
-	}
+
 	if (rme96->irq >= 0) {
 		snd_rme96_trigger(rme96, RME96_STOP_BOTH);
 		rme96->areg &= ~RME96_AR_DAC_EN;
-- 
2.14.0

