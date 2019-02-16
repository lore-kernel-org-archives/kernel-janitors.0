From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 16 Feb 2019 01:48:09 +0000
Subject: [PATCH net-next] net: sgi: use GFP_ATOMIC under spin lock
Message-Id: <20190216014809.142801-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Yang Wei <yang.wei9@zte.com.cn>, Luis Chamberlain <mcgrof@kernel.org>, YueHaibing <yuehaibing@huawei.com>, Christoph Hellwig <hch@lst.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The function meth_init_tx_ring() is called from meth_tx_timeout(),
in which spin_lock is held, so we should use GFP_ATOMIC instead.

Fixes: 8d4c28fbc284 ("meth: pass struct device to DMA API functions")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/sgi/meth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sgi/meth.c b/drivers/net/ethernet/sgi/meth.c
index f425ab528224..f1271402ca21 100644
--- a/drivers/net/ethernet/sgi/meth.c
+++ b/drivers/net/ethernet/sgi/meth.c
@@ -214,7 +214,7 @@ static int meth_init_tx_ring(struct meth_private *priv)
 {
 	/* Init TX ring */
 	priv->tx_ring = dma_alloc_coherent(&priv->pdev->dev,
-			TX_RING_BUFFER_SIZE, &priv->tx_ring_dma, GFP_KERNEL);
+			TX_RING_BUFFER_SIZE, &priv->tx_ring_dma, GFP_ATOMIC);
 	if (!priv->tx_ring)
 		return -ENOMEM;
