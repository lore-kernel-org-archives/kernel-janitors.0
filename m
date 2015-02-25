From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 13:31:43 +0000
Subject: [patch] sound/sb_ess: white space cleanups
Message-Id: <20150225133143.GP19745@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

These weren't aligned on the same lines as the surrounding code and the
printk was quite messy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/oss/sb_ess.c b/sound/oss/sb_ess.c
index b47a690..57f7d25 100644
--- a/sound/oss/sb_ess.c
+++ b/sound/oss/sb_ess.c
@@ -604,7 +604,7 @@ static void ess_audio_output_block_audio2
 	ess_chgmixer (devc, 0x78, 0x03, 0x03);   /* Go */
 
 	devc->irq_mode_16 = IMODE_OUTPUT;
-		devc->intr_active_16 = 1;
+	devc->intr_active_16 = 1;
 }
 
 static void ess_audio_output_block
@@ -1183,17 +1183,12 @@ FKS_test (devc);
 			chip = "ES1688";
 		}
 
-	    printk ( KERN_INFO "ESS chip %s %s%s\n"
-               , chip
-               , ( devc->sbmo.esstype = ESSTYPE_DETECT || devc->sbmo.esstype = ESSTYPE_LIKE20
-                 ? "detected"
-                 : "specified"
-                 )
-               , ( devc->sbmo.esstype = ESSTYPE_LIKE20
-                 ? " (kernel 2.0 compatible)"
-                 : ""
-                 )
-               );
+		printk(KERN_INFO "ESS chip %s %s%s\n", chip,
+		       (devc->sbmo.esstype = ESSTYPE_DETECT ||
+			devc->sbmo.esstype = ESSTYPE_LIKE20) ?
+				"detected" : "specified",
+			devc->sbmo.esstype = ESSTYPE_LIKE20 ?
+				" (kernel 2.0 compatible)" : "");
 
 		sprintf(name,"ESS %s AudioDrive (rev %d)", chip, ess_minor & 0x0f);
 	} else {
