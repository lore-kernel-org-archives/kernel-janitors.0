From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 30 May 2020 20:19:52 +0000
Subject: [PATCH] pinctrl: imxl: Fix an error handling path in 'imx1_pinctrl_core_probe()'
Message-Id: <20200530201952.585798-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org, s.hauer@pengutronix.de, linux-imx@nxp.com, ldewangan@nvidia.com
Cc: linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

When 'pinctrl_register()' has been turned into 'devm_pinctrl_register()',
an error handling path has not been updated.

Axe a now unneeded 'pinctrl_unregister()'.

Fixes: e55e025d1687 ("pinctrl: imxl: Use devm_pinctrl_register() for pinctrl registration")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index 0c1c0e72fa8e..08d110078c43 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -638,7 +638,6 @@ int imx1_pinctrl_core_probe(struct platform_device *pdev,
 
 	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
 	if (ret) {
-		pinctrl_unregister(ipctl->pctl);
 		dev_err(&pdev->dev, "Failed to populate subdevices\n");
 		return ret;
 	}
-- 
2.25.1
