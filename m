From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 16:28:06 +0000
Subject: [PATCH] ALSA: pcxhr: Delete an error message for a failed memory allocation in pcxhr_create()
Message-Id: <f30e314b-4666-2880-8051-976c631b3718@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>, Julia Lawall <Julia.Lawall@lip6.fr>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 18:14:54 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/pci/pcxhr/pcxhr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index fa919f52e225..376fd76caec2 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -1215,10 +1215,8 @@ static int pcxhr_create(struct pcxhr_mgr *mgr,
 	};
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (! chip) {
-		dev_err(card->dev, "cannot allocate chip\n");
+	if (!chip)
 		return -ENOMEM;
-	}
 
 	chip->card = card;
 	chip->chip_idx = idx;
-- 
2.14.0

