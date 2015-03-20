From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Fri, 20 Mar 2015 13:06:40 +0000
Subject: [PATCH v2] staging: vt6655: remove deprecated use of pci api
Message-Id: <1426856800-10920-1-git-send-email-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Quentin Lambert <lambert.quentin@gmail.com>

Replace occurences of the pci api by appropriate call to the dma api.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr)

@deprecated@
idexpression id;
position p;
@@

(
  pci_dma_supported@p ( id, ...)
|
  pci_alloc_consistent@p ( id, ...)
)

@bad1@
idexpression id;
position deprecated.p;
@@
...when != &id->dev
   when != pci_get_drvdata ( id )
   when != pci_enable_device ( id )
(
  pci_dma_supported@p ( id, ...)
|
  pci_alloc_consistent@p ( id, ...)
)

@depends on !bad1@
idexpression id;
expression direction;
position deprecated.p;
@@

(
- pci_dma_supported@p ( id,
+ dma_supported ( &id->dev,
...
+ , GFP_ATOMIC
  )
|
- pci_alloc_consistent@p ( id,
+ dma_alloc_coherent ( &id->dev,
...
+ , GFP_ATOMIC
  )
)

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 Changes since v1:
   - Replaces GFP_ATOMIC by GFP_KERNEL since no lock is taken before calling
     this function
 drivers/staging/vt6655/device_main.c | 39 ++++++++++++++++++------------------
 drivers/staging/vt6655/dpc.c         |  4 ++--
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 14c935fed8a0..1e31ed8ae317 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -530,12 +530,12 @@ static bool device_init_rings(struct vnt_private *pDevice)
 	void *vir_pool;
 
 	/*allocate all RD/TD rings a single pool*/
-	vir_pool = pci_zalloc_consistent(pDevice->pcid,
+	vir_pool = dma_zalloc_coherent(&pDevice->pcid->dev,
 					 pDevice->sOpts.nRxDescs0 * sizeof(SRxDesc) +
 					 pDevice->sOpts.nRxDescs1 * sizeof(SRxDesc) +
 					 pDevice->sOpts.nTxDescs[0] * sizeof(STxDesc) +
 					 pDevice->sOpts.nTxDescs[1] * sizeof(STxDesc),
-					 &pDevice->pool_dma);
+					 &pDevice->pool_dma, GFP_KERNEL);
 	if (vir_pool = NULL) {
 		dev_err(&pDevice->pcid->dev, "allocate desc dma memory failed\n");
 		return false;
@@ -549,16 +549,17 @@ static bool device_init_rings(struct vnt_private *pDevice)
 	pDevice->rd1_pool_dma = pDevice->rd0_pool_dma +
 		pDevice->sOpts.nRxDescs0 * sizeof(SRxDesc);
 
-	pDevice->tx0_bufs = pci_zalloc_consistent(pDevice->pcid,
+	pDevice->tx0_bufs = dma_zalloc_coherent(&pDevice->pcid->dev,
 						  pDevice->sOpts.nTxDescs[0] * PKT_BUF_SZ +
 						  pDevice->sOpts.nTxDescs[1] * PKT_BUF_SZ +
 						  CB_BEACON_BUF_SIZE +
 						  CB_MAX_BUF_SIZE,
-						  &pDevice->tx_bufs_dma0);
+						  &pDevice->tx_bufs_dma0,
+						  GFP_KERNEL);
 	if (pDevice->tx0_bufs = NULL) {
 		dev_err(&pDevice->pcid->dev, "allocate buf dma memory failed\n");
 
-		pci_free_consistent(pDevice->pcid,
+		dma_free_coherent(&pDevice->pcid->dev,
 				    pDevice->sOpts.nRxDescs0 * sizeof(SRxDesc) +
 				    pDevice->sOpts.nRxDescs1 * sizeof(SRxDesc) +
 				    pDevice->sOpts.nTxDescs[0] * sizeof(STxDesc) +
@@ -604,7 +605,7 @@ static bool device_init_rings(struct vnt_private *pDevice)
 
 static void device_free_rings(struct vnt_private *pDevice)
 {
-	pci_free_consistent(pDevice->pcid,
+	dma_free_coherent(&pDevice->pcid->dev,
 			    pDevice->sOpts.nRxDescs0 * sizeof(SRxDesc) +
 			    pDevice->sOpts.nRxDescs1 * sizeof(SRxDesc) +
 			    pDevice->sOpts.nTxDescs[0] * sizeof(STxDesc) +
@@ -614,7 +615,7 @@ static void device_free_rings(struct vnt_private *pDevice)
 		);
 
 	if (pDevice->tx0_bufs)
-		pci_free_consistent(pDevice->pcid,
+		dma_free_coherent(&pDevice->pcid->dev,
 				    pDevice->sOpts.nTxDescs[0] * PKT_BUF_SZ +
 				    pDevice->sOpts.nTxDescs[1] * PKT_BUF_SZ +
 				    CB_BEACON_BUF_SIZE +
@@ -679,8 +680,8 @@ static void device_free_rd0_ring(struct vnt_private *pDevice)
 		PSRxDesc        pDesc = &(pDevice->aRD0Ring[i]);
 		PDEVICE_RD_INFO  pRDInfo = pDesc->pRDInfo;
 
-		pci_unmap_single(pDevice->pcid, pRDInfo->skb_dma,
-				 pDevice->rx_buf_sz, PCI_DMA_FROMDEVICE);
+		dma_unmap_single(&pDevice->pcid->dev, pRDInfo->skb_dma,
+				 pDevice->rx_buf_sz, DMA_FROM_DEVICE);
 
 		dev_kfree_skb(pRDInfo->skb);
 
@@ -696,8 +697,8 @@ static void device_free_rd1_ring(struct vnt_private *pDevice)
 		PSRxDesc        pDesc = &(pDevice->aRD1Ring[i]);
 		PDEVICE_RD_INFO  pRDInfo = pDesc->pRDInfo;
 
-		pci_unmap_single(pDevice->pcid, pRDInfo->skb_dma,
-				 pDevice->rx_buf_sz, PCI_DMA_FROMDEVICE);
+		dma_unmap_single(&pDevice->pcid->dev, pRDInfo->skb_dma,
+				 pDevice->rx_buf_sz, DMA_FROM_DEVICE);
 
 		dev_kfree_skb(pRDInfo->skb);
 
@@ -765,8 +766,8 @@ static void device_free_td0_ring(struct vnt_private *pDevice)
 		PDEVICE_TD_INFO  pTDInfo = pDesc->pTDInfo;
 
 		if (pTDInfo->skb_dma && (pTDInfo->skb_dma != pTDInfo->buf_dma))
-			pci_unmap_single(pDevice->pcid, pTDInfo->skb_dma,
-					 pTDInfo->skb->len, PCI_DMA_TODEVICE);
+			dma_unmap_single(&pDevice->pcid->dev, pTDInfo->skb_dma,
+					 pTDInfo->skb->len, DMA_TO_DEVICE);
 
 		if (pTDInfo->skb)
 			dev_kfree_skb(pTDInfo->skb);
@@ -784,8 +785,8 @@ static void device_free_td1_ring(struct vnt_private *pDevice)
 		PDEVICE_TD_INFO  pTDInfo = pDesc->pTDInfo;
 
 		if (pTDInfo->skb_dma && (pTDInfo->skb_dma != pTDInfo->buf_dma))
-			pci_unmap_single(pDevice->pcid, pTDInfo->skb_dma,
-					 pTDInfo->skb->len, PCI_DMA_TODEVICE);
+			dma_unmap_single(&pDevice->pcid->dev, pTDInfo->skb_dma,
+					 pTDInfo->skb->len, DMA_TO_DEVICE);
 
 		if (pTDInfo->skb)
 			dev_kfree_skb(pTDInfo->skb);
@@ -831,9 +832,9 @@ static bool device_alloc_rx_buf(struct vnt_private *pDevice, PSRxDesc pRD)
 	ASSERT(pRDInfo->skb);
 
 	pRDInfo->skb_dma -		pci_map_single(pDevice->pcid,
+		dma_map_single(&pDevice->pcid->dev,
 			       skb_put(pRDInfo->skb, skb_tailroom(pRDInfo->skb)),
-			       pDevice->rx_buf_sz, PCI_DMA_FROMDEVICE);
+			       pDevice->rx_buf_sz, DMA_FROM_DEVICE);
 
 	*((unsigned int *)&(pRD->m_rd0RD0)) = 0; /* FIX cast */
 
@@ -984,8 +985,8 @@ static void device_free_tx_buf(struct vnt_private *pDevice, PSTxDesc pDesc)
 
 	/* pre-allocated buf_dma can't be unmapped. */
 	if (pTDInfo->skb_dma && (pTDInfo->skb_dma != pTDInfo->buf_dma)) {
-		pci_unmap_single(pDevice->pcid, pTDInfo->skb_dma, skb->len,
-				 PCI_DMA_TODEVICE);
+		dma_unmap_single(&pDevice->pcid->dev, pTDInfo->skb_dma,
+				 skb->len, DMA_TO_DEVICE);
 	}
 
 	if (pTDInfo->byFlags & TD_FLAGS_NETIF_SKB)
diff --git a/drivers/staging/vt6655/dpc.c b/drivers/staging/vt6655/dpc.c
index 3c5b87ffdcac..b25ee962558d 100644
--- a/drivers/staging/vt6655/dpc.c
+++ b/drivers/staging/vt6655/dpc.c
@@ -140,8 +140,8 @@ bool vnt_receive_frame(struct vnt_private *priv, PSRxDesc curr_rd)
 
 	skb = rd_info->skb;
 
-	pci_unmap_single(priv->pcid, rd_info->skb_dma,
-			 priv->rx_buf_sz, PCI_DMA_FROMDEVICE);
+	dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
+			 priv->rx_buf_sz, DMA_FROM_DEVICE);
 
 	frame_size = le16_to_cpu(curr_rd->m_rd1RD1.wReqCount)
 			- cpu_to_le16(curr_rd->m_rd0RD0.wResCount);
-- 
2.3.2.223.g7a9409c

