From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Nov 2018 14:28:42 +0000
Subject: [PATCH] xfrm: policy: add missing indentation
Message-Id: <20181113142842.10531-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a missing indentation before the goto statement. Add it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/xfrm/xfrm_policy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index 119a427d9b2b..550b601fbba4 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -1811,7 +1811,7 @@ static void xfrm_policy_queue_process(struct timer_list *t)
 		pq->timeout = pq->timeout << 1;
 		if (!mod_timer(&pq->hold_timer, jiffies + pq->timeout))
 			xfrm_pol_hold(pol);
-	goto out;
+		goto out;
 	}
 
 	dst_release(dst);
-- 
2.19.1
