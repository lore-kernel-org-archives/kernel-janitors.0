From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 18:02:14 +0000
Subject: [PATCH] ALSA: opl3: Delete an error message for a failed memory allocation in snd_opl3_new()
Message-Id: <5991f20d-dbad-a916-76be-375ade7de737@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Fabian Frederick <fabf@skynet.be>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 19:54:20 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/drivers/opl3/opl3_lib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/drivers/opl3/opl3_lib.c b/sound/drivers/opl3/opl3_lib.c
index d5e5b4657b4b..588963d6be28 100644
--- a/sound/drivers/opl3/opl3_lib.c
+++ b/sound/drivers/opl3/opl3_lib.c
@@ -355,10 +355,8 @@ int snd_opl3_new(struct snd_card *card,
 
 	*ropl3 = NULL;
 	opl3 = kzalloc(sizeof(*opl3), GFP_KERNEL);
-	if (opl3 = NULL) {
-		snd_printk(KERN_ERR "opl3: cannot allocate\n");
+	if (!opl3)
 		return -ENOMEM;
-	}
 
 	opl3->card = card;
 	opl3->hardware = hardware;
-- 
2.14.0

