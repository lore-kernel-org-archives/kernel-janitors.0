From: Ji-Hun Kim <ji_hun.kim@samsung.com>
Date: Fri, 30 Mar 2018 05:51:54 +0000
Subject: [PATCH v4 1/2] staging: vt6655: check for memory allocation failures
Message-Id: <1522389115-1124-1-git-send-email-ji_hun.kim@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180330055207epcas1p14d562f44802bac86a8a7cd95fe2d009f@epcas1p1.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, baijiaju1990@gmail.com, forest@alittletooquiet.net
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, ji_hun.kim@samsung.com, santhameena13@gmail.com

There are no null pointer checking on rd_info and td_info values which
are allocated by kzalloc. It has potential null pointer dereferencing
issues. Implement error handling code on device_init_rd*, device_init_td*
and vnt_start for the allocation failures.

Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
---
Changes v2:
- Delete WARN_ON which can makes crashes on some machines.
- Instead of return directly, goto freeing function for freeing previously
  allocated memory in the for loop after kzalloc() failed.
- In the freeing function, add if statement for freeing to only allocated
  values.

Changes v3:
- Modify return type of device_init_rd*, device_init_td*. Then add returns
  error code at those functions and vnt_start as well.

Changes v4:
- Fix potential memory leaks from error handling code of device init
  functions in vnt_start().

 drivers/staging/vt6655/device_main.c | 121 ++++++++++++++++++++++++++---------
 1 file changed, 89 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index fbc4bc6..c9752df 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -124,10 +124,10 @@
 static void device_free_info(struct vnt_private *priv);
 static void device_print_info(struct vnt_private *priv);
 
-static void device_init_rd0_ring(struct vnt_private *priv);
-static void device_init_rd1_ring(struct vnt_private *priv);
-static void device_init_td0_ring(struct vnt_private *priv);
-static void device_init_td1_ring(struct vnt_private *priv);
+static int device_init_rd0_ring(struct vnt_private *priv);
+static int device_init_rd1_ring(struct vnt_private *priv);
+static int device_init_td0_ring(struct vnt_private *priv);
+static int device_init_td1_ring(struct vnt_private *priv);
 
 static int  device_rx_srv(struct vnt_private *priv, unsigned int idx);
 static int  device_tx_srv(struct vnt_private *priv, unsigned int idx);
@@ -528,18 +528,22 @@ static void device_free_rings(struct vnt_private *priv)
 				  priv->tx0_bufs, priv->tx_bufs_dma0);
 }
 
