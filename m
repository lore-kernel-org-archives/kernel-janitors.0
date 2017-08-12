From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 13:40:06 +0000
Subject: [PATCH 1/3] ALSA: rme96: Delete two error messages for a failed memory allocation in snd_rme96_probe
Message-Id: <523430da-d833-28dc-58dd-ea95b9f04149@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b38ee17e-f2ed-2bd7-6bc1-524ab4b3eb02@users.sourceforge.net>
In-Reply-To: <b38ee17e-f2ed-2bd7-6bc1-524ab4b3eb02@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Julia Lawall <Julia.Lawall@lip6.fr>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 14:24:41 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/pci/rme96.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 2e19ba55e754..82e8c78e48ca 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -2489,15 +2489,11 @@ snd_rme96_probe(struct pci_dev *pci,
 #ifdef CONFIG_PM_SLEEP
 	rme96->playback_suspend_buffer = vmalloc(RME96_BUFFER_SIZE);
 	if (!rme96->playback_suspend_buffer) {
-		dev_err(card->dev,
-			   "Failed to allocate playback suspend buffer!\n");
 		snd_card_free(card);
 		return -ENOMEM;
 	}
 	rme96->capture_suspend_buffer = vmalloc(RME96_BUFFER_SIZE);
 	if (!rme96->capture_suspend_buffer) {
-		dev_err(card->dev,
-			   "Failed to allocate capture suspend buffer!\n");
 		snd_card_free(card);
 		return -ENOMEM;
 	}
-- 
2.14.0

