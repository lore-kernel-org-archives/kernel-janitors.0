From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Oct 2017 10:54:50 +0000
Subject: [PATCH] dmaengine: stm32-dmamux: Fix a NULL vs IS_ERR() check in probe
Message-Id: <20171003105450.nll2ogf44l3eq4ge@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

devm_ioremap_resource() doesn't return NULL, it returns error pointers.

Fixes: df7e762db5f6 ("dmaengine: Add STM32 DMAMUX driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index 22812e7a953b..d5db0f6e1ff8 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -257,8 +257,8 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	iomem = devm_ioremap_resource(&pdev->dev, res);
-	if (!iomem)
-		return -ENOMEM;
+	if (IS_ERR(iomem))
+		return PTR_ERR(iomem);
 
 	spin_lock_init(&stm32_dmamux->lock);
 
