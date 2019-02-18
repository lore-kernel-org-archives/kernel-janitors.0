From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 18 Feb 2019 06:52:16 +0000
Subject: [PATCH] mac80211: mesh: fix missing unlock on error in table_path_del()
Message-Id: <20190218065216.155259-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

spin_lock_bh() is used in table_path_del() but rcu_read_unlock()
is used for unlocking. Fix it by using spin_unlock_bh() instead
of rcu_read_unlock() in the error handling case.

Fixes: b4c3fbe63601 ("mac80211: Use linked list instead of rhashtable walk for mesh tables")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/mac80211/mesh_pathtbl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/mesh_pathtbl.c b/net/mac80211/mesh_pathtbl.c
index c3a7396fb955..9bdeac2749e9 100644
--- a/net/mac80211/mesh_pathtbl.c
+++ b/net/mac80211/mesh_pathtbl.c
@@ -627,7 +627,7 @@ static int table_path_del(struct mesh_table *tbl,
 	spin_lock_bh(&tbl->walk_lock);
 	mpath = rhashtable_lookup_fast(&tbl->rhead, addr, mesh_rht_params);
 	if (!mpath) {
-		rcu_read_unlock();
+		spin_unlock_bh(&tbl->walk_lock);
 		return -ENXIO;
 	}
