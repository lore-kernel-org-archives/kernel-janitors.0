From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Apr 2017 09:15:41 +0000
Subject: [PATCH 05/10] pinctrl: imx: Use devm_kmalloc_array() in imx_pinctrl_probe()
Message-Id: <33fef6f9-0ab0-9cd9-201e-c37c53e7b798@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
In-Reply-To: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Gary Bisson <gary.bisson@boundarydevices.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Apr 2017 15:35:27 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "devm_kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 44dbf6e38d79..078875361d76 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -726,8 +726,10 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 	if (!ipctl)
 		return -ENOMEM;
 
-	info->pin_regs = devm_kmalloc(&pdev->dev, sizeof(*info->pin_regs) *
-				      info->npins, GFP_KERNEL);
+	info->pin_regs = devm_kmalloc_array(&pdev->dev,
+					    info->npins,
+					    sizeof(*info->pin_regs),
+					    GFP_KERNEL);
 	if (!info->pin_regs)
 		return -ENOMEM;
 
-- 
2.12.2

