From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Apr 2019 06:10:06 +0000
Subject: [PATCH] block: make blk_queue_zone_sectors() return sector_t type
Message-Id: <20190410061006.GA18813@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>
Cc: Hannes Reinecke <hare@suse.com>, Omar Sandoval <osandov@fb.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bart Van Assche <bvanassche@acm.org>, Ming Lei <ming.lei@redhat.com>, Greg Edwards <gedwards@ddn.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains about this line from dmz_get_zoned_device()

	aligned_capacity = dev->capacity & ~(blk_queue_zone_sectors(q) - 1);

The problem is that "aligned_capacity" and "dev->capacity" are sector_t
type (which is a u64) but blk_queue_zone_sectors(q) returns a u32 so the
higher 32 bits in aligned_capacity are always cleared to zero.

Declaring blk_queue_zone_sectors() as a sector_t addresses this warning
and it feels intuitive based on the function name.  I updated
bdev_zone_sectors() as well just to be consistent.

Fixes: 114e025968b5 ("dm zoned: ignore last smaller runt zone")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Please review this one extra carefully.  I'm not positive it's correct.

 include/linux/blkdev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 4b85dc066264..1785a7f506be 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -670,7 +670,7 @@ static inline bool blk_queue_is_zoned(struct request_queue *q)
 	}
 }
 
-static inline unsigned int blk_queue_zone_sectors(struct request_queue *q)
+static inline sector_t blk_queue_zone_sectors(struct request_queue *q)
 {
 	return blk_queue_is_zoned(q) ? q->limits.chunk_sectors : 0;
 }
@@ -1419,7 +1419,7 @@ static inline bool bdev_is_zoned(struct block_device *bdev)
 	return false;
 }
 
-static inline unsigned int bdev_zone_sectors(struct block_device *bdev)
+static inline sector_t bdev_zone_sectors(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
 
-- 
2.17.1
