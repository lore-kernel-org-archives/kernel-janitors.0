From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 13:19:28 +0000
Subject: [PATCH 3/3] ALSA: ml403-ac97cr: Adjust four checks for null pointers
Message-Id: <71f0710a-c884-4b3e-7e8e-6033a9142e3e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4c38a970-2407-3559-060d-501b8259b3fc@users.sourceforge.net>
In-Reply-To: <4c38a970-2407-3559-060d-501b8259b3fc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 14:04:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/drivers/ml403-ac97cr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/ml403-ac97cr.c b/sound/drivers/ml403-ac97cr.c
index 4cf964ea2802..d897175a63b2 100644
--- a/sound/drivers/ml403-ac97cr.c
+++ b/sound/drivers/ml403-ac97cr.c
@@ -533,7 +533,7 @@ snd_ml403_ac97cr_pcm_pointer(struct snd_pcm_substream *substream)
 	if (substream = ml403_ac97cr->capture_substream)
 		ind2_rec = &ml403_ac97cr->capture_ind2_rec;
 
-	if (ind2_rec != NULL)
+	if (ind2_rec)
 		return snd_pcm_indirect2_pointer(substream, ind2_rec);
 	return (snd_pcm_uframes_t) 0;
 }
@@ -788,7 +788,7 @@ static irqreturn_t snd_ml403_ac97cr_irq(int irq, void *dev_id)
 	int cmp_irq;
 
 	ml403_ac97cr = (struct snd_ml403_ac97cr *)dev_id;
-	if (ml403_ac97cr = NULL)
+	if (!ml403_ac97cr)
 		return IRQ_NONE;
 
 	pfdev = ml403_ac97cr->pfdev;
@@ -1120,7 +1120,7 @@ snd_ml403_ac97cr_create(struct snd_card *card, struct platform_device *pfdev,
 
 	*rml403_ac97cr = NULL;
 	ml403_ac97cr = kzalloc(sizeof(*ml403_ac97cr), GFP_KERNEL);
-	if (ml403_ac97cr = NULL)
+	if (!ml403_ac97cr)
 		return -ENOMEM;
 	spin_lock_init(&ml403_ac97cr->reg_lock);
 	mutex_init(&ml403_ac97cr->cdc_mutex);
@@ -1139,7 +1139,7 @@ snd_ml403_ac97cr_create(struct snd_card *card, struct platform_device *pfdev,
 	ml403_ac97cr->port = ioremap_nocache(resource->start,
 					     (resource->end) -
 					     (resource->start) + 1);
-	if (ml403_ac97cr->port = NULL) {
+	if (!ml403_ac97cr->port) {
 		snd_printk(KERN_ERR SND_ML403_AC97CR_DRIVER ": "
 			   "unable to remap memory region (%pR)\n",
 			   resource);
-- 
2.15.0

