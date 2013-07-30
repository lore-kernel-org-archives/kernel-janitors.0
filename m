From: Emil Goode <emilgoode@gmail.com>
Date: Tue, 30 Jul 2013 17:35:35 +0000
Subject: [PATCH 1/3] spi/spi-atmel: Fix format specifier warnings
Message-Id: <1375205737-3468-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following sparse warnings.
dma_addr_t can be either u32 or u64 so we should cast to the
largest type and use the format specifier %llx.

drivers/spi/spi-atmel.c: In function ‘atmel_spi_next_xfer_dma_submit’:
drivers/spi/spi-atmel.c:631:2: warning:
	format ‘%x’ expects argument of type ‘unsigned int’,
	but argument 7 has type ‘dma_addr_t’ [-Wformat]
drivers/spi/spi-atmel.c:631:2: warning:
	format ‘%x’ expects argument of type ‘unsigned int’,
	but argument 9 has type ‘dma_addr_t’ [-Wformat]
drivers/spi/spi-atmel.c: In function ‘atmel_spi_pdc_next_xfer’:
drivers/spi/spi-atmel.c:734:3: warning:
	format ‘%x’ expects argument of type ‘unsigned int’,
	but argument 7 has type ‘dma_addr_t’ [-Wformat]
drivers/spi/spi-atmel.c:734:3: warning:
	format ‘%x’ expects argument of type ‘unsigned int’,
	but argument 9 has type ‘dma_addr_t’ [-Wformat]
drivers/spi/spi-atmel.c:773:3: warning:
	format ‘%x’ expects argument of type ‘unsigned int’,
	but argument 7 has type ‘dma_addr_t’ [-Wformat]
drivers/spi/spi-atmel.c:773:3: warning:
	format ‘%x’ expects argument of type ‘unsigned int’,
	but argument 9 has type ‘dma_addr_t’ [-Wformat]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/spi/spi-atmel.c |   20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 4e40693..fd7cc56 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -629,9 +629,9 @@ static int atmel_spi_next_xfer_dma_submit(struct spi_master *master,
 		goto err_dma;
 
 	dev_dbg(master->dev.parent,
-		"  start dma xfer %p: len %u tx %p/%08x rx %p/%08x\n",
-		xfer, xfer->len, xfer->tx_buf, xfer->tx_dma,
-		xfer->rx_buf, xfer->rx_dma);
+		"  start dma xfer %p: len %u tx %p/%08llx rx %p/%08llx\n",
+		xfer, xfer->len, xfer->tx_buf, (unsigned long long)xfer->tx_dma,
+		xfer->rx_buf, (unsigned long long)xfer->rx_dma);
 
 	/* Enable relevant interrupts */
 	spi_writel(as, IER, SPI_BIT(OVRES));
@@ -732,9 +732,10 @@ static void atmel_spi_pdc_next_xfer(struct spi_master *master,
 		spi_writel(as, TCR, len);
 
 		dev_dbg(&msg->spi->dev,
-			"  start xfer %p: len %u tx %p/%08x rx %p/%08x\n",
-			xfer, xfer->len, xfer->tx_buf, xfer->tx_dma,
-			xfer->rx_buf, xfer->rx_dma);
+			"  start xfer %p: len %u tx %p/%08llx rx %p/%08llx\n",
+			xfer, xfer->len, xfer->tx_buf,
+			(unsigned long long)xfer->tx_dma, xfer->rx_buf,
+			(unsigned long long)xfer->rx_dma);
 	} else {
 		xfer = as->next_transfer;
 		remaining = as->next_remaining_bytes;
@@ -771,9 +772,10 @@ static void atmel_spi_pdc_next_xfer(struct spi_master *master,
 		spi_writel(as, TNCR, len);
 
 		dev_dbg(&msg->spi->dev,
-			"  next xfer %p: len %u tx %p/%08x rx %p/%08x\n",
-			xfer, xfer->len, xfer->tx_buf, xfer->tx_dma,
-			xfer->rx_buf, xfer->rx_dma);
+			"  next xfer %p: len %u tx %p/%08llx rx %p/%08llx\n",
+			xfer, xfer->len, xfer->tx_buf,
+			(unsigned long long)xfer->tx_dma, xfer->rx_buf,
+			(unsigned long long)xfer->rx_dma);
 		ieval = SPI_BIT(ENDRX) | SPI_BIT(OVRES);
 	} else {
 		spi_writel(as, RNCR, 0);
-- 
1.7.10.4

