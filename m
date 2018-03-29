From: Ji-Hun Kim <ji_hun.kim@samsung.com>
Date: Thu, 29 Mar 2018 07:22:37 +0000
Subject: [PATCH v2] staging: vt6655: check for memory allocation failures
Message-Id: <1522308157-26463-1-git-send-email-ji_hun.kim@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180329072248epcas2p3d12617d41e964252998dd1d34f740a97@epcas2p3.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, baijiaju1990@gmail.com, forest@alittletooquiet.net
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, ji_hun.kim@samsung.com, santhameena13@gmail.com

There are no null pointer checking on rd_info and td_info values which
are allocated by kzalloc. It has potential null pointer dereferencing
issues. Add return when allocation is failed.

Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
---

Change: since v1:

- Delete WARN_ON which can makes crashes on some machines.
- Instead of return directly, goto freeing function for freeing previously
  allocated memory in the for loop after kzalloc() failed.
- In the freeing function, if td_info and rd_info are not allocated, no
  needs to free.

 drivers/staging/vt6655/device_main.c | 64 +++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index fbc4bc6..ecbba43 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -539,7 +539,8 @@ static void device_init_rd0_ring(struct vnt_private *priv)
 	     i ++, curr += sizeof(struct vnt_rx_desc)) {
 		desc = &priv->aRD0Ring[i];
 		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
-
+		if (!desc->rd_info)
+			goto error;
 		if (!device_alloc_rx_buf(priv, desc))
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
 
@@ -550,6 +551,10 @@ static void device_init_rd0_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->aRD0Ring[i-1].next_desc = cpu_to_le32(priv->rd0_pool_dma);
 	priv->pCurrRD[0] = &priv->aRD0Ring[0];
+
+	return;
+error:
+	device_free_rd0_ring(priv);
 }
 
 static void device_init_rd1_ring(struct vnt_private *priv)
@@ -563,7 +568,8 @@ static void device_init_rd1_ring(struct vnt_private *priv)
 	     i ++, curr += sizeof(struct vnt_rx_desc)) {
 		desc = &priv->aRD1Ring[i];
 		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
-
+		if (!desc->rd_info)
+			goto error;
 		if (!device_alloc_rx_buf(priv, desc))
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
 
@@ -574,6 +580,10 @@ static void device_init_rd1_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->aRD1Ring[i-1].next_desc = cpu_to_le32(priv->rd1_pool_dma);
 	priv->pCurrRD[1] = &priv->aRD1Ring[0];
+
+	return;
+error:
+	device_free_rd1_ring(priv);
 }
 
 static void device_free_rd0_ring(struct vnt_private *priv)
@@ -584,12 +594,12 @@ static void device_free_rd0_ring(struct vnt_private *priv)
 		struct vnt_rx_desc *desc = &priv->aRD0Ring[i];
 		struct vnt_rd_info *rd_info = desc->rd_info;
 
-		dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
-				 priv->rx_buf_sz, DMA_FROM_DEVICE);
-
-		dev_kfree_skb(rd_info->skb);
-
-		kfree(desc->rd_info);
+		if (rd_info) {
+			dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
+					priv->rx_buf_sz, DMA_FROM_DEVICE);
+			dev_kfree_skb(rd_info->skb);
+			kfree(desc->rd_info);
+		}
 	}
 }
 
@@ -601,12 +611,12 @@ static void device_free_rd1_ring(struct vnt_private *priv)
 		struct vnt_rx_desc *desc = &priv->aRD1Ring[i];
 		struct vnt_rd_info *rd_info = desc->rd_info;
 
-		dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
-				 priv->rx_buf_sz, DMA_FROM_DEVICE);
-
-		dev_kfree_skb(rd_info->skb);
-
-		kfree(desc->rd_info);
+		if (rd_info) {
+			dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
+					priv->rx_buf_sz, DMA_FROM_DEVICE);
+			dev_kfree_skb(rd_info->skb);
+			kfree(desc->rd_info);
+		}
 	}
 }
 
@@ -621,7 +631,8 @@ static void device_init_td0_ring(struct vnt_private *priv)
 	     i++, curr += sizeof(struct vnt_tx_desc)) {
 		desc = &priv->apTD0Rings[i];
 		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
-
+		if (!desc->td_info)
+			goto error;
 		desc->td_info->buf = priv->tx0_bufs + i * PKT_BUF_SZ;
 		desc->td_info->buf_dma = priv->tx_bufs_dma0 + i * PKT_BUF_SZ;
 
@@ -632,6 +643,10 @@ static void device_init_td0_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->apTD0Rings[i-1].next_desc = cpu_to_le32(priv->td0_pool_dma);
 	priv->apTailTD[0] = priv->apCurrTD[0] = &priv->apTD0Rings[0];
+
+	return;
+error:
+	device_free_td0_ring(priv);
 }
 
 static void device_init_td1_ring(struct vnt_private *priv)
@@ -646,7 +661,8 @@ static void device_init_td1_ring(struct vnt_private *priv)
 	     i++, curr += sizeof(struct vnt_tx_desc)) {
 		desc = &priv->apTD1Rings[i];
 		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
-
+		if (!desc->td_info)
+			goto error;
 		desc->td_info->buf = priv->tx1_bufs + i * PKT_BUF_SZ;
 		desc->td_info->buf_dma = priv->tx_bufs_dma1 + i * PKT_BUF_SZ;
 
@@ -657,6 +673,10 @@ static void device_init_td1_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->apTD1Rings[i-1].next_desc = cpu_to_le32(priv->td1_pool_dma);
 	priv->apTailTD[1] = priv->apCurrTD[1] = &priv->apTD1Rings[0];
+
+	return;
+error:
+	device_free_td1_ring(priv);
 }
 
 static void device_free_td0_ring(struct vnt_private *priv)
@@ -667,8 +687,10 @@ static void device_free_td0_ring(struct vnt_private *priv)
 		struct vnt_tx_desc *desc = &priv->apTD0Rings[i];
 		struct vnt_td_info *td_info = desc->td_info;
 
-		dev_kfree_skb(td_info->skb);
-		kfree(desc->td_info);
+		if (td_info) {
+			dev_kfree_skb(td_info->skb);
+			kfree(desc->td_info);
+		}
 	}
 }
 
@@ -680,8 +702,10 @@ static void device_free_td1_ring(struct vnt_private *priv)
 		struct vnt_tx_desc *desc = &priv->apTD1Rings[i];
 		struct vnt_td_info *td_info = desc->td_info;
 
-		dev_kfree_skb(td_info->skb);
-		kfree(desc->td_info);
+		if (td_info) {
+			dev_kfree_skb(td_info->skb);
+			kfree(desc->td_info);
+		}
 	}
 }
 
-- 
1.9.1

