From: Colin King <colin.king@canonical.com>
Date: Wed, 06 Jun 2018 09:35:04 +0000
Subject: [PATCH] ASoC: twl6040: make pointer dmic_codec_dev static
Message-Id: <20180606093504.30255-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer dmic_codec_dev is local to the source and does not need
to be in global scope, so make it static.

Cleans up sparse warning:
warning: symbol 'dmic_codec_dev' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/omap/omap-abe-twl6040.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/omap/omap-abe-twl6040.c b/sound/soc/omap/omap-abe-twl6040.c
index 15ccbf479c96..d5ae9eb8c756 100644
--- a/sound/soc/omap/omap-abe-twl6040.c
+++ b/sound/soc/omap/omap-abe-twl6040.c
@@ -40,7 +40,7 @@ struct abe_twl6040 {
 	int	mclk_freq;	/* MCLK frequency speed for twl6040 */
 };
 
-struct platform_device *dmic_codec_dev;
+static struct platform_device *dmic_codec_dev;
 
 static int omap_abe_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
-- 
2.17.0

