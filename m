From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Dec 2020 10:13:21 +0000
Subject: [PATCH] ASoC: fsl: imx-hdmi: Fix an uninitialized return in probe
Message-Id: <X9NGQaF4pmK8oUAF@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo Li <Xiubo.Lee@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>

The "ret" variable should be set to a negative error code but
currently it returns uninitialized stack data.

Fixes: 6a5f850aa83a ("ASoC: fsl: Add imx-hdmi machine driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/fsl/imx-hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index 2c2a76a71940..ede4a9ad1054 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -164,6 +164,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 
 	if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
 		dev_err(&pdev->dev, "Invalid HDMI DAI link\n");
+		ret = -EINVAL;
 		goto fail;
 	}
 
-- 
2.29.2
