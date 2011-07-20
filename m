From: Dan Carpenter <error27@gmail.com>
Date: Wed, 20 Jul 2011 07:23:43 +0000
Subject: [patch] skbuff: use kfree_skb() instead of kfree()
Message-Id: <20110720072343.GF6445@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shirley Ma <xma@us.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

"n" was allocated with alloc_skb() so we should free it with
kfree_skb() instead of regular kfree().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index d220119..cc0c6f0 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -799,7 +799,7 @@ struct sk_buff *pskb_copy(struct sk_buff *skb, gfp_t gfp_mask)
 
 		if (skb_shinfo(skb)->tx_flags & SKBTX_DEV_ZEROCOPY) {
 			if (skb_copy_ubufs(skb, gfp_mask)) {
-				kfree(n);
+				kfree_skb(n);
 				goto out;
 			}
 			skb_shinfo(skb)->tx_flags &= ~SKBTX_DEV_ZEROCOPY;
