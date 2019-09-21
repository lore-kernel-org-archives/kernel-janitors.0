From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 13:40:38 +0000
Subject: [PATCH] spi: xtensa-xtfpga: Use devm_platform_ioremap_resource() in xtfpga_spi_probe()
Message-Id: <178bb78e-714f-645f-d819-5732870c4272@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 15:35:08 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spi-xtensa-xtfpga.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/spi/spi-xtensa-xtfpga.c b/drivers/spi/spi-xtensa-xtfpga.c
index 86516eb1e143..fc2b5eb7d614 100644
--- a/drivers/spi/spi-xtensa-xtfpga.c
+++ b/drivers/spi/spi-xtensa-xtfpga.c
@@ -80,7 +80,6 @@ static void xtfpga_spi_chipselect(struct spi_device *spi, int is_on)
 static int xtfpga_spi_probe(struct platform_device *pdev)
 {
 	struct xtfpga_spi *xspi;
-	struct resource *mem;
 	int ret;
 	struct spi_master *master;

@@ -97,14 +96,7 @@ static int xtfpga_spi_probe(struct platform_device *pdev)
 	xspi->bitbang.master = master;
 	xspi->bitbang.chipselect = xtfpga_spi_chipselect;
 	xspi->bitbang.txrx_word[SPI_MODE_0] = xtfpga_spi_txrx_word;
-
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem) {
-		dev_err(&pdev->dev, "No memory resource\n");
-		ret = -ENODEV;
-		goto err;
-	}
-	xspi->regs = devm_ioremap_resource(&pdev->dev, mem);
+	xspi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(xspi->regs)) {
 		ret = PTR_ERR(xspi->regs);
 		goto err;
--
2.23.0
