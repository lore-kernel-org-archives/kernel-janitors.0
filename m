From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Feb 2019 14:30:55 +0000
Subject: [PATCH][next] block: don't dereference a potential null bio pointer until is has been null checked
Message-Id: <20190219143055.11633-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The bio pointer is being null checked hence it can be potentially
null, however earlier it is being derefefenced on the assignment of
front_seg_size.  Avoid the dereference issue by only assigning
front_seg_size after bios has been null sanity checked.

Fixes: dcebd755926b ("block: use bio_for_each_bvec() to compute multi-page bvec count")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 block/blk-merge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/blk-merge.c b/block/blk-merge.c
index bed065904677..1bec20fbe465 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -379,6 +379,7 @@ static unsigned int __blk_recalc_rq_segments(struct request_queue *q,
 		return 1;
 	}
 
+	front_seg_size = bio->bi_seg_front_size;
 	fbio = bio;
 	seg_size = 0;
 	nr_phys_segs = 0;
-- 
2.20.1
