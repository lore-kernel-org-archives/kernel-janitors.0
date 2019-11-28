From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Nov 2019 12:29:58 +0000
Subject: [PATCH] zram: fix error return codes not being returned in writeback_store
Message-Id: <20191128122958.178290-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-block@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when an error code -EIO or -ENOSPC in the for-loop of
writeback_store the error code is being overwritten by a ret = len
assignment at the end of the function and the error codes are being
lost.  Fix this by assigning ret = len at the start of the function
and remove the assignment from the end, hence allowing ret to be
preserved when error codes are assigned to it.

Addresses-Coverity: ("Unused value")
Fixes: a939888ec38b ("zram: support idle/huge page writeback")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/zram/zram_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 4285e75e52c3..1bf4a908a0bd 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -626,7 +626,7 @@ static ssize_t writeback_store(struct device *dev,
 	struct bio bio;
 	struct bio_vec bio_vec;
 	struct page *page;
-	ssize_t ret;
+	ssize_t ret = len;
 	int mode;
 	unsigned long blk_idx = 0;
 
@@ -762,7 +762,6 @@ static ssize_t writeback_store(struct device *dev,
 
 	if (blk_idx)
 		free_block_bdev(zram, blk_idx);
-	ret = len;
 	__free_page(page);
 release_init_lock:
 	up_read(&zram->init_lock);
-- 
2.24.0
