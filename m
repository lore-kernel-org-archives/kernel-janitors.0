From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Feb 2021 16:33:13 +0000
Subject: [PATCH][next] ASoC: codecs: lpass-rx-macro: Fix uninitialized variable ec_tx
Message-Id: <20210215163313.84026-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is potential read of the uninitialized variable ec_tx if the call
to snd_soc_component_read fails or returns an unrecognized w->name. To
avoid this corner case, initialize ec_tx to -1 so that it is caught
later when ec_tx is bounds checked.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 4f692926f562 ("ASoC: codecs: lpass-rx-macro: add dapm widgets and route")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index c9c21d22c2c4..8c04b3b2c907 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2895,7 +2895,7 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	u16 val, ec_hq_reg;
-	int ec_tx;
+	int ec_tx = -1;
 
 	val = snd_soc_component_read(component,
 			CDC_RX_INP_MUX_RX_MIX_CFG4);
-- 
2.30.0
