From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Sep 2019 06:17:38 +0000
Subject: [PATCH] hdlc: Simplify code in 'pvc_xmit()'
Message-Id: <20190921061738.25326-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: khc@pm.waw.pl, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use __skb_pad instead of rewriting it, this saves some LoC.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/net/wan/hdlc_fr.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wan/hdlc_fr.c b/drivers/net/wan/hdlc_fr.c
index 9acad651ea1f..30f20b667c8b 100644
--- a/drivers/net/wan/hdlc_fr.c
+++ b/drivers/net/wan/hdlc_fr.c
@@ -414,16 +414,12 @@ static netdev_tx_t pvc_xmit(struct sk_buff *skb, struct net_device *dev)
 		if (dev->type = ARPHRD_ETHER) {
 			int pad = ETH_ZLEN - skb->len;
 			if (pad > 0) { /* Pad the frame with zeros */
-				int len = skb->len;
-				if (skb_tailroom(skb) < pad)
-					if (pskb_expand_head(skb, 0, pad,
-							     GFP_ATOMIC)) {
-						dev->stats.tx_dropped++;
-						dev_kfree_skb(skb);
-						return NETDEV_TX_OK;
-					}
+				if (__skb_pad(skb, pad, false) < 0) {
+					dev->stats.tx_dropped++;
+					dev_kfree_skb(skb);
+					return NETDEV_TX_OK;
+				}
 				skb_put(skb, pad);
-				memset(skb->data + len, 0, pad);
 			}
 			skb->protocol = cpu_to_be16(ETH_P_802_3);
 		}
-- 
2.20.1
