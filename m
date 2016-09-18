From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:16:35 +0000
Subject: [PATCH 05/10] firewire-net: Rename a jump label in fwnet_tx()
Message-Id: <5489efaa-fe38-5623-0faf-d0927ad32f50@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
In-Reply-To: <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 17 Sep 2016 22:22:58 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/net.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index 2ca2d57..24725be 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -1233,11 +1233,11 @@ static netdev_tx_t fwnet_tx(struct sk_buff *skb, struct net_device *net)
 
 	ptask = kmem_cache_alloc(fwnet_packet_task_cache, GFP_ATOMIC);
 	if (ptask = NULL)
-		goto fail;
+		goto unlock;
 
 	skb = skb_share_check(skb, GFP_ATOMIC);
 	if (!skb)
-		goto fail;
+		goto unlock;
 
 	/*
 	 * Make a copy of the driver-specific header.
@@ -1254,7 +1254,7 @@ static netdev_tx_t fwnet_tx(struct sk_buff *skb, struct net_device *net)
 #endif
 		break;
 	default:
-		goto fail;
+		goto unlock;
 	}
 
 	skb_pull(skb, sizeof(hdr_buf));
@@ -1279,7 +1279,7 @@ static netdev_tx_t fwnet_tx(struct sk_buff *skb, struct net_device *net)
 
 		peer = fwnet_peer_find_by_guid(dev, be64_to_cpu(guid));
 		if (!peer)
-			goto fail;
+			goto unlock;
 
 		generation         = peer->generation;
 		dest_node          = peer->node_id;
@@ -1324,8 +1324,7 @@ static netdev_tx_t fwnet_tx(struct sk_buff *skb, struct net_device *net)
 	fwnet_send_packet(ptask);
 
 	return NETDEV_TX_OK;
-
- fail:
+ unlock:
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	if (ptask)
-- 
2.10.0

