From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 22 Apr 2017 20:31:27 +0000
Subject: [PATCH 1/2] dmaengine: zx: Use devm_kcalloc() in zx_dma_probe()
Message-Id: <e2b06d15-e639-43d0-6eee-42268b322d88@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85b8d46d-1643-0fdd-b295-9359ebca6444@users.sourceforge.net>
In-Reply-To: <85b8d46d-1643-0fdd-b295-9359ebca6444@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Shawn Guo <shawn.guo@linaro.org>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 22 Apr 2017 22:00:10 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "devm_kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data structures by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/zx_dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/zx_dma.c b/drivers/dma/zx_dma.c
index 2bb695315300..4f7587a100ea 100644
--- a/drivers/dma/zx_dma.c
+++ b/drivers/dma/zx_dma.c
@@ -798,8 +798,8 @@ static int zx_dma_probe(struct platform_device *op)
 		return -ENOMEM;
 
 	/* init phy channel */
-	d->phy = devm_kzalloc(&op->dev,
-		d->dma_channels * sizeof(struct zx_dma_phy), GFP_KERNEL);
+	d->phy = devm_kcalloc(&op->dev, d->dma_channels, sizeof(*d->phy),
+			      GFP_KERNEL);
 	if (!d->phy)
 		return -ENOMEM;
 
@@ -834,8 +834,8 @@ static int zx_dma_probe(struct platform_device *op)
 	d->slave.residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
 
 	/* init virtual channel */
-	d->chans = devm_kzalloc(&op->dev,
-		d->dma_requests * sizeof(struct zx_dma_chan), GFP_KERNEL);
+	d->chans = devm_kcalloc(&op->dev, d->dma_requests, sizeof(*d->chans),
+				GFP_KERNEL);
 	if (!d->chans)
 		return -ENOMEM;
 
-- 
2.12.2

