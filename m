From: Ji-Hun Kim <ji_hun.kim@samsung.com>
Date: Thu, 05 Apr 2018 07:09:19 +0000
Subject: [PATCH v5 1/2] staging: vt6655: check for memory allocation failures
Message-Id: <1522912160-21009-1-git-send-email-ji_hun.kim@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180405071018epcas2p193288469c86f6afb2c8f7b0151dd400c@epcas2p1.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com, gregkh@linuxfoundation.org, baijiaju1990@gmail.com, forest@alittletooquiet.net
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, ji_hun.kim@samsung.com, santhameena13@gmail.com

There are no null pointer checking on rd_info and td_info values which
are allocated by kzalloc. It has potential null pointer dereferencing
issues. Implement error handling code on device_init_rd*, device_init_td*
and vnt_start for the allocation failures.

Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
---
Changes v5:
- Add error handling case for device_alloc_rx_buf() failures.
- Add device_free_rx_buf() which is corresponding free function of
  device_allocated_rx_buf(). And change duplicated codes by this function.
- Modify error handling code about freeing allocated value in the loops to
  more proper ways.
- Change goto label names following coding-style conventions.

Changes v4:
- Fix potential memory leaks from error handling code from device init
  functions in vnt_start().

Changes v3:
- Modify return type of device_init_rd*, device_init_td*. Then add returns
  error code at those functions and vnt_start as well.

Changes v2:
- Delete WARN_ON which can makes crashes on some machines.
- Instead of return directly, goto freeing function for freeing previously
  allocated memory in the for loop after kzalloc() failed.
- In the freeing function, add if statement for freeing to only allocated
  values.

 drivers/staging/vt6655/device_main.c | 144 ++++++++++++++++++++++++++++-------
 1 file changed, 118 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index fbc4bc6..700c03c 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -19,6 +19,7 @@
  *   device_print_info - print out resource
  *   device_rx_srv - rx service function
  *   device_alloc_rx_buf - rx buffer pre-allocated function
+ *   device_free_rx_buf - free rx buffer function
  *   device_free_tx_buf - free tx buffer function
  *   device_init_rd0_ring- initial rd dma0 ring
  *   device_init_rd1_ring- initial rd dma1 ring
@@ -124,14 +125,15 @@
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
 static bool device_alloc_rx_buf(struct vnt_private *, struct vnt_rx_desc *);
+static void device_free_rx_buf(struct vnt_private *priv, struct vnt_rx_desc *rd);
 static void device_init_registers(struct vnt_private *priv);
 static void device_free_tx_buf(struct vnt_private *, struct vnt_tx_desc *);
 static void device_free_td0_ring(struct vnt_private *priv);
@@ -528,20 +530,28 @@ static void device_free_rings(struct vnt_private *priv)
 				  priv->tx0_bufs, priv->tx_bufs_dma0);
 }
 
