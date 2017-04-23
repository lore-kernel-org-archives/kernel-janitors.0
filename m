From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Apr 2017 09:07:43 +0000
Subject: [PATCH 1/2] dmaengine: k3dma: Use devm_kcalloc() in k3_dma_probe()
Message-Id: <3f5acfa7-3c12-e8e1-17dd-ae03ce45c0be@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f83beedc-28fd-c373-cca8-7261e42577a5@users.sourceforge.net>
In-Reply-To: <f83beedc-28fd-c373-cca8-7261e42577a5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Apr 2017 10:30:32 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "devm_kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data structures by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/k3dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index 01e25c68dd5a..31a51ee1a910 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -845,8 +845,8 @@ static int k3_dma_probe(struct platform_device *op)
 		return -ENOMEM;
 
 	/* init phy channel */
-	d->phy = devm_kzalloc(&op->dev,
-		d->dma_channels * sizeof(struct k3_dma_phy), GFP_KERNEL);
+	d->phy = devm_kcalloc(&op->dev, d->dma_channels, sizeof(*d->phy),
+			      GFP_KERNEL);
 	if (d->phy = NULL)
 		return -ENOMEM;
 
@@ -875,8 +875,8 @@ static int k3_dma_probe(struct platform_device *op)
 	d->slave.copy_align = DMAENGINE_ALIGN_8_BYTES;
 
 	/* init virtual channel */
-	d->chans = devm_kzalloc(&op->dev,
-		d->dma_requests * sizeof(struct k3_dma_chan), GFP_KERNEL);
+	d->chans = devm_kcalloc(&op->dev, d->dma_requests, sizeof(*d->chans),
+				GFP_KERNEL);
 	if (d->chans = NULL)
 		return -ENOMEM;
 
-- 
2.12.2

