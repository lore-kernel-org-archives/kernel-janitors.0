From: Dan Carpenter <error27@gmail.com>
Date: Fri, 19 Feb 2010 06:58:56 +0000
Subject: [patch] oxygen: clean up.  make precedence explicit
Message-Id: <20100219065856.GA17130@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>

This doesn't change anything, but I think it makes the code clearer.  
It silences a smatch warning:
sound/pci/oxygen/oxygen_mixer.c +91 dac_mute_put(7) warn: add some parenthesis here?

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested.

diff --git a/sound/pci/oxygen/oxygen_mixer.c b/sound/pci/oxygen/oxygen_mixer.c
index f375b8a..28590b9 100644
--- a/sound/pci/oxygen/oxygen_mixer.c
+++ b/sound/pci/oxygen/oxygen_mixer.c
@@ -88,7 +88,7 @@ static int dac_mute_put(struct snd_kcontrol *ctl,
 	int changed;
 
 	mutex_lock(&chip->mutex);
-	changed = !value->value.integer.value[0] != chip->dac_mute;
+	changed = (!value->value.integer.value[0]) != chip->dac_mute;
 	if (changed) {
 		chip->dac_mute = !value->value.integer.value[0];
 		chip->model.update_dac_mute(chip);
