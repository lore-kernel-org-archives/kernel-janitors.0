From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Dec 2016 11:22:50 +0000
Subject: [patch] ALSA: cs46xx: add a new line
Message-Id: <20161207112250.GD5507@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

We accidentally deleted a newline so now the "nreallocated++;" statement
is hanging out way off to the right of the screen.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/cs46xx/dsp_spos.c b/sound/pci/cs46xx/dsp_spos.c
index 4a0cbd2241d8..aa61615288ff 100644
--- a/sound/pci/cs46xx/dsp_spos.c
+++ b/sound/pci/cs46xx/dsp_spos.c
@@ -107,7 +107,8 @@ static int shadow_and_reallocate_code (struct snd_cs46xx * chip, u32 * data, u32
             
 						dev_dbg(chip->card->dev,
 							"handle_wideop:[2] %05x:%05x addr %04x\n",
-							hival, loval, address);						nreallocated++;
+							hival, loval, address);
+						nreallocated++;
 					} /* wide_opcodes[j] = wide_op */
 				} /* for */
 			} /* mod_type = 0 ... */
