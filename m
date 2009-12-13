From: Julia Lawall <julia@diku.dk>
Date: Sun, 13 Dec 2009 11:43:15 +0000
Subject: [PATCH 9/9] sound/soc/codecs: Correct code taking the size of a
Message-Id: <Pine.LNX.4.64.0912131242570.24267@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@slimlogic.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, lin

From: Julia Lawall <julia@diku.dk>

sizeof(codec->reg_cache) is just the size of the pointer.  Elsewhere in the
file, codec->reg_cache is used with sizeof(wm8900_reg_defaults), so the
code is changed to do the same here.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *x;
expression f;
type T;
@@

*f(...,(T)x,...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 sound/soc/codecs/wm8900.c           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index c9438dd..dbc368c 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -199,7 +199,7 @@ static void wm8900_reset(struct snd_soc_codec *codec)
 	snd_soc_write(codec, WM8900_REG_RESET, 0);
 
 	memcpy(codec->reg_cache, wm8900_reg_defaults,
-	       sizeof(codec->reg_cache));
+	       sizeof(wm8900_reg_defaults));
 }
 
 static int wm8900_hp_event(struct snd_soc_dapm_widget *w,
