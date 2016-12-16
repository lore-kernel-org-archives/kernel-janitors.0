From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2016 09:33:59 +0000
Subject: [patch 3/3] spi: armada-3700: Remove unnecessary condition
Message-Id: <20161216093359.GB13942@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Romain Perier <romain.perier@free-electrons.com>
Cc: linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org

We checked that "a3700_spi->wait_mask & cause" was set at the beginning
of the function so we don't need to check again here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
index 5c7508dc6f0b..e98d464b3ff0 100644
--- a/drivers/spi/spi-armada-3700.c
+++ b/drivers/spi/spi-armada-3700.c
@@ -340,8 +340,7 @@ static irqreturn_t a3700_spi_interrupt(int irq, void *dev_id)
 	spireg_write(a3700_spi, A3700_SPI_INT_STAT_REG, cause);
 
 	/* Wake up the transfer */
-	if (a3700_spi->wait_mask & cause)
-		complete(&a3700_spi->done);
+	complete(&a3700_spi->done);
 
 	return IRQ_HANDLED;
 }
