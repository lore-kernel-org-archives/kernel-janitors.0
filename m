From: Colin King <colin.king@canonical.com>
Date: Fri, 30 Jun 2017 09:50:59 +0000
Subject: [PATCH] ASoC: rsnd: make arrays path and cmd_case static const
Message-Id: <20170630095059.8847-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the arrays path and cmd_case on the stack but make
them static const.  Makes the object code smaller:

Before:
   text    data     bss     dec     hex filename
   2673     624       0    3297     ce1 sound/soc/sh/rcar/cmd.o

After:
   text    data     bss     dec     hex filename
   2398     768       0    3166     c5e sound/soc/sh/rcar/cmd.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/sh/rcar/cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/cmd.c b/sound/soc/sh/rcar/cmd.c
index 9a136d86e2a9..f1d4fb566892 100644
--- a/sound/soc/sh/rcar/cmd.c
+++ b/sound/soc/sh/rcar/cmd.c
@@ -31,7 +31,7 @@ static int rsnd_cmd_init(struct rsnd_mod *mod,
 	struct rsnd_mod *mix = rsnd_io_to_mod_mix(io);
 	struct device *dev = rsnd_priv_to_dev(priv);
 	u32 data;
-	u32 path[] = {
+	static const u32 path[] = {
 		[1] = 1 << 0,
 		[5] = 1 << 8,
 		[6] = 1 << 12,
@@ -71,7 +71,7 @@ static int rsnd_cmd_init(struct rsnd_mod *mod,
 	} else {
 		struct rsnd_mod *src = rsnd_io_to_mod_src(io);
 
-		u8 cmd_case[] = {
+		static const u8 cmd_case[] = {
 			[0] = 0x3,
 			[1] = 0x3,
 			[2] = 0x4,
-- 
2.11.0

