From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Sep 2017 19:50:09 +0000
Subject: [PATCH 3/3] ALSA: ymfpci: Adjust 17 checks for null pointers
Message-Id: <35478693-5c8a-38b8-d2b3-fc8a964d5137@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dafe6d86-1bfd-41a8-e189-bde7ae30dea9@users.sourceforge.net>
In-Reply-To: <dafe6d86-1bfd-41a8-e189-bde7ae30dea9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Sep 2017 21:30:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/pci/ymfpci/ymfpci_main.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 8ca2e41e5827..4da6e43ad007 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -308,7 +308,7 @@ static void snd_ymfpci_pcm_interrupt(struct snd_ymfpci *chip, struct snd_ymfpci_
 	
 	if ((ypcm = voice->ypcm) = NULL)
 		return;
-	if (ypcm->substream = NULL)
+	if (!ypcm->substream)
 		return;
 	spin_lock(&chip->reg_lock);
 	if (ypcm->running) {
@@ -396,7 +396,7 @@ static int snd_ymfpci_playback_trigger(struct snd_pcm_substream *substream,
 	int result = 0;
 
 	spin_lock(&chip->reg_lock);
-	if (ypcm->voices[0] = NULL) {
+	if (!ypcm->voices[0]) {
 		result = -EINVAL;
 		goto __unlock;
 	}
@@ -405,7 +405,7 @@ static int snd_ymfpci_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		chip->ctrl_playback[ypcm->voices[0]->number + 1] = cpu_to_le32(ypcm->voices[0]->bank_addr);
-		if (ypcm->voices[1] != NULL && !ypcm->use_441_slot)
+		if (ypcm->voices[1] && !ypcm->use_441_slot)
 			chip->ctrl_playback[ypcm->voices[1]->number + 1] = cpu_to_le32(ypcm->voices[1]->bank_addr);
 		ypcm->running = 1;
 		break;
@@ -418,7 +418,7 @@ static int snd_ymfpci_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		chip->ctrl_playback[ypcm->voices[0]->number + 1] = 0;
-		if (ypcm->voices[1] != NULL && !ypcm->use_441_slot)
+		if (ypcm->voices[1] && !ypcm->use_441_slot)
 			chip->ctrl_playback[ypcm->voices[1]->number + 1] = 0;
 		ypcm->running = 0;
 		break;
@@ -468,16 +468,16 @@ static int snd_ymfpci_pcm_voice_alloc(struct snd_ymfpci_pcm *ypcm, int voices)
 {
 	int err;
 
-	if (ypcm->voices[1] != NULL && voices < 2) {
+	if (ypcm->voices[1] && voices < 2) {
 		snd_ymfpci_voice_free(ypcm->chip, ypcm->voices[1]);
 		ypcm->voices[1] = NULL;
 	}
-	if (voices = 1 && ypcm->voices[0] != NULL)
+	if (voices = 1 && ypcm->voices[0])
 		return 0;		/* already allocated */
-	if (voices = 2 && ypcm->voices[0] != NULL && ypcm->voices[1] != NULL)
+	if (voices = 2 && ypcm->voices[0] && ypcm->voices[1])
 		return 0;		/* already allocated */
 	if (voices > 1) {
-		if (ypcm->voices[0] != NULL && ypcm->voices[1] = NULL) {
+		if (ypcm->voices[0] && !ypcm->voices[1]) {
 			snd_ymfpci_voice_free(ypcm->chip, ypcm->voices[0]);
 			ypcm->voices[0] = NULL;
 		}		
@@ -655,7 +655,7 @@ static int snd_ymfpci_playback_hw_free(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_ymfpci_pcm *ypcm;
 	
-	if (runtime->private_data = NULL)
+	if (!runtime->private_data)
 		return 0;
 	ypcm = runtime->private_data;
 
@@ -913,7 +913,7 @@ static int snd_ymfpci_playback_open_1(struct snd_pcm_substream *substream)
 		return err;
 
 	ypcm = kzalloc(sizeof(*ypcm), GFP_KERNEL);
-	if (ypcm = NULL)
+	if (!ypcm)
 		return -ENOMEM;
 	ypcm->chip = chip;
 	ypcm->type = PLAYBACK_VOICE;
@@ -1038,7 +1038,7 @@ static int snd_ymfpci_capture_open(struct snd_pcm_substream *substream,
 		return err;
 
 	ypcm = kzalloc(sizeof(*ypcm), GFP_KERNEL);
-	if (ypcm = NULL)
+	if (!ypcm)
 		return -ENOMEM;
 	ypcm->chip = chip;
 	ypcm->type = capture_bank_number + CAPTURE_REC;
@@ -1116,7 +1116,7 @@ static int snd_ymfpci_capture_close(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_ymfpci_pcm *ypcm = runtime->private_data;
 
-	if (ypcm != NULL) {
+	if (ypcm) {
 		chip->capture_substream[ypcm->capture_bank_number] = NULL;
 		snd_ymfpci_hw_stop(chip);
 	}
@@ -1310,7 +1310,8 @@ static int snd_ymfpci_spdif_default_put(struct snd_kcontrol *kcontrol,
 	spin_lock_irq(&chip->reg_lock);
 	change = chip->spdif_bits != val;
 	chip->spdif_bits = val;
-	if ((snd_ymfpci_readw(chip, YDSXGR_SPDIFOUTCTRL) & 1) && chip->pcm_spdif = NULL)
+	if ((snd_ymfpci_readw(chip, YDSXGR_SPDIFOUTCTRL) & 1) &&
+	    !chip->pcm_spdif)
 		snd_ymfpci_writew(chip, YDSXGR_SPDIFOUTSTATUS, chip->spdif_bits);
 	spin_unlock_irq(&chip->reg_lock);
 	return change;
@@ -2376,7 +2377,7 @@ int snd_ymfpci_create(struct snd_card *card,
 		return err;
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip = NULL) {
+	if (!chip) {
 		pci_disable_device(pci);
 		return -ENOMEM;
 	}
@@ -2437,7 +2438,7 @@ int snd_ymfpci_create(struct snd_card *card,
 #ifdef CONFIG_PM_SLEEP
 	chip->saved_regs = kmalloc(YDSXGR_NUM_SAVED_REGS * sizeof(u32),
 				   GFP_KERNEL);
-	if (chip->saved_regs = NULL) {
+	if (!chip->saved_regs) {
 		err = -ENOMEM;
 		goto free_chip;
 	}
-- 
2.14.1

