From: Dan Carpenter <error27@gmail.com>
Date: Thu, 26 May 2011 08:47:35 +0000
Subject: [patch] ALSA: fm801: add error handling if auto-detect fails
Message-Id: <20110526084735.GC14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Ondrej Zary <linux@rainbow-software.org>

In the original code if auto detect failed and tea575x_tuner = 4
then we copy bogus information to chip->tea.card.  I've changed the
autodetect code to cleanup and return -ENODEV on error instead.

I made the previous chunk return on error as well.  Potentially the
hardware should limp along without the radio?  I don't know this
hardware well enough to say.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index eacd490..a7ec703 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1234,9 +1234,12 @@ static int __devinit snd_fm801_create(struct snd_card *card,
 	sprintf(chip->tea.bus_info, "PCI:%s", pci_name(pci));
 	if ((tea575x_tuner & TUNER_TYPE_MASK) > 0 &&
 	    (tea575x_tuner & TUNER_TYPE_MASK) < 4) {
-		if (snd_tea575x_init(&chip->tea))
+		if (snd_tea575x_init(&chip->tea)) {
 			snd_printk(KERN_ERR "TEA575x radio not found\n");
-	} else if ((tea575x_tuner & TUNER_TYPE_MASK) = 0)
+			snd_fm801_free(chip);
+			return -ENODEV;
+		}
+	} else if ((tea575x_tuner & TUNER_TYPE_MASK) = 0) {
 		/* autodetect tuner connection */
 		for (tea575x_tuner = 1; tea575x_tuner <= 3; tea575x_tuner++) {
 			chip->tea575x_tuner = tea575x_tuner;
@@ -1246,6 +1249,12 @@ static int __devinit snd_fm801_create(struct snd_card *card,
 				break;
 			}
 		}
+		if (tea575x_tuner = 4) {
+			snd_printk(KERN_ERR "TEA575x radio not found\n");
+			snd_fm801_free(chip);
+			return -ENODEV;
+		}
+	}
 	strlcpy(chip->tea.card, snd_fm801_tea575x_gpios[(tea575x_tuner & TUNER_TYPE_MASK) - 1].name, sizeof(chip->tea.card));
 #endif
 
