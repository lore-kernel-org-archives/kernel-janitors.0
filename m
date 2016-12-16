From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2016 09:33:25 +0000
Subject: [patch 2/3] spi: armada-3700: Set mode bits correctly
Message-Id: <20161216093325.GA13942@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Romain Perier <romain.perier-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We set SPI_RX_DUAL twice instead of setting SPI_TX_DUAL.

Fixes: 5762ab71eb24 ("spi: Add support for Armada 3700 SPI Controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
index 5c7508dc6f0b..40491be3365f 100644
--- a/drivers/spi/spi-armada-3700.c
+++ b/drivers/spi/spi-armada-3700.c
@@ -825,7 +825,7 @@ static int a3700_spi_probe(struct platform_device *pdev)
 	master->unprepare_message = a3700_spi_unprepare_message;
 	master->set_cs = a3700_spi_set_cs;
 	master->flags = SPI_MASTER_HALF_DUPLEX;
-	master->mode_bits |= (SPI_RX_DUAL | SPI_RX_DUAL |
+	master->mode_bits |= (SPI_RX_DUAL | SPI_TX_DUAL |
 			      SPI_RX_QUAD | SPI_TX_QUAD);
 
 	platform_set_drvdata(pdev, master);
