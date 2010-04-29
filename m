From: Dan Carpenter <error27@gmail.com>
Date: Thu, 29 Apr 2010 14:30:35 +0000
Subject: [patch] ipv6: cleanup: remove unneeded null check
Message-Id: <20100429143034.GI29093@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, Eric Dumazet <eric.dumazet@gmail.com>, Sridhar Samudrala <sri@us.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>, Emil S Tantilov <emils.tantilov@gmail.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

We dereference "sk" unconditionally elsewhere in the function.  

This was left over from:  b30bd282 "ip6_xmit: remove unnecessary NULL
ptr check".  According to that commit message, "the sk argument to 
ip6_xmit is never NULL nowadays since the skb->priority assigment 
expects a valid socket."

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 75d5ef8..d26c6ae 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -218,8 +218,7 @@ int ip6_xmit(struct sock *sk, struct sk_buff *skb, struct flowi *fl,
 			}
 			kfree_skb(skb);
 			skb = skb2;
-			if (sk)
-				skb_set_owner_w(skb, sk);
+			skb_set_owner_w(skb, sk);
 		}
 		if (opt->opt_flen)
 			ipv6_push_frag_opts(skb, opt, &proto);
