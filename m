From: Tobias Klauser <tklauser@xenon.tklauser.home>
Date: Sat, 12 Aug 2006 22:09:24 +0000
Subject: [KJ] [PATCH] sound/sparc/dbri: Use ARRAY_SIZE macro
Message-Id: <20060812220924.GA4765@neon.tklauser.home>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0])

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 sound/sparc/dbri.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index f3ae6e2..f5475f9 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -2452,8 +2452,6 @@ static struct snd_kcontrol_new dbri_cont
 	CS4215_SINGLE("Mic boost", 4, 4, 1, 1)
 };
 
-#define NUM_CS4215_CONTROLS (sizeof(dbri_controls)/sizeof(struct snd_kcontrol_new))
-
 static int __init snd_dbri_mixer(struct snd_dbri * dbri)
 {
 	struct snd_card *card;
@@ -2464,7 +2462,7 @@ static int __init snd_dbri_mixer(struct 
 	card = dbri->card;
 	strcpy(card->mixername, card->shortname);
 
-	for (idx = 0; idx < NUM_CS4215_CONTROLS; idx++) {
+	for (idx = 0; idx < ARRAY_SIZE(dbri_controls); idx++) {
 		if ((err = snd_ctl_add(card,
 				snd_ctl_new1(&dbri_controls[idx], dbri))) < 0)
 			return err;
-- 
1.4.1

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
