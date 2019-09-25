From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Sep 2019 11:10:23 +0000
Subject: [PATCH] ASoC: wcd9335: clean up indentation issue
Message-Id: <20190925111023.7771-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an if statement that is indented one level too deeply,
remove the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/wcd9335.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index f318403133e9..f11ffa28683b 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2837,11 +2837,11 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
 				   TX_HPF_CUT_OFF_FREQ_MASK) >> 5;
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg, 0x10, 0x10);
 		snd_soc_component_update_bits(comp, dec_cfg_reg, 0x08, 0x00);
-			if (hpf_coff_freq != CF_MIN_3DB_150HZ) {
-				snd_soc_component_update_bits(comp, dec_cfg_reg,
-						    TX_HPF_CUT_OFF_FREQ_MASK,
-						    hpf_coff_freq << 5);
-			}
+		if (hpf_coff_freq != CF_MIN_3DB_150HZ) {
+			snd_soc_component_update_bits(comp, dec_cfg_reg,
+						      TX_HPF_CUT_OFF_FREQ_MASK,
+						      hpf_coff_freq << 5);
+		}
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg, 0x10, 0x00);
-- 
2.20.1
