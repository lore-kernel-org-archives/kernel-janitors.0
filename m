From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 May 2020 12:56:07 +0000
Subject: [PATCH -next] spi: bcm2835: Fix error return code in bcm2835_dma_init()
Message-Id: <20200506125607.90952-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org

Fix to return negative error code -ENOMEM from the dma mapping error
handling case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/spi/spi-bcm2835.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index 11c235879bb7..c4f4bd135279 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -940,6 +940,7 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	if (dma_mapping_error(ctlr->dma_tx->device->dev, bs->fill_tx_addr)) {
 		dev_err(dev, "cannot map zero page - not using DMA mode\n");
 		bs->fill_tx_addr = 0;
+		ret = -ENOMEM;
 		goto err_release;
 	}
 
@@ -949,6 +950,7 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 						     DMA_MEM_TO_DEV, 0);
 	if (!bs->fill_tx_desc) {
 		dev_err(dev, "cannot prepare fill_tx_desc - not using DMA mode\n");
+		ret = -ENOMEM;
 		goto err_release;
 	}
 
@@ -979,6 +981,7 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	if (dma_mapping_error(ctlr->dma_rx->device->dev, bs->clear_rx_addr)) {
 		dev_err(dev, "cannot map clear_rx_cs - not using DMA mode\n");
 		bs->clear_rx_addr = 0;
+		ret = -ENOMEM;
 		goto err_release;
 	}
 
@@ -989,6 +992,7 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 					   DMA_MEM_TO_DEV, 0);
 		if (!bs->clear_rx_desc[i]) {
 			dev_err(dev, "cannot prepare clear_rx_desc - not using DMA mode\n");
+			ret = -ENOMEM;
 			goto err_release;
 		}
