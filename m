From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Nov 2018 10:55:19 +0000
Subject: [PATCH 1/2] ataflop: fix error handling in atari_floppy_init()
Message-Id: <20181129105519.mklhnmx34yjucb22@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Omar Sandoval <osandov@fb.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that there is an off by one if the allocation fails in:

	DMABuffer = atari_stram_alloc(BUFFER_SIZE+512, "ataflop");

In that situation, "i" would be point to one element beyond the end of
the unit[] array.

There is a second bug because the error handling calls
blk_mq_free_tag_set(&unit[i].tag_set); regardless of whether
"disk->queue" is NULL or non-NULL.  So if blk_mq_init_sq_queue() fails,
then that means unit[i].tag_set->tags is NULL and it leads to an Oops.

It's easiest to call put_disk() before the goto to clean up the partial
iteration.  Then the earlier unit[] elements are fully allocated so we
can remove the checks whether "disk->queue" is NULL and the code is
simpler.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---

I hope the Atari floppy disk users are appropriately grateful for all
the love and effort we put into their software...

 drivers/block/ataflop.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index f88b4c26d422..313064b1005c 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -1982,6 +1982,7 @@ static int __init atari_floppy_init (void)
 							   &ataflop_mq_ops, 2,
 							   BLK_MQ_F_SHOULD_MERGE);
 		if (IS_ERR(unit[i].disk->queue)) {
+			put_disk(unit[i].disk);
 			ret = PTR_ERR(unit[i].disk->queue);
 			unit[i].disk->queue = NULL;
 			goto err;
@@ -2033,18 +2034,13 @@ static int __init atari_floppy_init (void)
 	return 0;
 
 err:
-	do {
+	while (--i >= 0) {
 		struct gendisk *disk = unit[i].disk;
 
-		if (disk) {
-			if (disk->queue) {
-				blk_cleanup_queue(disk->queue);
-				disk->queue = NULL;
-			}
-			blk_mq_free_tag_set(&unit[i].tag_set);
-			put_disk(unit[i].disk);
-		}
-	} while (i--);
+		blk_cleanup_queue(disk->queue);
+		blk_mq_free_tag_set(&unit[i].tag_set);
+		put_disk(unit[i].disk);
+	}
 
 	unregister_blkdev(FLOPPY_MAJOR, "fd");
 	return ret;
-- 
2.11.0
