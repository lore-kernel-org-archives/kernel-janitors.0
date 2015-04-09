From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2015 09:03:31 +0000
Subject: [patch 2/2] dmaengine: xgene: devm_ioremap() returns NULL on error
Message-Id: <20150409090331.GC17605@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The code here is checking for IS_ERR() but devm_ioremap() returns NULL
on error and not an error pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 06d4042..8a36946 100755
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1895,9 +1895,9 @@ static int xgene_dma_get_resources(struct platform_device *pdev,
 
 	pdma->csr_dma = devm_ioremap(&pdev->dev, res->start,
 				     resource_size(res));
-	if (IS_ERR(pdma->csr_dma)) {
+	if (!pdma->csr_dma) {
 		dev_err(&pdev->dev, "Failed to ioremap csr region");
-		return PTR_ERR(pdma->csr_dma);
+		return -ENOMEM;
 	}
 
 	/* Get DMA ring csr region */
@@ -1909,9 +1909,9 @@ static int xgene_dma_get_resources(struct platform_device *pdev,
 
 	pdma->csr_ring =  devm_ioremap(&pdev->dev, res->start,
 				       resource_size(res));
-	if (IS_ERR(pdma->csr_ring)) {
+	if (!pdma->csr_ring) {
 		dev_err(&pdev->dev, "Failed to ioremap ring csr region");
-		return PTR_ERR(pdma->csr_ring);
+		return -ENOMEM;
 	}
 
 	/* Get DMA ring cmd csr region */
@@ -1923,9 +1923,9 @@ static int xgene_dma_get_resources(struct platform_device *pdev,
 
 	pdma->csr_ring_cmd = devm_ioremap(&pdev->dev, res->start,
 					  resource_size(res));
-	if (IS_ERR(pdma->csr_ring_cmd)) {
+	if (!pdma->csr_ring_cmd) {
 		dev_err(&pdev->dev, "Failed to ioremap ring cmd csr region");
-		return PTR_ERR(pdma->csr_ring_cmd);
+		return -ENOMEM;
 	}
 
 	/* Get efuse csr region */
@@ -1937,9 +1937,9 @@ static int xgene_dma_get_resources(struct platform_device *pdev,
 
 	pdma->csr_efuse = devm_ioremap(&pdev->dev, res->start,
 				       resource_size(res));
-	if (IS_ERR(pdma->csr_efuse)) {
+	if (!pdma->csr_efuse) {
 		dev_err(&pdev->dev, "Failed to ioremap efuse csr region");
-		return PTR_ERR(pdma->csr_efuse);
+		return -ENOMEM;
 	}
 
 	/* Get DMA error interrupt */
