From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:23 +0000
Subject: [PATCH 30/39] block: drop null test before destroy functions
Message-Id: <1442146532-9100-31-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 block/bio-integrity.c |    7 ++-----
 block/bio.c           |    7 ++-----
 block/blk-core.c      |    3 +--
 block/elevator.c      |    3 +--
 4 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/block/elevator.c b/block/elevator.c
index 84d6394..e3e9021 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -847,8 +847,7 @@ int elv_register(struct elevator_type *e)
 	spin_lock(&elv_list_lock);
 	if (elevator_find(e->elevator_name)) {
 		spin_unlock(&elv_list_lock);
-		if (e->icq_cache)
-			kmem_cache_destroy(e->icq_cache);
+		kmem_cache_destroy(e->icq_cache);
 		return -EBUSY;
 	}
 	list_add_tail(&e->list, &elv_list);
diff --git a/block/bio.c b/block/bio.c
index ad3f276..aee3290 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1850,11 +1850,8 @@ void bioset_free(struct bio_set *bs)
 	if (bs->rescue_workqueue)
 		destroy_workqueue(bs->rescue_workqueue);
 
-	if (bs->bio_pool)
-		mempool_destroy(bs->bio_pool);
-
-	if (bs->bvec_pool)
-		mempool_destroy(bs->bvec_pool);
+	mempool_destroy(bs->bio_pool);
+	mempool_destroy(bs->bvec_pool);
 
 	bioset_integrity_free(bs);
 	bio_put_slab(bs);
diff --git a/block/blk-core.c b/block/blk-core.c
index 2eb722d..7dbebd9 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -619,8 +619,7 @@ int blk_init_rl(struct request_list *rl, struct request_queue *q,
 
 void blk_exit_rl(struct request_list *rl)
 {
-	if (rl->rq_pool)
-		mempool_destroy(rl->rq_pool);
+	mempool_destroy(rl->rq_pool);
 }
 
 struct request_queue *blk_alloc_queue(gfp_t gfp_mask)
diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index 4aecca7..d3e3046 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -490,11 +490,8 @@ EXPORT_SYMBOL(bioset_integrity_create);
 
 void bioset_integrity_free(struct bio_set *bs)
 {
-	if (bs->bio_integrity_pool)
-		mempool_destroy(bs->bio_integrity_pool);
-
-	if (bs->bvec_integrity_pool)
-		mempool_destroy(bs->bvec_integrity_pool);
+	mempool_destroy(bs->bio_integrity_pool);
+	mempool_destroy(bs->bvec_integrity_pool);
 }
 EXPORT_SYMBOL(bioset_integrity_free);
 

