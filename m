From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 Aug 2013 11:20:38 +0000
Subject: [PATCH 4/7] dma: replace devm_request_and_ioremap by devm_ioremap_resource
Message-Id: <1376911241-27720-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: kernel-janitors@vger.kernel.org, Dan Williams <djbw@fb.com>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use devm_ioremap_resource instead of devm_request_and_ioremap.

This was done using the semantic patch
scripts/coccinelle/api/devm_ioremap_resource.cocci

The relevant call to platform_get_resource was manually moved down to the
call to devm_ioremap_resource.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/dma/sh/sudmac.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sh/sudmac.c b/drivers/dma/sh/sudmac.c
index c494417..8369c6f 100644
--- a/drivers/dma/sh/sudmac.c
+++ b/drivers/dma/sh/sudmac.c
@@ -345,9 +345,8 @@ static int sudmac_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENODEV;
 
-	chan = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!chan || !irq_res)
+	if (!irq_res)
 		return -ENODEV;
 
 	err = -ENOMEM;
@@ -360,9 +359,10 @@ static int sudmac_probe(struct platform_device *pdev)
 
 	dma_dev = &su_dev->shdma_dev.dma_dev;
 
-	su_dev->chan_reg = devm_request_and_ioremap(&pdev->dev, chan);
-	if (!su_dev->chan_reg)
-		return err;
+	chan = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	su_dev->chan_reg = devm_ioremap_resource(&pdev->dev, chan);
+	if (IS_ERR(su_dev->chan_reg))
+		return PTR_ERR(su_dev->chan_reg);
 
 	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
 

