From: Julia Lawall <julia@diku.dk>
Date: Sun, 09 Dec 2007 20:03:55 +0000
Subject: [PATCH 2/3] Fix use of skb after netif_rx
Message-Id: <Pine.LNX.4.64.0712092102340.11165@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chris@zankel.net, wangchen@cn.fujitsu.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Recently, Wang Chen submitted a patch
(d30f53aeb31d453a5230f526bea592af07944564) to move a call to netif_rx(skb)
after a subsequent reference to skb, because netif_rx may call kfree_skb on
its argument.  The same problem occurs in some other drivers as well.

This was found using the following semantic match.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression skb, e,e1;
@@

(
 netif_rx(skb);
|
 netif_rx_ni(skb);
)
  ... when != skb = e
(
  skb = e1
|
* skb
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff a/arch/xtensa/platform-iss/network.c b/arch/xtensa/platform-iss/network.c
--- a/arch/xtensa/platform-iss/network.c	2007-10-22 16:31:51.000000000 +0200
+++ b/arch/xtensa/platform-iss/network.c	2007-12-05 19:01:34.000000000 +0100
@@ -393,11 +393,11 @@ static int iss_net_rx(struct net_device 
 	if (pkt_len > 0) {
 		skb_trim(skb, pkt_len);
 		skb->protocol = lp->tp.protocol(skb);
-	//	netif_rx(skb);
-		netif_rx_ni(skb);
 
 		lp->stats.rx_bytes += skb->len;
 		lp->stats.rx_packets++;
+	//	netif_rx(skb);
+		netif_rx_ni(skb);
 		return pkt_len;
 	}
 	kfree_skb(skb);
