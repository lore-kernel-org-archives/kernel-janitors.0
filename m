From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Aug 2017 14:00:26 +0000
Subject: [PATCH v2] ALSA: pcsp: Use common error handling code in snd_card_pcsp_probe()
Message-Id: <1b3cea97-e99e-ec7e-9b5c-0de728f8f383@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08ee0d6b-788b-2845-6964-e1e55c2d2292@users.sourceforge.net>
 <20170822121625.syvr64kwyh5xjexg@mwanda> <s5hziar9483.wl-tiwai@suse.de>
In-Reply-To: <s5hziar9483.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Dan Carpenter <dan.carpenter@oracle.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Aug 2017 15:50:53 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Do you find this refactoring acceptable instead?

 sound/drivers/pcsp/pcsp.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/drivers/pcsp/pcsp.c b/sound/drivers/pcsp/pcsp.c
index 72e2d0012084..fc83139fcfa2 100644
--- a/sound/drivers/pcsp/pcsp.c
+++ b/sound/drivers/pcsp/pcsp.c
@@ -108,22 +108,17 @@ static int snd_card_pcsp_probe(int devnum, struct device *dev)
 		return err;
 
 	err = snd_pcsp_create(card);
-	if (err < 0) {
-		snd_card_free(card);
-		return err;
-	}
+	if (err)
+		goto free_card;
+
 	if (!nopcm) {
 		err = snd_pcsp_new_pcm(&pcsp_chip);
-		if (err < 0) {
-			snd_card_free(card);
-			return err;
-		}
+		if (err)
+			goto free_card;
 	}
 	err = snd_pcsp_new_mixer(&pcsp_chip, nopcm);
-	if (err < 0) {
-		snd_card_free(card);
-		return err;
-	}
+	if (err)
+		goto free_card;
 
 	strcpy(card->driver, "PC-Speaker");
 	strcpy(card->shortname, "pcsp");
@@ -131,12 +126,13 @@ static int snd_card_pcsp_probe(int devnum, struct device *dev)
 		pcsp_chip.port);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
-		return err;
-	}
+	if (err)
+		goto free_card;
 
 	return 0;
+free_card:
+	snd_card_free(card);
+	return err;
 }
 
 static int alsa_card_pcsp_init(struct device *dev)
-- 
2.14.0

