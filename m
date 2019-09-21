From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 15:57:24 +0000
Subject: [PATCH] EDAC: Armada XP: Use devm_platform_ioremap_resource() in two functions
Message-Id: <3cf2076e-6394-4997-613d-cbf5b6dbee1e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-edac@vger.kernel.org, Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>, =?UTF-8?Q?Jan_L=c3=bcbbe?= <jlu@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter <rrichter@marvell.com>, Tony Luck <tony.luck@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 17:50:17 +0200

Simplify these function implementations by using a known function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/edac/armada_xp_edac.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/edac/armada_xp_edac.c b/drivers/edac/armada_xp_edac.c
index 7f227bdcbc84..096d8de3893e 100644
--- a/drivers/edac/armada_xp_edac.c
+++ b/drivers/edac/armada_xp_edac.c
@@ -286,17 +286,10 @@ static int axp_mc_probe(struct platform_device *pdev)
 	struct edac_mc_layer layers[1];
 	const struct of_device_id *id;
 	struct mem_ctl_info *mci;
-	struct resource *r;
 	void __iomem *base;
 	uint32_t config;

-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "Unable to get mem resource\n");
-		return -ENODEV;
-	}
-
-	base = devm_ioremap_resource(&pdev->dev, r);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(&pdev->dev, "Unable to map regs\n");
 		return PTR_ERR(base);
@@ -516,15 +509,8 @@ static int aurora_l2_probe(struct platform_device *pdev)
 	const struct of_device_id *id;
 	uint32_t l2x0_aux_ctrl;
 	void __iomem *base;
-	struct resource *r;
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "Unable to get mem resource\n");
-		return -ENODEV;
-	}

-	base = devm_ioremap_resource(&pdev->dev, r);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(&pdev->dev, "Unable to map regs\n");
 		return PTR_ERR(base);
--
2.23.0
