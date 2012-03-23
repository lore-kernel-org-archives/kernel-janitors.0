From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2012 08:36:25 +0000
Subject: [patch] block: use caller's GFP flags instead of GFP_KERNEL
Message-Id: <20120323083624.GC18239@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should use the GFP flags that the caller specified instead of picking
our own.  All the callers specify GFP_KERNEL so this doesn't make a
difference to how the kernel runs, it's just a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/block/blk-core.c b/block/blk-core.c
index 3a78b00..414e822 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -483,7 +483,7 @@ struct request_queue *blk_alloc_queue_node(gfp_t gfp_mask, int node_id)
 	if (!q)
 		return NULL;
 
-	q->id = ida_simple_get(&blk_queue_ida, 0, 0, GFP_KERNEL);
+	q->id = ida_simple_get(&blk_queue_ida, 0, 0, gfp_mask);
 	if (q->id < 0)
 		goto fail_q;
 
