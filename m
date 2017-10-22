From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 15:34:28 +0000
Subject: [PATCH] dmaengine: ioat: Use common error handling code in ioat_xor_val_self_test()
Message-Id: <b28f440e-6d11-d37e-e5de-e6dfd6bce2e9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, Geliang Tang <geliangtang@gmail.com>, Krister Johansen <kjlx@templeofstupid.com>, Pan Bian <bianpan2016@163.com>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 17:25:09 +0200

Add a jump target so that a specific error code assignment
will be in the implementation mostly at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/ioat/init.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index 93e006c3441d..5bdd67940c81 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -853,8 +853,7 @@ static int ioat_xor_val_self_test(struct ioatdma_device *ioat_dma)
 
 	if (!tx) {
 		dev_err(dev, "Self-test xor prep failed\n");
-		err = -ENODEV;
-		goto dma_unmap;
+		goto failure_indication;
 	}
 
 	async_tx_ack(tx);
@@ -864,8 +863,7 @@ static int ioat_xor_val_self_test(struct ioatdma_device *ioat_dma)
 	cookie = tx->tx_submit(tx);
 	if (cookie < 0) {
 		dev_err(dev, "Self-test xor setup failed\n");
-		err = -ENODEV;
-		goto dma_unmap;
+		goto failure_indication;
 	}
 	dma->device_issue_pending(dma_chan);
 
@@ -874,8 +872,7 @@ static int ioat_xor_val_self_test(struct ioatdma_device *ioat_dma)
 	if (tmo = 0 ||
 	    dma->device_tx_status(dma_chan, cookie, NULL) != DMA_COMPLETE) {
 		dev_err(dev, "Self-test xor timed out\n");
-		err = -ENODEV;
-		goto dma_unmap;
+		goto failure_indication;
 	}
 
 	for (i = 0; i < IOAT_NUM_SRC_TEST; i++)
@@ -921,8 +918,7 @@ static int ioat_xor_val_self_test(struct ioatdma_device *ioat_dma)
 					  &xor_val_result, DMA_PREP_INTERRUPT);
 	if (!tx) {
 		dev_err(dev, "Self-test zero prep failed\n");
-		err = -ENODEV;
-		goto dma_unmap;
+		goto failure_indication;
 	}
 
 	async_tx_ack(tx);
@@ -932,8 +928,7 @@ static int ioat_xor_val_self_test(struct ioatdma_device *ioat_dma)
 	cookie = tx->tx_submit(tx);
 	if (cookie < 0) {
 		dev_err(dev, "Self-test zero setup failed\n");
-		err = -ENODEV;
-		goto dma_unmap;
+		goto failure_indication;
 	}
 	dma->device_issue_pending(dma_chan);
 
@@ -942,8 +937,7 @@ static int ioat_xor_val_self_test(struct ioatdma_device *ioat_dma)
 	if (tmo = 0 ||
 	    dma->device_tx_status(dma_chan, cookie, NULL) != DMA_COMPLETE) {
 		dev_err(dev, "Self-test validate timed out\n");
-		err = -ENODEV;
-		goto dma_unmap;
+		goto failure_indication;
 	}
 
 	for (i = 0; i < IOAT_NUM_SRC_TEST + 1; i++)
@@ -974,8 +968,7 @@ static int ioat_xor_val_self_test(struct ioatdma_device *ioat_dma)
 					  &xor_val_result, DMA_PREP_INTERRUPT);
 	if (!tx) {
 		dev_err(dev, "Self-test 2nd zero prep failed\n");
-		err = -ENODEV;
-		goto dma_unmap;
+		goto failure_indication;
 	}
 
 	async_tx_ack(tx);
@@ -985,8 +978,7 @@ static int ioat_xor_val_self_test(struct ioatdma_device *ioat_dma)
 	cookie = tx->tx_submit(tx);
 	if (cookie < 0) {
 		dev_err(dev, "Self-test  2nd zero setup failed\n");
-		err = -ENODEV;
-		goto dma_unmap;
+		goto failure_indication;
 	}
 	dma->device_issue_pending(dma_chan);
 
@@ -995,20 +987,20 @@ static int ioat_xor_val_self_test(struct ioatdma_device *ioat_dma)
 	if (tmo = 0 ||
 	    dma->device_tx_status(dma_chan, cookie, NULL) != DMA_COMPLETE) {
 		dev_err(dev, "Self-test 2nd validate timed out\n");
-		err = -ENODEV;
-		goto dma_unmap;
+		goto failure_indication;
 	}
 
 	if (xor_val_result != SUM_CHECK_P_RESULT) {
 		dev_err(dev, "Self-test validate failed compare\n");
-		err = -ENODEV;
-		goto dma_unmap;
+		goto failure_indication;
 	}
 
 	for (i = 0; i < IOAT_NUM_SRC_TEST + 1; i++)
 		dma_unmap_page(dev, dma_srcs[i], PAGE_SIZE, DMA_TO_DEVICE);
 
 	goto free_resources;
+failure_indication:
+	err = -ENODEV;
 dma_unmap:
 	if (op = IOAT_OP_XOR) {
 		while (--i >= 0)
-- 
2.14.2

