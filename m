From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 09:54:44 +0000
Subject: [patch] ASoC: fsl: imx-wm8962: remove an unneeded check
Message-Id: <20131108095444.GM27977@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@the-dreams.de>, Takashi Iwai <tiwai@suse.de>, Nicolin Chen <b42378@freescale.com>, kernel-janitors@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Sachin Kamat <sachin.kamat@linaro.org>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>

"data->codec_clk" can't be an ERR_PTR here so I have removed the
superflous check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/fsl/imx-wm8962.c b/sound/soc/fsl/imx-wm8962.c
index a1deac6..61e4885 100644
--- a/sound/soc/fsl/imx-wm8962.c
+++ b/sound/soc/fsl/imx-wm8962.c
@@ -279,8 +279,7 @@ static int imx_wm8962_probe(struct platform_device *pdev)
 	return 0;
 
 clk_fail:
-	if (!IS_ERR(data->codec_clk))
-		clk_disable_unprepare(data->codec_clk);
+	clk_disable_unprepare(data->codec_clk);
 fail:
 	if (ssi_np)
 		of_node_put(ssi_np);
