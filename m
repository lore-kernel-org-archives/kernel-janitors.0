From: Colin King <colin.king@canonical.com>
Date: Wed, 12 Jun 2019 10:36:24 +0000
Subject: [PATCH][next] xfrm: fix missing break on AF_INET6 case
Message-Id: <20190612103624.27246-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

It appears that there is a missing break statement for the AF_INET6 case
that falls through to the default WARN_ONCE case. I don't think that is
intentional. Fix this by adding in the missing break.

Addresses-Coverity: ("Missing break in switch")
Fixes: 4c203b0454b5 ("xfrm: remove eth_proto value from xfrm_state_afinfo")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/xfrm/xfrm_input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 8a00cc94c32c..6088bc2dc11e 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -376,6 +376,7 @@ static int xfrm_prepare_input(struct xfrm_state *x, struct sk_buff *skb)
 		break;
 	case AF_INET6:
 		skb->protocol = htons(ETH_P_IPV6);
+		break;
 	default:
 		WARN_ON_ONCE(1);
 		break;
-- 
2.20.1
