From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 30 May 2020 20:49:55 +0000
Subject: [PATCH] pinctrl: freescale: imx: Fix an error handling path in 'imx_pinctrl_probe()'
Message-Id: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org, s.hauer@pengutronix.de, linux-imx@nxp.com, gary.bisson@boundarydevices.com
Cc: linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

'pinctrl_unregister()' should not be called to undo
'devm_pinctrl_register_and_init()', it is already handled by the framework.

This simplifies the error handling paths of the probe function.
The 'imx_free_resources()' can be removed as well.

Fixes: a51c158bf0f7 ("pinctrl: imx: use radix trees for groups and functions")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9f42036c5fbb..1f81569c7ae3 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -774,16 +774,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 	return 0;
 }
 
-/*
- * imx_free_resources() - free memory used by this driver
- * @info: info driver instance
- */
-static void imx_free_resources(struct imx_pinctrl *ipctl)
-{
-	if (ipctl->pctl)
-		pinctrl_unregister(ipctl->pctl);
-}
-
 int imx_pinctrl_probe(struct platform_device *pdev,
 		      const struct imx_pinctrl_soc_info *info)
 {
@@ -874,23 +864,18 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 					     &ipctl->pctl);
 	if (ret) {
 		dev_err(&pdev->dev, "could not register IMX pinctrl driver\n");
-		goto free;
+		return ret;
 	}
 
 	ret = imx_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {
 		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		goto free;
+		return ret;
 	}
 
 	dev_info(&pdev->dev, "initialized IMX pinctrl driver\n");
 
 	return pinctrl_enable(ipctl->pctl);
-
-free:
-	imx_free_resources(ipctl);
-
-	return ret;
 }
 
 static int __maybe_unused imx_pinctrl_suspend(struct device *dev)
-- 
2.25.1