-static void device_init_rd0_ring(struct vnt_private *priv)
+static int device_init_rd0_ring(struct vnt_private *priv)
 {
 	int i;
 	dma_addr_t      curr = priv->rd0_pool_dma;
 	struct vnt_rx_desc *desc;
+	int ret;
 
 	/* Init the RD0 ring entries */
 	for (i = 0; i < priv->opts.rx_descs0;
 	     i ++, curr += sizeof(struct vnt_rx_desc)) {
 		desc = &priv->aRD0Ring[i];
 		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
+		if (!desc->rd_info) {
+			ret = -ENOMEM;
+			goto err_free_desc;
+		}
 
-		if (!device_alloc_rx_buf(priv, desc))
+		if (!device_alloc_rx_buf(priv, desc)) {
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
+			ret = -ENOMEM;
+			goto err_free_rd;
+		}
 
 		desc->next = &priv->aRD0Ring[(i + 1) % priv->opts.rx_descs0];
 		desc->next_desc = cpu_to_le32(curr + sizeof(struct vnt_rx_desc));
@@ -550,22 +560,44 @@ static void device_init_rd0_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->aRD0Ring[i-1].next_desc = cpu_to_le32(priv->rd0_pool_dma);
 	priv->pCurrRD[0] = &priv->aRD0Ring[0];
+
+	return 0;
+
+err_free_rd:
+	kfree(desc->rd_info);
+
+err_free_desc:
+	while (--i) {
+		desc = &priv->aRD0Ring[i];
+		device_free_rx_buf(priv, desc);
+		kfree(desc->rd_info);
+	}
+
+	return ret;
 }
 
-static void device_init_rd1_ring(struct vnt_private *priv)
+static int device_init_rd1_ring(struct vnt_private *priv)
 {
 	int i;
 	dma_addr_t      curr = priv->rd1_pool_dma;
 	struct vnt_rx_desc *desc;
+	int ret;
 
 	/* Init the RD1 ring entries */
 	for (i = 0; i < priv->opts.rx_descs1;
 	     i ++, curr += sizeof(struct vnt_rx_desc)) {
 		desc = &priv->aRD1Ring[i];
 		desc->rd_info = kzalloc(sizeof(*desc->rd_info), GFP_KERNEL);
+		if (!desc->rd_info) {
+			ret = -ENOMEM;
+			goto err_free_desc;
+		}
 
-		if (!device_alloc_rx_buf(priv, desc))
+		if (!device_alloc_rx_buf(priv, desc)) {
 			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
+			ret = -ENOMEM;
+			goto err_free_rd;
+		}
 
 		desc->next = &priv->aRD1Ring[(i+1) % priv->opts.rx_descs1];
 		desc->next_desc = cpu_to_le32(curr + sizeof(struct vnt_rx_desc));
@@ -574,6 +606,20 @@ static void device_init_rd1_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->aRD1Ring[i-1].next_desc = cpu_to_le32(priv->rd1_pool_dma);
 	priv->pCurrRD[1] = &priv->aRD1Ring[0];
+
+	return 0;
+
+err_free_rd:
+	kfree(desc->rd_info);
+
+err_free_desc:
+	while (--i) {
+		desc = &priv->aRD1Ring[i];
+		device_free_rx_buf(priv, desc);
+		kfree(desc->rd_info);
+	}
+
+	return ret;
 }
 
 static void device_free_rd0_ring(struct vnt_private *priv)
@@ -582,13 +628,8 @@ static void device_free_rd0_ring(struct vnt_private *priv)
 
 	for (i = 0; i < priv->opts.rx_descs0; i++) {
 		struct vnt_rx_desc *desc = &priv->aRD0Ring[i];
-		struct vnt_rd_info *rd_info = desc->rd_info;
-
-		dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
-				 priv->rx_buf_sz, DMA_FROM_DEVICE);
-
-		dev_kfree_skb(rd_info->skb);
 
+		device_free_rx_buf(priv, desc);
 		kfree(desc->rd_info);
 	}
 }
@@ -599,28 +640,28 @@ static void device_free_rd1_ring(struct vnt_private *priv)
 
 	for (i = 0; i < priv->opts.rx_descs1; i++) {
 		struct vnt_rx_desc *desc = &priv->aRD1Ring[i];
-		struct vnt_rd_info *rd_info = desc->rd_info;
-
-		dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
-				 priv->rx_buf_sz, DMA_FROM_DEVICE);
-
-		dev_kfree_skb(rd_info->skb);
 
+		device_free_rx_buf(priv, desc);
 		kfree(desc->rd_info);
 	}
 }
 
