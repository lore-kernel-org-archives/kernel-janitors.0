From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Mar 2016 07:45:10 +0000
Subject: [patch] ethernet: micrel: fix some error codes
Message-Id: <20160316074510.GF12860@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Richard =?iso-8859-1?Q?R=F6jfors?= <richard.rojfors@pelagicore.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There were two issues here:
1) dma_mapping_error() return true/false but we want to return -ENOMEM
2) If dmaengine_prep_slave_sg() failed then "err" wasn't set but
   presumably that should be -ENOMEM as well.

I changed the success path to "return 0;" instead of "return ret;" for
clarity.

Fixes: 94fe8c683cea ('ks8842: Support DMA when accessed via timberdale')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/micrel/ks8842.c b/drivers/net/ethernet/micrel/ks8842.c
index 09d2e16..cb0102d 100644
--- a/drivers/net/ethernet/micrel/ks8842.c
+++ b/drivers/net/ethernet/micrel/ks8842.c
@@ -561,8 +561,8 @@ static int __ks8842_start_new_rx_dma(struct net_device *netdev)
 		sg_init_table(sg, 1);
 		sg_dma_address(sg) = dma_map_single(adapter->dev,
 			ctl->skb->data, DMA_BUFFER_SIZE, DMA_FROM_DEVICE);
-		err = dma_mapping_error(adapter->dev, sg_dma_address(sg));
-		if (unlikely(err)) {
+		if (dma_mapping_error(adapter->dev, sg_dma_address(sg))) {
+			err = -ENOMEM;
 			sg_dma_address(sg) = 0;
 			goto out;
 		}
@@ -572,8 +572,10 @@ static int __ks8842_start_new_rx_dma(struct net_device *netdev)
 		ctl->adesc = dmaengine_prep_slave_sg(ctl->chan,
 			sg, 1, DMA_DEV_TO_MEM, DMA_PREP_INTERRUPT);
 
-		if (!ctl->adesc)
+		if (!ctl->adesc) {
+			err = -ENOMEM;
 			goto out;
+		}
 
 		ctl->adesc->callback_param = netdev;
 		ctl->adesc->callback = ks8842_dma_rx_cb;
@@ -584,7 +586,7 @@ static int __ks8842_start_new_rx_dma(struct net_device *netdev)
 		goto out;
 	}
 
-	return err;
+	return 0;
 out:
 	if (sg_dma_address(sg))
 		dma_unmap_single(adapter->dev, sg_dma_address(sg),
