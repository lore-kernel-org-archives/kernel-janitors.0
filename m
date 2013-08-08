From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Thu, 08 Aug 2013 18:35:24 +0000
Subject: [PATCH] Staging:zram:zram_drv.c Fixed Error of trailing whitespace
Message-Id: <1375986205-5912-1-git-send-email-kumargauravgupta3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, minchan@kernel.org, jiang.liu@huawei.com, ngupta@vflare.org, jmarchan@redhat.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kumargauravgupta3@gmail.com

Fixed by removing trailing whitespace

Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com>
---
 drivers/staging/zram/zram_drv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/zram/zram_drv.c b/drivers/staging/zram/zram_drv.c
index 82c7202..f590715 100644
--- a/drivers/staging/zram/zram_drv.c
+++ b/drivers/staging/zram/zram_drv.c
@@ -169,7 +169,7 @@ static inline int is_partial_io(struct bio_vec *bvec)
 static inline int valid_io_request(struct zram *zram, struct bio *bio)
 {
 	u64 start, end, bound;
-	
+
 	/* unaligned request */
 	if (unlikely(bio->bi_sector & (ZRAM_SECTOR_PER_LOGICAL_BLOCK - 1)))
 		return 0;
-- 
1.7.9.5

