From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 Aug 2012 09:22:58 +0000
Subject: [patch] ALSA: cs46xx - signedness bug in snd_cs46xx_codec_read()
Message-Id: <20120810092258.GA26875@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

This function returns its own error codes instead of normal negative
error codes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index f75f5ff..a71d1c1 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -94,7 +94,7 @@ static unsigned short snd_cs46xx_codec_read(struct snd_cs46xx *chip,
 
 	if (snd_BUG_ON(codec_index != CS46XX_PRIMARY_CODEC_INDEX &&
 		       codec_index != CS46XX_SECONDARY_CODEC_INDEX))
-		return -EINVAL;
+		return 0xffff;
 
 	chip->active_ctrl(chip, 1);
 
