From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 12:28:38 +0000
Subject: [PATCH] mmc: cavium-octeon: Use devm_platform_ioremap_resource() in octeon_mmc_probe()
Message-Id: <4ad4cdb5-3623-4416-d3d2-b3c048a42139@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mmc@vger.kernel.org, David Daney <david.daney@cavium.com>, Jan Glauber <jglauber@cavium.com>, "Steven J. Hill" <Steven.Hill@cavium.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 14:20:34 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mmc/host/cavium-octeon.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-octeon.c
index 22aded1065ae..916746c6c2c7 100644
--- a/drivers/mmc/host/cavium-octeon.c
+++ b/drivers/mmc/host/cavium-octeon.c
@@ -148,7 +148,6 @@ static int octeon_mmc_probe(struct platform_device *pdev)
 {
 	struct device_node *cn, *node = pdev->dev.of_node;
 	struct cvm_mmc_host *host;
-	struct resource	*res;
 	void __iomem *base;
 	int mmc_irq[9];
 	int i, ret = 0;
@@ -205,23 +204,13 @@ static int octeon_mmc_probe(struct platform_device *pdev)

 	host->last_slot = -1;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Platform resource[0] is missing\n");
-		return -ENXIO;
-	}
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 	host->base = (void __iomem *)base;
 	host->reg_off = 0;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res) {
-		dev_err(&pdev->dev, "Platform resource[1] is missing\n");
-		return -EINVAL;
-	}
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 	host->dma_base = (void __iomem *)base;
--
2.23.0
