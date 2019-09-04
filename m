From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 04 Sep 2019 09:42:11 +0000
Subject: [PATCH net] net: sonic: remove dev_kfree_skb before return NETDEV_TX_BUSY
Message-Id: <20190904094211.117454-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tsbogend@alpha.franken.de, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

When dma_map_single is failed to map buffer, skb can't be freed
before sonic driver return to stack with NETDEV_TX_BUSY, because
this skb may be requeued to qdisc, it might trigger use-after-free.

Fixes: d9fb9f384292 ("*sonic/natsemi/ns83829: Move the National Semi-conductor drivers")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/net/ethernet/natsemi/sonic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/natsemi/sonic.c b/drivers/net/ethernet/natsemi/sonic.c
index d0a01e8f000a..248a8f22a33b 100644
--- a/drivers/net/ethernet/natsemi/sonic.c
+++ b/drivers/net/ethernet/natsemi/sonic.c
@@ -233,7 +233,6 @@ static int sonic_send_packet(struct sk_buff *skb, struct net_device *dev)
 	laddr = dma_map_single(lp->device, skb->data, length, DMA_TO_DEVICE);
 	if (!laddr) {
 		printk(KERN_ERR "%s: failed to map tx DMA buffer.\n", dev->name);
-		dev_kfree_skb(skb);
 		return NETDEV_TX_BUSY;
 	}
 
-- 
2.20.1
