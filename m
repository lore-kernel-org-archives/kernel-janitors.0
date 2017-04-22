From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Apr 2017 12:28:42 +0000
Subject: [PATCH] ASoC: wm5100: fix spelling mistake: "micropone" -> "microphone"
Message-Id: <20170422122842.8282-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, patches@opensource.wolfsonmicro.com, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/wm5100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index 560575000cc5..138a84efdd54 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2014,7 +2014,7 @@ static void wm5100_micd_irq(struct wm5100_priv *wm5100)
 
 	ret = regmap_read(wm5100->regmap, WM5100_MIC_DETECT_3, &val);
 	if (ret != 0) {
-		dev_err(wm5100->dev, "Failed to read micropone status: %d\n",
+		dev_err(wm5100->dev, "Failed to read microphone status: %d\n",
 			ret);
 		return;
 	}
-- 
2.11.0

