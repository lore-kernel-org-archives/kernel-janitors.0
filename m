From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Aug 2018 13:47:56 +0000
Subject: [PATCH] [ALSA] sound/isa/gus: fix spelling mistake "acumulator" -> "accumulator"
Message-Id: <20180803134756.2889-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial spelling mistake fix in debug message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/isa/gus/gus_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/gus/gus_io.c b/sound/isa/gus/gus_io.c
index ca79878d8d8c..2fd32ef22c30 100644
--- a/sound/isa/gus/gus_io.c
+++ b/sound/isa/gus/gus_io.c
@@ -461,7 +461,7 @@ void snd_gf1_print_voice_registers(struct snd_gus_card * gus)
 			printk(KERN_INFO " -%i- GFA1 effect address         = 0x%x\n", voice, snd_gf1_i_read_addr(gus, 0x11, ctrl & 4));
 			printk(KERN_INFO " -%i- GFA1 effect volume          = 0x%x\n", voice, snd_gf1_i_read16(gus, 0x16));
 			printk(KERN_INFO " -%i- GFA1 effect volume final    = 0x%x\n", voice, snd_gf1_i_read16(gus, 0x1d));
-			printk(KERN_INFO " -%i- GFA1 effect acumulator      = 0x%x\n", voice, snd_gf1_i_read8(gus, 0x14));
+			printk(KERN_INFO " -%i- GFA1 effect accumulator     = 0x%x\n", voice, snd_gf1_i_read8(gus, 0x14));
 		}
 		if (mode & 0x20) {
 			printk(KERN_INFO " -%i- GFA1 left offset            = 0x%x (%i)\n", voice, snd_gf1_i_read16(gus, 0x13), snd_gf1_i_read16(gus, 0x13) >> 4);
-- 
2.17.1

