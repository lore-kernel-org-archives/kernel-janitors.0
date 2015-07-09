From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Jul 2015 08:21:03 +0000
Subject: [patch] ASoC: fsl: fsl_spdif: signedness bug in fsl_spdif_startup()
Message-Id: <20150709082103.GA13462@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@tabi.org>, Fabio Estevam <fabio.estevam@freescale.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

We need "i" to be signed or it leads to a forever loop in the error
handling.

Fixes: fa3be9208dcb ('ASoC: fsl: fsl_spdif: Check for clk_prepare_enable() error')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 3ee4539..7a92f30 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -454,7 +454,8 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(rtd->cpu_dai);
 	struct platform_device *pdev = spdif_priv->pdev;
 	struct regmap *regmap = spdif_priv->regmap;
-	u32 scr, mask, i;
+	u32 scr, mask;
+	int i;
 	int ret;
 
 	/* Reset module and interrupts only for first initialization */
