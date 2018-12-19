From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 19 Dec 2018 01:12:20 +0000
Subject: [PATCH net-next] xfrm: policy: remove set but not used variable 'priority'
Message-Id: <1545181940-100883-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

net/xfrm/xfrm_policy.c: In function 'xfrm_policy_lookup_bytype':
net/xfrm/xfrm_policy.c:2079:6: warning:
 variable 'priority' set but not used [-Wunused-but-set-variable]

It not used since commit 6be3b0db6db8 ("xfrm: policy: add inexact policy
search tree infrastructure")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/xfrm/xfrm_policy.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index be04091..537b7ee 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -2076,7 +2076,6 @@ static struct xfrm_policy *xfrm_policy_lookup_bytype(struct net *net, u8 type,
 	struct xfrm_policy *pol, *ret;
 	struct hlist_head *chain;
 	unsigned int sequence;
-	u32 priority;
 	int err;
 
 	daddr = xfrm_flowi_daddr(fl, family);
@@ -2091,7 +2090,6 @@ static struct xfrm_policy *xfrm_policy_lookup_bytype(struct net *net, u8 type,
 		chain = policy_hash_direct(net, daddr, saddr, family, dir);
 	} while (read_seqcount_retry(&xfrm_policy_hash_generation, sequence));
 
-	priority = ~0U;
 	ret = NULL;
 	hlist_for_each_entry_rcu(pol, chain, bydst) {
 		err = xfrm_policy_match(pol, fl, type, family, dir, if_id);
@@ -2104,7 +2102,6 @@ static struct xfrm_policy *xfrm_policy_lookup_bytype(struct net *net, u8 type,
 			}
 		} else {
 			ret = pol;
-			priority = ret->priority;
 			break;
 		}
 	}
