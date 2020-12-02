From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Dec 2020 06:51:46 +0000
Subject: [PATCH] ASoC: codecs: lpass-va-macro: remove some dead code
Message-Id: <X8c5gjZO7YN/CFsq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

The "decimator" variable is in the 0-7 range and it's unsigned so there
is no need to check for negative values.

Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/lpass-va-macro.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 3e6bbef26dcb..91e6890d6efc 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -844,17 +844,10 @@ static int va_macro_hw_params(struct snd_pcm_substream *substream,
 
 	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
 			 VA_MACRO_DEC_MAX) {
-		if (decimator >= 0) {
-			tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
-				    VA_MACRO_TX_PATH_OFFSET * decimator;
-			snd_soc_component_update_bits(component, tx_fs_reg,
-						0x0F, tx_fs_rate);
-		} else {
-			dev_err(va_dev,
-				"%s: ERROR: Invalid decimator: %d\n",
-				__func__, decimator);
-			return -EINVAL;
-		}
+		tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
+			    VA_MACRO_TX_PATH_OFFSET * decimator;
+		snd_soc_component_update_bits(component, tx_fs_reg, 0x0F,
+					      tx_fs_rate);
 	}
 	return 0;
 }
-- 
2.29.2
