From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 13 Sep 2014 08:09:28 +0000
Subject: [patch -next] blk-mq: NULL dereference in __blk_mq_alloc_rq_maps()
Message-Id: <20140913080928.GA6469@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "Elliott, Robert (Server Storage)" <Elliott@hp.com>

We shouldn't set "set->tags" to NULL here because if we return -ENOMEM
here then we call the function a second time.  On the second time
through the loop then the statement:

	set->tags[i] = blk_mq_init_rq_map(set, i);

will Oops.  Also it is a memory leak and a layering violation.  There is
a correct call to kfree(set->tags) in blk_mq_alloc_tag_set().

Fixes: a516440542af ('blk-mq: scale depth and rq map appropriate if low on memory')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 3d863df..7e7ca57 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1961,7 +1961,6 @@ out_unwind:
 	while (--i >= 0)
 		blk_mq_free_rq_map(set, set->tags[i], i);
 
-	set->tags = NULL;
 	return -ENOMEM;
 }
 
