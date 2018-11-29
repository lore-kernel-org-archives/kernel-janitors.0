From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Nov 2018 10:56:54 +0000
Subject: [PATCH 2/2] blk-mq: Add a NULL check in blk_mq_free_map_and_requests()
Message-Id: <20181129105654.5icpvxx7p2kq257c@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20181129105519.mklhnmx34yjucb22@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Omar Sandoval <osandov@fb.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

I recently found some code which called blk_mq_free_map_and_requests()
with a NULL set->tags pointer.  I fixed the caller, but it seems like a
good idea to add a NULL check here as well.  Now we can call:

	blk_mq_free_tag_set(set);
	blk_mq_free_tag_set(set);

twice in a row and it's harmless.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 block/blk-mq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index a82830f39933..5f4b93f424b4 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2341,7 +2341,7 @@ static bool __blk_mq_alloc_rq_map(struct blk_mq_tag_set *set, int hctx_idx)
 static void blk_mq_free_map_and_requests(struct blk_mq_tag_set *set,
 					 unsigned int hctx_idx)
 {
-	if (set->tags[hctx_idx]) {
+	if (set->tags && set->tags[hctx_idx]) {
 		blk_mq_free_rqs(set, set->tags[hctx_idx], hctx_idx);
 		blk_mq_free_rq_map(set->tags[hctx_idx]);
 		set->tags[hctx_idx] = NULL;
-- 
2.11.0
