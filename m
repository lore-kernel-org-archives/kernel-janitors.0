From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Aug 2013 12:58:39 +0000
Subject: [patch] dma: mv_xor: error handling fix in mv_xor_channel_add()
Message-Id: <20130822125839.GC2543@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

We haven't allocated the dma buffer at this point and also if we
"goto err_free_dma;" then it leads to a NULL dereference.  Just return
directly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I can't compile this file.

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index d9a2677..0e9e835 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1029,10 +1029,8 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 	struct dma_device *dma_dev;
 
 	mv_chan = devm_kzalloc(&pdev->dev, sizeof(*mv_chan), GFP_KERNEL);
-	if (!mv_chan) {
-		ret = -ENOMEM;
-		goto err_free_dma;
-	}
+	if (!mv_chan)
+		return ERR_PTR(-ENOMEM);
 
 	mv_chan->idx = idx;
 	mv_chan->irq = irq;