-static void device_init_td0_ring(struct vnt_private *priv)
+static int device_init_td0_ring(struct vnt_private *priv)
 {
 	int i;
 	dma_addr_t  curr;
 	struct vnt_tx_desc *desc;
+	int ret;
 
 	curr = priv->td0_pool_dma;
 	for (i = 0; i < priv->opts.tx_descs[0];
 	     i++, curr += sizeof(struct vnt_tx_desc)) {
 		desc = &priv->apTD0Rings[i];
 		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
+		if (!desc->td_info) {
+			ret = -ENOMEM;
+			goto err_free_desc;
+		}
 
 		desc->td_info->buf = priv->tx0_bufs + i * PKT_BUF_SZ;
 		desc->td_info->buf_dma = priv->tx_bufs_dma0 + i * PKT_BUF_SZ;
@@ -632,13 +673,24 @@ static void device_init_td0_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->apTD0Rings[i-1].next_desc = cpu_to_le32(priv->td0_pool_dma);
 	priv->apTailTD[0] = priv->apCurrTD[0] = &priv->apTD0Rings[0];
+
+	return 0;
+
+err_free_desc:
+	while (--i) {
+		desc = &priv->apTD0Rings[i];
+		kfree(desc->td_info);
+	}
+
+	return ret;
 }
 
-static void device_init_td1_ring(struct vnt_private *priv)
+static int device_init_td1_ring(struct vnt_private *priv)
 {
 	int i;
 	dma_addr_t  curr;
 	struct vnt_tx_desc *desc;
+	int ret;
 
 	/* Init the TD ring entries */
 	curr = priv->td1_pool_dma;
@@ -646,6 +698,10 @@ static void device_init_td1_ring(struct vnt_private *priv)
 	     i++, curr += sizeof(struct vnt_tx_desc)) {
 		desc = &priv->apTD1Rings[i];
 		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
+		if (!desc->td_info) {
+			ret = -ENOMEM;
+			goto err_free_desc;
+		}
 
 		desc->td_info->buf = priv->tx1_bufs + i * PKT_BUF_SZ;
 		desc->td_info->buf_dma = priv->tx_bufs_dma1 + i * PKT_BUF_SZ;
@@ -657,6 +713,16 @@ static void device_init_td1_ring(struct vnt_private *priv)
 	if (i > 0)
 		priv->apTD1Rings[i-1].next_desc = cpu_to_le32(priv->td1_pool_dma);
 	priv->apTailTD[1] = priv->apCurrTD[1] = &priv->apTD1Rings[0];
+
+	return 0;
+
+err_free_desc:
+	while (--i) {
+		desc = &priv->apTD1Rings[i];
+		kfree(desc->td_info);
+	}
+
+	return ret;
 }
 
 static void device_free_td0_ring(struct vnt_private *priv)
@@ -745,6 +811,16 @@ static bool device_alloc_rx_buf(struct vnt_private *priv,
 	return true;
 }
 
+static void device_free_rx_buf(struct vnt_private *priv,
+				struct vnt_rx_desc *rd)
+{
+	struct vnt_rd_info *rd_info = rd->rd_info;
+
+	dma_unmap_single(&priv->pcid->dev, rd_info->skb_dma,
+			priv->rx_buf_sz, DMA_FROM_DEVICE);
+	dev_kfree_skb(rd_info->skb);
+}
+
 static const u8 fallback_rate0[5][5] = {
 	{RATE_18M, RATE_18M, RATE_12M, RATE_12M, RATE_12M},
 	{RATE_24M, RATE_24M, RATE_18M, RATE_12M, RATE_12M},
@@ -1165,10 +1241,18 @@ static int vnt_start(struct ieee80211_hw *hw)
 	}
 
 	dev_dbg(&priv->pcid->dev, "call device init rd0 ring\n");
-	device_init_rd0_ring(priv);
-	device_init_rd1_ring(priv);
-	device_init_td0_ring(priv);
-	device_init_td1_ring(priv);
+	ret = device_init_rd0_ring(priv);
+	if (ret)
+		return ret;
+	ret = device_init_rd1_ring(priv);
+	if (ret)
+		goto err_free_rd0_ring;
+	ret = device_init_td0_ring(priv);
+	if (ret)
+		goto err_free_rd1_ring;
+	ret = device_init_td1_ring(priv);
+	if (ret)
+		goto err_free_td0_ring;
 
 	device_init_registers(priv);
 
@@ -1178,6 +1262,14 @@ static int vnt_start(struct ieee80211_hw *hw)
 	ieee80211_wake_queues(hw);
 
 	return 0;
+
+err_free_td0_ring:
+	device_free_td0_ring(priv);
+err_free_rd1_ring:
+	device_free_rd1_ring(priv);
+err_free_rd0_ring:
+	device_free_rd0_ring(priv);
+	return ret;
 }
 
 static void vnt_stop(struct ieee80211_hw *hw)
-- 
1.9.1

