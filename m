From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Feb 2019 14:37:02 +0000
Subject: [PATCH][next][V2] block: don't dereference a potential null bio pointer until is has been null check
Message-Id: <20190219143702.11926-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The bio pointer is being null checked hence it can be potentially null,
however earlier it is being derefefenced on the assignment of front_seg_size.
Avoid the dereference issue by only assigning front_seg_size after bios has
been null sanity checked.

Fixes: dcebd755926b ("block: use bio_for_each_bvec() to compute multi-page bvec count")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: remove front_seg_size assignment when it is declared

---
 block/blk-merge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/blk-merge.c b/block/blk-merge.c
index bed065904677..096947413ea9 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -363,7 +363,7 @@ static unsigned int __blk_recalc_rq_segments(struct request_queue *q,
 	struct bio_vec bv, bvprv = { NULL };
 	int prev = 0;
 	unsigned int seg_size, nr_phys_segs;
-	unsigned front_seg_size = bio->bi_seg_front_size;
+	unsigned front_seg_size;
 	struct bio *fbio, *bbio;
 	struct bvec_iter iter;
 
@@ -379,6 +379,7 @@ static unsigned int __blk_recalc_rq_segments(struct request_queue *q,
 		return 1;
 	}
 
+	front_seg_size = bio->bi_seg_front_size;
 	fbio = bio;
 	seg_size = 0;
 	nr_phys_segs = 0;
-- 
2.20.1
