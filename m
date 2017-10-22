From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 14:54:59 +0000
Subject: [PATCH] dmaengine: edma: Use common error handling code in three functions
Message-Id: <cb8f32ef-14c1-35cb-39aa-d3efa265dccf@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 16:46:34 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/edma.c | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/dma/edma.c b/drivers/dma/edma.c
index a7ea20e7b8e9..c973ea97467f 100644
--- a/drivers/dma/edma.c
+++ b/drivers/dma/edma.c
@@ -1091,10 +1091,9 @@ static struct dma_async_tx_descriptor *edma_prep_slave_sg(
 			echan->slot[i]  				edma_alloc_slot(echan->ecc, EDMA_SLOT_ANY);
 			if (echan->slot[i] < 0) {
-				kfree(edesc);
 				dev_err(dev, "%s: Failed to allocate slot\n",
 					__func__);
-				return NULL;
+				goto free_desc;
 			}
 		}
 	}
@@ -1110,10 +1109,8 @@ static struct dma_async_tx_descriptor *edma_prep_slave_sg(
 		ret = edma_config_pset(chan, &edesc->pset[i], src_addr,
 				       dst_addr, burst, dev_width,
 				       sg_dma_len(sg), direction);
-		if (ret < 0) {
-			kfree(edesc);
-			return NULL;
-		}
+		if (ret < 0)
+			goto free_desc;
 
 		edesc->absync = ret;
 		edesc->residue += sg_dma_len(sg);
@@ -1133,6 +1130,10 @@ static struct dma_async_tx_descriptor *edma_prep_slave_sg(
 	edesc->residue_stat = edesc->residue;
 
 	return vchan_tx_prep(&echan->vchan, &edesc->vdesc, tx_flags);
+
+free_desc:
+	kfree(edesc);
+	return NULL;
 }
 
 static struct dma_async_tx_descriptor *edma_prep_dma_memcpy(
@@ -1203,10 +1204,8 @@ static struct dma_async_tx_descriptor *edma_prep_dma_memcpy(
 
 	ret = edma_config_pset(chan, &edesc->pset[0], src, dest, 1,
 			       width, pset_len, DMA_MEM_TO_MEM);
-	if (ret < 0) {
-		kfree(edesc);
-		return NULL;
-	}
+	if (ret < 0)
+		goto free_desc;
 
 	edesc->absync = ret;
 
@@ -1222,10 +1221,9 @@ static struct dma_async_tx_descriptor *edma_prep_dma_memcpy(
 			echan->slot[1] = edma_alloc_slot(echan->ecc,
 							 EDMA_SLOT_ANY);
 			if (echan->slot[1] < 0) {
-				kfree(edesc);
 				dev_err(dev, "%s: Failed to allocate slot\n",
 					__func__);
-				return NULL;
+				goto free_desc;
 			}
 		}
 		dest += pset_len;
@@ -1234,16 +1232,18 @@ static struct dma_async_tx_descriptor *edma_prep_dma_memcpy(
 
 		ret = edma_config_pset(chan, &edesc->pset[1], src, dest, 1,
 				       width, pset_len, DMA_MEM_TO_MEM);
-		if (ret < 0) {
-			kfree(edesc);
-			return NULL;
-		}
+		if (ret < 0)
+			goto free_desc;
 
 		edesc->pset[1].param.opt |= ITCCHEN;
 		edesc->pset[1].param.opt |= TCINTEN;
 	}
 
 	return vchan_tx_prep(&echan->vchan, &edesc->vdesc, tx_flags);
+
+free_desc:
+	kfree(edesc);
+	return NULL;
 }
 
 static struct dma_async_tx_descriptor *edma_prep_dma_cyclic(
@@ -1334,10 +1334,9 @@ static struct dma_async_tx_descriptor *edma_prep_dma_cyclic(
 			echan->slot[i]  				edma_alloc_slot(echan->ecc, EDMA_SLOT_ANY);
 			if (echan->slot[i] < 0) {
-				kfree(edesc);
 				dev_err(dev, "%s: Failed to allocate slot\n",
 					__func__);
-				return NULL;
+				goto free_desc;
 			}
 		}
 
@@ -1350,10 +1349,8 @@ static struct dma_async_tx_descriptor *edma_prep_dma_cyclic(
 		ret = edma_config_pset(chan, &edesc->pset[i], src_addr,
 				       dst_addr, burst, dev_width, period_len,
 				       direction);
-		if (ret < 0) {
-			kfree(edesc);
-			return NULL;
-		}
+		if (ret < 0)
+			goto free_desc;
 
 		if (direction = DMA_DEV_TO_MEM)
 			dst_addr += period_len;
@@ -1402,6 +1399,10 @@ static struct dma_async_tx_descriptor *edma_prep_dma_cyclic(
 		edma_assign_channel_eventq(echan, EVENTQ_0);
 
 	return vchan_tx_prep(&echan->vchan, &edesc->vdesc, tx_flags);
+
+free_desc:
+	kfree(edesc);
+	return NULL;
 }
 
 static void edma_completion_handler(struct edma_chan *echan)
-- 
2.14.2

