From: Shlomo Pongratz <shlomop@mellanox.com>
Date: Mon, 30 Jul 2012 15:20:30 +0000
Subject: [for-next PATCH] IB/IPoIB: typo error
Message-Id: <1343661630-1350-1-git-send-email-shlomop@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Shlomo Pongratz <shlomop-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

was is_held should be lockdep_is_held

Reporetd by: Roland Dreier <roland@kernel.org>

Signed-off-by: Shlomo Pongratz <shlomop@mellanox.com>
---
 drivers/infiniband/ulp/ipoib/ipoib_main.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/infiniband/ulp/ipoib/ipoib_main.c b/drivers/infiniband/ulp/ipoib/ipoib_main.c
index 61318a7..f1ff2f4 100644
--- a/drivers/infiniband/ulp/ipoib/ipoib_main.c
+++ b/drivers/infiniband/ulp/ipoib/ipoib_main.c
@@ -882,7 +882,7 @@ static void __ipoib_reap_neigh(struct ipoib_dev_priv *priv)
 		struct ipoib_neigh __rcu **np = &htbl->buckets[i];
 
 		while ((neigh = rcu_dereference_protected(*np,
-				is_held(&ntbl->rwlock))) != NULL) {
+				lockdep_is_held(&ntbl->rwlock))) != NULL) {
 			/* was the neigh idle for two GC periods */
 			if (time_after(neigh_obsolete, neigh->alive)) {
 				rcu_assign_pointer(*np,
-- 
1.7.1