-static void device_init_rd0_ring(struct vnt_private *priv)
+static int device_init_rd0_ring(struct vnt_private *priv)
 {
 	int i;
 	dma_addr_t      curr = priv->rd0_pool_dma;
 	struct vnt_rx_desc *desc;
+	int ret = 0;
 
 	/* Init the RD0 ring entries */
 	for (i = 0; i < priv->opts.rx_descs0;
 	     i ++, curr += sizeof(struct vnt_rx_desc)) {
 		desc = &priv->aRD0Ring[i];
 		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
-
+		if (!desc->rd_info) {
+			ret = -ENOMEM;
+			goto error;
+		}
 		if (!device_alloc_rx_buf(priv, desc))
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
 
@@ -550,20 +554,29 @@ static void device_init_rd0_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->aRD0Ring[i-1].next_desc = cpu_to_le32(priv->rd0_pool_dma);
 	priv->pCurrRD[0] = &priv->aRD0Ring[0];
+
+	return 0;
+error:
+	device_free_rd0_ring(priv);
+	return ret;
 }
 
-static void device_init_rd1_ring(struct vnt_private *priv)
+static int device_init_rd1_ring(struct vnt_private *priv)
 {
 	int i;
 	dma_addr_t      curr = priv->rd1_pool_dma;
 	struct vnt_rx_desc *desc;
+	int ret = 0;
 
 	/* Init the RD1 ring entries */
 	for (i = 0; i < priv->opts.rx_descs1;
 	     i ++, curr += sizeof(struct vnt_rx_desc)) {
 		desc = &priv->aRD1Ring[i];
 		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
-
+		if (!desc->rd_info) {
+			ret = -ENOMEM;
+			goto error;
+		}
 		if (!device_alloc_rx_buf(priv, desc))
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
 
@@ -574,6 +587,11 @@ static void device_init_rd1_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->aRD1Ring[i-1].next_desc = cpu_to_le32(priv->rd1_pool_dma);
 	priv->pCurrRD[1] = &priv->aRD1Ring[0];
+
+	return 0;
+error:
+	device_free_rd1_ring(priv);
+	return ret;
 }
 
 static void device_free_rd0_ring(struct vnt_private *priv)
@@ -584,12 +602,12 @@ static void device_free_rd0_ring(struct vnt_private *priv)
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
 
@@ -601,27 +619,31 @@ static void device_free_rd1_ring(struct vnt_private *priv)
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
 
-static void device_init_td0_ring(struct vnt_private *priv)
+static int device_init_td0_ring(struct vnt_private *priv)
 {
 	int i;
 	dma_addr_t  curr;
 	struct vnt_tx_desc *desc;
+	int ret = 0;
 
 	curr = priv->td0_pool_dma;
 	for (i = 0; i < priv->opts.tx_descs[0];
 	     i++, curr += sizeof(struct vnt_tx_desc)) {
 		desc = &priv->apTD0Rings[i];
 		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
-
+		if (!desc->td_info) {
+			ret = -ENOMEM;
+			goto error;
+		}
 		desc->td_info->buf = priv->tx0_bufs + i * PKT_BUF_SZ;
 		desc->td_info->buf_dma = priv->tx_bufs_dma0 + i * PKT_BUF_SZ;
 
@@ -632,13 +654,19 @@ static void device_init_td0_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->apTD0Rings[i-1].next_desc = cpu_to_le32(priv->td0_pool_dma);
 	priv->apTailTD[0] = priv->apCurrTD[0] = &priv->apTD0Rings[0];
+
+	return 0;
+error:
+	device_free_td0_ring(priv);
+	return ret;
 }
 
-static void device_init_td1_ring(struct vnt_private *priv)
+static int device_init_td1_ring(struct vnt_private *priv)
 {
 	int i;
 	dma_addr_t  curr;
 	struct vnt_tx_desc *desc;
+	int ret = 0;
 
 	/* Init the TD ring entries */
 	curr = priv->td1_pool_dma;
@@ -646,7 +674,10 @@ static void device_init_td1_ring(struct vnt_private *priv)
 	     i++, curr += sizeof(struct vnt_tx_desc)) {
 		desc = &priv->apTD1Rings[i];
 		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
-
+		if (!desc->td_info) {
+			ret = -ENOMEM;
+			goto error;
+		}
 		desc->td_info->buf = priv->tx1_bufs + i * PKT_BUF_SZ;
 		desc->td_info->buf_dma = priv->tx_bufs_dma1 + i * PKT_BUF_SZ;
 
@@ -657,6 +688,11 @@ static void device_init_td1_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->apTD1Rings[i-1].next_desc = cpu_to_le32(priv->td1_pool_dma);
 	priv->apTailTD[1] = priv->apCurrTD[1] = &priv->apTD1Rings[0];
+
+	return 0;
+error:
+	device_free_td1_ring(priv);
+	return ret;
 }
 
 static void device_free_td0_ring(struct vnt_private *priv)
@@ -667,8 +703,10 @@ static void device_free_td0_ring(struct vnt_private *priv)
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
 
@@ -680,8 +718,10 @@ static void device_free_td1_ring(struct vnt_private *priv)
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
 
@@ -1165,10 +1205,18 @@ static int vnt_start(struct ieee80211_hw *hw)
 	}
 
 	dev_dbg(&priv->pcid->dev, "call device init rd0 ring\n");
-	device_init_rd0_ring(priv);
-	device_init_rd1_ring(priv);
-	device_init_td0_ring(priv);
-	device_init_td1_ring(priv);
+	ret = device_init_rd0_ring(priv);
+	if (ret)
+		goto err_init_rd0_ring;
+	ret = device_init_rd1_ring(priv);
+	if (ret)
+		goto err_init_rd1_ring;
+	ret = device_init_td0_ring(priv);
+	if (ret)
+		goto err_init_td0_ring;
+	ret = device_init_td1_ring(priv);
+	if (ret)
+		goto err_init_td1_ring;
 
 	device_init_registers(priv);
 
@@ -1178,6 +1226,15 @@ static int vnt_start(struct ieee80211_hw *hw)
 	ieee80211_wake_queues(hw);
 
 	return 0;
+
+err_init_td1_ring:
+	device_free_td0_ring(priv);
+err_init_td0_ring:
+	device_free_rd1_ring(priv);
+err_init_rd1_ring:
+	device_free_rd0_ring(priv);
+err_init_rd0_ring:
+	return ret;
 }
 
 static void vnt_stop(struct ieee80211_hw *hw)
-- 
1.9.1

