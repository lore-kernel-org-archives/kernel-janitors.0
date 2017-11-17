From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Nov 2017 09:51:40 +0000
Subject: [PATCH 4/4] ALSA: riptide: Use common error handling code in snd_riptide_create()
Message-Id: <855689e0-dc52-0669-7394-ec7151658115@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0eef2699-f28a-c1e0-9351-268b5eb7e0c1@users.sourceforge.net>
In-Reply-To: <0eef2699-f28a-c1e0-9351-268b5eb7e0c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, David Howells <dhowells@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Nov 2017 10:22:33 +0100

Add jump targets so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/pci/riptide/riptide.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 774fba5bba48..b1b834e1b614 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1878,8 +1878,7 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 		snd_printk(KERN_ERR
 			   "Riptide: unable to grab region 0x%lx-0x%lx\n",
 			   chip->port, chip->port + 64 - 1);
-		snd_riptide_free(chip);
-		return -EBUSY;
+		goto e_busy;
 	}
 	hwport = (struct riptideport *)chip->port;
 	UNSET_AIE(hwport);
@@ -1888,26 +1887,27 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 			KBUILD_MODNAME, chip)) {
 		snd_printk(KERN_ERR "Riptide: unable to grab IRQ %d\n",
 			   pci->irq);
-		snd_riptide_free(chip);
-		return -EBUSY;
+		goto e_busy;
 	}
 	chip->irq = pci->irq;
 	chip->device_id = pci->device;
 	pci_set_master(pci);
 	err = snd_riptide_initialize(chip);
-	if (err < 0) {
-		snd_riptide_free(chip);
-		return err;
-	}
+	if (err < 0)
+		goto free_sound_chip;
 
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_riptide_free(chip);
-		return err;
-	}
+	if (err < 0)
+		goto free_sound_chip;
 
 	*rchip = chip;
 	return 0;
+
+e_busy:
+	err = -EBUSY;
+free_sound_chip:
+	snd_riptide_free(chip);
+	return err;
 }
 
 static void
-- 
2.15.0

