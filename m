From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Sep 2019 10:03:30 +0000
Subject: [PATCH] ASoC: rt5663: clean up indentation issues
Message-Id: <20190925100330.20695-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two break statements that are indented one level too deeply,
remove the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/rt5663.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 2943692f66ed..e6c1ec6c426e 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3644,7 +3644,7 @@ static int rt5663_i2c_probe(struct i2c_client *i2c,
 		regmap_update_bits(rt5663->regmap, RT5663_PWR_ANLG_1,
 			RT5663_LDO1_DVO_MASK | RT5663_AMP_HP_MASK,
 			RT5663_LDO1_DVO_0_9V | RT5663_AMP_HP_3X);
-			break;
+		break;
 	case CODEC_VER_0:
 		regmap_update_bits(rt5663->regmap, RT5663_DIG_MISC,
 			RT5663_DIG_GATE_CTRL_MASK, RT5663_DIG_GATE_CTRL_EN);
@@ -3663,7 +3663,7 @@ static int rt5663_i2c_probe(struct i2c_client *i2c,
 		regmap_update_bits(rt5663->regmap, RT5663_TDM_2,
 			RT5663_DATA_SWAP_ADCDAT1_MASK,
 			RT5663_DATA_SWAP_ADCDAT1_LL);
-			break;
+		break;
 	default:
 		dev_err(&i2c->dev, "%s:Unknown codec type\n", __func__);
 	}
-- 
2.20.1
