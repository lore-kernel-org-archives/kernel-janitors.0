From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Dec 2020 16:25:35 +0000
Subject: [PATCH] dmaengine: owl-dma: Fix a resource leak in the remove function
Message-Id: <20201212162535.95727-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vkoul@kernel.org, dan.j.williams@intel.com, afaerber@suse.de, manivannan.sadhasivam@linaro.org
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

A 'dma_pool_destroy()' call is missing in the remove function.
Add it.

This call is already made in the error handling path of the probe function.

Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma/owl-dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 9fede32641e9..04202d75f4ee 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1245,6 +1245,7 @@ static int owl_dma_remove(struct platform_device *pdev)
 	owl_dma_free(od);
 
 	clk_disable_unprepare(od->clk);
+	dma_pool_destroy(od->lli_pool);
 
 	return 0;
 }
-- 
2.27.0
