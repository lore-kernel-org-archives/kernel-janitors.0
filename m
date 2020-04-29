From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 29 Apr 2020 07:58:55 +0000
Subject: [PATCH -next] spi: uniphier: fix error return code in uniphier_spi_probe()
Message-Id: <20200429075855.104487-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org

Fix to return negative error code -EPROBE_DEFER from the DMA probe defer
error handling case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/spi/spi-uniphier.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-uniphier.c b/drivers/spi/spi-uniphier.c
index 0fa50979644d..0457d3376873 100644
--- a/drivers/spi/spi-uniphier.c
+++ b/drivers/spi/spi-uniphier.c
@@ -716,8 +716,10 @@ static int uniphier_spi_probe(struct platform_device *pdev)
 
 	master->dma_tx = dma_request_chan(&pdev->dev, "tx");
 	if (IS_ERR_OR_NULL(master->dma_tx)) {
-		if (PTR_ERR(master->dma_tx) = -EPROBE_DEFER)
+		if (PTR_ERR(master->dma_tx) = -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
 			goto out_disable_clk;
+		}
 		master->dma_tx = NULL;
 		dma_tx_burst = INT_MAX;
 	} else {
@@ -732,8 +734,10 @@ static int uniphier_spi_probe(struct platform_device *pdev)
 
 	master->dma_rx = dma_request_chan(&pdev->dev, "rx");
 	if (IS_ERR_OR_NULL(master->dma_rx)) {
-		if (PTR_ERR(master->dma_rx) = -EPROBE_DEFER)
+		if (PTR_ERR(master->dma_rx) = -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
 			goto out_disable_clk;
+		}
 		master->dma_rx = NULL;
 		dma_rx_burst = INT_MAX;
 	} else {
