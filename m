From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 01 May 2020 10:08:24 +0000
Subject: [PATCH] dmaengine: sf-pdma: Simplify the error handling path in 'sf_pdma_probe()'
Message-Id: <20200501100824.126534-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: green.wan@sifive.com, dan.j.williams@intel.com, vkoul@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to explicitly free memory that have been 'devm_kzalloc'ed.
Simplify the probe function accordingly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma/sf-pdma/sf-pdma.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 6d0bec947636..5c118c7e02bd 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -506,11 +506,11 @@ static int sf_pdma_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pdma->membase = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(pdma->membase))
-		goto ERR_MEMBASE;
+		return PTR_ERR(pdma->membase);
 
 	ret = sf_pdma_irq_init(pdev, pdma);
 	if (ret)
-		goto ERR_INITIRQ;
+		return ret;
 
 	sf_pdma_setup_chans(pdma);
 
@@ -544,24 +544,13 @@ static int sf_pdma_probe(struct platform_device *pdev)
 			 "Failed to set DMA mask. Fall back to default.\n");
 
 	ret = dma_async_device_register(&pdma->dma_dev);
-	if (ret)
-		goto ERR_REG_DMADEVICE;
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Can't register SiFive Platform DMA. (%d)\n", ret);
+		return ret;
+	}
 
 	return 0;
-
-ERR_MEMBASE:
-	devm_kfree(&pdev->dev, pdma);
-	return PTR_ERR(pdma->membase);
-
-ERR_INITIRQ:
-	devm_kfree(&pdev->dev, pdma);
-	return ret;
-
-ERR_REG_DMADEVICE:
-	devm_kfree(&pdev->dev, pdma);
-	dev_err(&pdev->dev,
-		"Can't register SiFive Platform DMA. (%d)\n", ret);
-	return ret;
 }
 
 static int sf_pdma_remove(struct platform_device *pdev)
-- 
2.25.1
