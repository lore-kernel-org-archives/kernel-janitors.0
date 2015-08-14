From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Aug 2015 08:54:59 +0000
Subject: [patch] net: ethernet: micrel: fix an error code
Message-Id: <20150814085459.GC30728@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The dma_mapping_error() function returns true or false.  We should
return -ENOMEM if it there is a dma mapping error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/micrel/ks8842.c b/drivers/net/ethernet/micrel/ks8842.c
index f78909a..09d2e16 100644
--- a/drivers/net/ethernet/micrel/ks8842.c
+++ b/drivers/net/ethernet/micrel/ks8842.c
@@ -952,9 +952,8 @@ static int ks8842_alloc_dma_bufs(struct net_device *netdev)
 
 	sg_dma_address(&tx_ctl->sg) = dma_map_single(adapter->dev,
 		tx_ctl->buf, DMA_BUFFER_SIZE, DMA_TO_DEVICE);
-	err = dma_mapping_error(adapter->dev,
-		sg_dma_address(&tx_ctl->sg));
-	if (err) {
+	if (dma_mapping_error(adapter->dev, sg_dma_address(&tx_ctl->sg))) {
+		err = -ENOMEM;
 		sg_dma_address(&tx_ctl->sg) = 0;
 		goto err;
 	}
