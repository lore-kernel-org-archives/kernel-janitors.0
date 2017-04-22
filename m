From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 22 Apr 2017 20:32:35 +0000
Subject: [PATCH 2/2] dmaengine: zx: Fix a typo in a comment line
Message-Id: <b0e715a7-ac87-8873-d8f9-eb8525c1fb77@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85b8d46d-1643-0fdd-b295-9359ebca6444@users.sourceforge.net>
In-Reply-To: <85b8d46d-1643-0fdd-b295-9359ebca6444@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Shawn Guo <shawn.guo@linaro.org>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 22 Apr 2017 22:17:11 +0200

Add a missing character in this description for a function call.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/zx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/zx_dma.c b/drivers/dma/zx_dma.c
index 4f7587a100ea..70339cb8fd48 100644
--- a/drivers/dma/zx_dma.c
+++ b/drivers/dma/zx_dma.c
@@ -886,7 +886,7 @@ static int zx_dma_remove(struct platform_device *op)
 	struct zx_dma_chan *c, *cn;
 	struct zx_dma_dev *d = platform_get_drvdata(op);
 
-	/* explictly free the irq */
+	/* explicitly free the irq */
 	devm_free_irq(&op->dev, d->irq, d);
 
 	dma_async_device_unregister(&d->slave);
-- 
2.12.2

