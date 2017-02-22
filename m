From: "Tobin C. Harding" <me@tobin.cc>
Date: Wed, 22 Feb 2017 06:47:16 +0000
Subject: [PATCH] ALSA: emu10k1: Remove cast from memory allocation
Message-Id: <1487746036-18181-1-git-send-email-me@tobin.cc>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Tobin C. Harding" <me@tobin.cc>

Coccinelle emits multiple WARNING: casting value returned by memory allocation
function to (u_int32_t __user *) is useless.

Remove unnecessary cast.

Signed-off-by: Tobin C. Harding <me@tobin.cc>
---
 sound/pci/emu10k1/emufx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 56fc47b..8a39a6f 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1186,8 +1186,8 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	if (!icode)
 		return err;
 
-	icode->gpr_map = (u_int32_t __user *) kcalloc(512 + 256 + 256 + 2 * 1024,
-						      sizeof(u_int32_t), GFP_KERNEL);
+	icode->gpr_map = kcalloc(512 + 256 + 256 + 2 * 1024,
+				sizeof(u_int32_t), GFP_KERNEL);
 	if (!icode->gpr_map)
 		goto __err_gpr;
 	controls = kcalloc(SND_EMU10K1_GPR_CONTROLS,
@@ -1824,8 +1824,8 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	if (!icode)
 		return err;
 
-	icode->gpr_map = (u_int32_t __user *) kcalloc(256 + 160 + 160 + 2 * 512,
-						      sizeof(u_int32_t), GFP_KERNEL);
+	icode->gpr_map = kcalloc(256 + 160 + 160 + 2 * 512,
+				sizeof(u_int32_t), GFP_KERNEL);
 	if (!icode->gpr_map)
 		goto __err_gpr;
 
-- 
2.7.4

