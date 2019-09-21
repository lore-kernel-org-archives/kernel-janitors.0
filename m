From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 12:24:18 +0000
Subject: [PATCH] spi: lantiq-ssc: Use devm_platform_ioremap_resource() in lantiq_ssc_probe()
Message-Id: <230495a7-b754-bc6a-05e0-059a6b6c643d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 14:16:49 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spi-lantiq-ssc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/spi/spi-lantiq-ssc.c b/drivers/spi/spi-lantiq-ssc.c
index 9dfe8b04e688..1fd7ee53d451 100644
--- a/drivers/spi/spi-lantiq-ssc.c
+++ b/drivers/spi/spi-lantiq-ssc.c
@@ -797,7 +797,6 @@ static int lantiq_ssc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct spi_master *master;
-	struct resource *res;
 	struct lantiq_ssc_spi *spi;
 	const struct lantiq_ssc_hwcfg *hwcfg;
 	const struct of_device_id *match;
@@ -812,12 +811,6 @@ static int lantiq_ssc_probe(struct platform_device *pdev)
 	}
 	hwcfg = match->data;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get resources\n");
-		return -ENXIO;
-	}
-
 	rx_irq = platform_get_irq_byname(pdev, LTQ_SPI_RX_IRQ_NAME);
 	if (rx_irq < 0)
 		return -ENXIO;
@@ -839,8 +832,7 @@ static int lantiq_ssc_probe(struct platform_device *pdev)
 	spi->dev = dev;
 	spi->hwcfg = hwcfg;
 	platform_set_drvdata(pdev, spi);
-
-	spi->regbase = devm_ioremap_resource(dev, res);
+	spi->regbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spi->regbase)) {
 		err = PTR_ERR(spi->regbase);
 		goto err_master_put;
--
2.23.0
