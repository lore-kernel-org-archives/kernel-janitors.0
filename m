From: Dan Carpenter <error27@gmail.com>
Date: Wed, 20 Jul 2011 08:51:49 +0000
Subject: [patch net-next-2.6 v2] skbuff: fix error handling in pskb_copy()
Message-Id: <20110720085149.GI6445@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110720072343.GF6445@shale.localdomain>
In-Reply-To: <20110720072343.GF6445@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shirley Ma <xma@us.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

There are two problems:
1) "n" was allocated with alloc_skb() so we should free it with
   kfree_skb() instead of regular kfree().
2) We return the freed pointer instead of NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index d220119..2beda82 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -799,7 +799,8 @@ struct sk_buff *pskb_copy(struct sk_buff *skb, gfp_t gfp_mask)
 
 		if (skb_shinfo(skb)->tx_flags & SKBTX_DEV_ZEROCOPY) {
 			if (skb_copy_ubufs(skb, gfp_mask)) {
-				kfree(n);
+				kfree_skb(n);
+				n = NULL;
 				goto out;
 			}
 			skb_shinfo(skb)->tx_flags &= ~SKBTX_DEV_ZEROCOPY;
