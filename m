From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2015 15:37:23 +0000
Subject: [patch] ASoC: fsl: add an error check
Message-Id: <20150610153723.GB10549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@tabi.org>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org

My static checker complains that:

	sound/soc/fsl/imx-wm8962.c:196 imx_wm8962_probe() warn:
	we tested 'ret' before and it was 'false'

The intent was that we use "ret" to check imx_audmux_v2_configure_port().

Fixes: 8de2ae2a7f1f ('ASoC: fsl: add imx-wm8962 machine driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I assume checking for an error here will not change anything but I have
not tested this patch.

diff --git a/sound/soc/fsl/imx-wm8962.c b/sound/soc/fsl/imx-wm8962.c
index cd146d4..b38b98c 100644
--- a/sound/soc/fsl/imx-wm8962.c
+++ b/sound/soc/fsl/imx-wm8962.c
@@ -190,7 +190,7 @@ static int imx_wm8962_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "audmux internal port setup failed\n");
 		return ret;
 	}
-	imx_audmux_v2_configure_port(ext_port,
+	ret = imx_audmux_v2_configure_port(ext_port,
 			IMX_AUDMUX_V2_PTCR_SYN,
 			IMX_AUDMUX_V2_PDCR_RXDSEL(int_port));
 	if (ret) {
