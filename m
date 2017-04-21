From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Apr 2017 10:49:37 +0000
Subject: [PATCH] net: tc35815: move free after the dereference
Message-Id: <20170421104937.7sxibmruc6pvp26p@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: Philippe Reynes <tremyfr@gmail.com>, Jarod Wilson <jarod@redhat.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We dereference "skb" to get "skb->len" so we should probably do that
step before freeing the skb.

Fixes: eea221ce4880 ("tc35815 driver update (take 2)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index ad6db05b97d6..d9db8a06afd2 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -1017,8 +1017,8 @@ tc35815_free_queues(struct net_device *dev)
 			BUG_ON(lp->tx_skbs[i].skb != skb);
 #endif
 			if (skb) {
-				dev_kfree_skb(skb);
 				pci_unmap_single(lp->pci_dev, lp->tx_skbs[i].skb_dma, skb->len, PCI_DMA_TODEVICE);
+				dev_kfree_skb(skb);
 				lp->tx_skbs[i].skb = NULL;
 				lp->tx_skbs[i].skb_dma = 0;
 			}
