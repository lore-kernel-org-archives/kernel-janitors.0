From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 09:40:52 +0000
Subject: [PATCH net-next] net: ll_temac: Fix return value check in temac_probe()
Message-Id: <20200427094052.181554-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: michal.simek@xilinx.com, esben@geanix.com, andrew@lunn.ch, ynezz@true.cz
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org

In case of error, the function devm_ioremap() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should
be replaced with NULL test.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/xilinx/ll_temac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
index 3e313e71ae36..929244064abd 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_main.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
@@ -1410,9 +1410,9 @@ static int temac_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	lp->regs = devm_ioremap(&pdev->dev, res->start,
 					resource_size(res));
-	if (IS_ERR(lp->regs)) {
+	if (!lp->regs) {
 		dev_err(&pdev->dev, "could not map TEMAC registers\n");
-		return PTR_ERR(lp->regs);
+		return -ENOMEM;
 	}
 
 	/* Select register access functions with the specified
@@ -1505,10 +1505,10 @@ static int temac_probe(struct platform_device *pdev)
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 		lp->sdma_regs = devm_ioremap(&pdev->dev, res->start,
 						     resource_size(res));
-		if (IS_ERR(lp->sdma_regs)) {
+		if (!lp->sdma_regs) {
 			dev_err(&pdev->dev,
 				"could not map DMA registers\n");
-			return PTR_ERR(lp->sdma_regs);
+			return -ENOMEM;
 		}
 		if (pdata->dma_little_endian) {
 			lp->dma_in = temac_dma_in32_le;
