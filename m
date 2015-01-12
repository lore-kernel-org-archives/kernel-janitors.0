From: Igor Ishchenko <igor.ishchenko@coderivium.com>
Date: Mon, 12 Jan 2015 16:16:26 +0000
Subject: [PATCH] staging: lustre: lnet: Removed spaces before increments and decrements
Message-Id: <1421079386-3766-1-git-send-email-igor.ishchenko@coderivium.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixed a coding style issue

Signed-off-by: Igor Ishchenko <igor.ishchenko@coderivium.com>
---
 drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
index 62b575d..6510169 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
@@ -1538,7 +1538,7 @@ kiblnd_fmr_pool_unmap(kib_fmr_t *fmr, int status)
 	fmr->fmr_pfmr = NULL;
 
 	spin_lock(&fps->fps_lock);
-	fpo->fpo_map_count --;  /* decref the pool */
+	fpo->fpo_map_count--;  /* decref the pool */
 
 	list_for_each_entry_safe(fpo, tmp, &fps->fps_pool_list, fpo_list) {
 		/* the first pool is persistent */
@@ -1547,7 +1547,7 @@ kiblnd_fmr_pool_unmap(kib_fmr_t *fmr, int status)
 
 		if (kiblnd_fmr_pool_is_idle(fpo, now)) {
 			list_move(&fpo->fpo_list, &zombies);
-			fps->fps_version ++;
+			fps->fps_version++;
 		}
 	}
 	spin_unlock(&fps->fps_lock);
@@ -1752,7 +1752,7 @@ kiblnd_pool_free_node(kib_pool_t *pool, struct list_head *node)
 
 	LASSERT (pool->po_allocated > 0);
 	list_add(node, &pool->po_free_list);
-	pool->po_allocated --;
+	pool->po_allocated--;
 
 	list_for_each_entry_safe(pool, tmp, &ps->ps_pool_list, po_list) {
 		/* the first pool is persistent */
@@ -1781,7 +1781,7 @@ kiblnd_pool_alloc_node(kib_poolset_t *ps)
 		if (list_empty(&pool->po_free_list))
 			continue;
 
-		pool->po_allocated ++;
+		pool->po_allocated++;
 		pool->po_deadline = cfs_time_shift(IBLND_POOL_DEADLINE);
 		node = pool->po_free_list.next;
 		list_del(node);
@@ -1864,7 +1864,7 @@ kiblnd_pmr_pool_map(kib_pmr_poolset_t *pps, kib_hca_dev_t *hdev,
 		return -EAGAIN;
 	}
 
-	for (i = 0; i < rd->rd_nfrags; i ++) {
+	for (i = 0; i < rd->rd_nfrags; i++) {
 		pmr->pmr_ipb[i].addr = rd->rd_frags[i].rf_addr;
 		pmr->pmr_ipb[i].size = rd->rd_frags[i].rf_nob;
 	}
@@ -2117,7 +2117,7 @@ kiblnd_tx_init(kib_pool_t *pool, struct list_head *node)
 					     tps_poolset);
 	kib_tx_t	 *tx  = list_entry(node, kib_tx_t, tx_list);
 
-	tx->tx_cookie = tps->tps_next_tx_cookie ++;
+	tx->tx_cookie = tps->tps_next_tx_cookie++;
 }
 
 static void
@@ -2326,7 +2326,7 @@ kiblnd_hdev_get_attr(kib_hca_dev_t *hdev)
 	}
 
 	for (hdev->ibh_mr_shift = 0;
-	     hdev->ibh_mr_shift < 64; hdev->ibh_mr_shift ++) {
+	     hdev->ibh_mr_shift < 64; hdev->ibh_mr_shift++) {
 		if (hdev->ibh_mr_size = (1ULL << hdev->ibh_mr_shift) ||
 		    hdev->ibh_mr_size = (1ULL << hdev->ibh_mr_shift) - 1)
 			return 0;
-- 
2.1.4

