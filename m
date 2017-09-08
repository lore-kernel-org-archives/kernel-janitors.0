From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Sep 2017 10:23:57 +0000
Subject: [PATCH net] net: qualcomm: rmnet: Fix a double free
Message-Id: <20170908102356.tzysh6qaiesd2umz@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is called from rmnet_map_ingress_handler().  When the
rmnet_map_deaggregate() returns NULL then the caller calls
consume_skb(skb) which frees the skb.  The kfree_skb() on this error
path leads to a double free.

Fixes: ceed73a2cf4a ("drivers: net: ethernet: qualcomm: rmnet: Initial implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from static analysis and not tested.

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index 557c9bf1a469..0335fce54201 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -95,10 +95,8 @@ struct sk_buff *rmnet_map_deaggregate(struct sk_buff *skb)
 	skb_pull(skb, packet_len);
 
 	/* Some hardware can send us empty frames. Catch them */
-	if (ntohs(maph->pkt_len) = 0) {
-		kfree_skb(skb);
+	if (ntohs(maph->pkt_len) = 0)
 		return NULL;
-	}
 
 	return skbn;
 }
