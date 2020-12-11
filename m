From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Dec 2020 10:10:11 +0000
Subject: [PATCH] ASoC: mediatek: mt8183: delete some unreachable code
Message-Id: <X9NFg3KVm16Gx6Io@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>

This has a goto followed by an unreachable return statement.  The goto
is correct because it cleans up so the current runtime behavior is fine.
Let's delete the unreachable return statement.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 48e81c5d52fc..cc4f8f4d3dab 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -584,7 +584,6 @@ int mt8183_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			__func__, aud_clks[div_clk_id],
 			rate, ret);
 		goto ERR_SET_MCLK_RATE;
-		return ret;
 	}
 
 	return 0;
-- 
2.29.2
