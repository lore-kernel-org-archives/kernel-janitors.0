From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Feb 2021 20:05:01 +0000
Subject: [PATCH][next] ASoC: codecs: lpass-rx-macro: remove redundant initialization of variable hph_pwr_mode
Message-Id: <20210215200501.90697-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210215163313.84026-1-colin.king@canonical.com>
In-Reply-To: <20210215163313.84026-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable hph_pwr_mode is being initialized with a value that is
never read and it is being updated later with a new value.  The
initialization is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 8c04b3b2c907..76909c50d7b9 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2038,7 +2038,7 @@ static int rx_macro_load_compander_coeff(struct snd_soc_component *component,
 {
 	u16 comp_coeff_lsb_reg, comp_coeff_msb_reg;
 	int i;
-	int hph_pwr_mode = HPH_LOHIFI;
+	int hph_pwr_mode;
 
 	if (!rx->comp_enabled[comp])
 		return 0;
-- 
2.30.0
