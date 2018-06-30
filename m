From: Colin King <colin.king@canonical.com>
Date: Sat, 30 Jun 2018 20:39:24 +0000
Subject: [PATCH][next] netdevsim: fix sa_idx out of bounds check
Message-Id: <20180630203924.5121-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <jakub.kicinski@netronome.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if sa_idx is equal to NSIM_IPSEC_MAX_SA_COUNT then
an out-of-bounds read on ipsec->sa will occur. Fix the
incorrect bounds check by using >= rather than >.

Detected by CoverityScan, CID#1470226 ("Out-of-bounds-read")

Fixes: 7699353da875 ("netdevsim: add ipsec offload testing")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/netdevsim/ipsec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/netdevsim/ipsec.c b/drivers/net/netdevsim/ipsec.c
index ceff544510b9..2dcf6cc269d0 100644
--- a/drivers/net/netdevsim/ipsec.c
+++ b/drivers/net/netdevsim/ipsec.c
@@ -249,7 +249,7 @@ bool nsim_ipsec_tx(struct netdevsim *ns, struct sk_buff *skb)
 	}
 
 	sa_idx = xs->xso.offload_handle & ~NSIM_IPSEC_VALID;
-	if (unlikely(sa_idx > NSIM_IPSEC_MAX_SA_COUNT)) {
+	if (unlikely(sa_idx >= NSIM_IPSEC_MAX_SA_COUNT)) {
 		netdev_err(ns->netdev, "bad sa_idx=%d max=%d\n",
 			   sa_idx, NSIM_IPSEC_MAX_SA_COUNT);
 		return false;
-- 
2.17.1

