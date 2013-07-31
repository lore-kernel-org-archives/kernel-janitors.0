From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 31 Jul 2013 08:44:13 +0000
Subject: [patch] f2fs: remove an unneeded kfree(NULL)
Message-Id: <20130731084413.GA8210@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk.kim@samsung.com>, Gu Zheng <guz.fnst@cn.fujitsu.com>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

This kfree() is no longer needed after a79dc083d7 "f2fs: move
bio_private allocation out of f2fs_bio_alloc()".  The "bio->bi_private"
is NULL here so it's a no-op.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 19cd7c6..027341c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -390,7 +390,6 @@ int f2fs_readpage(struct f2fs_sb_info *sbi, struct page *page,
 	bio->bi_end_io = read_end_io;
 
 	if (bio_add_page(bio, page, PAGE_CACHE_SIZE, 0) < PAGE_CACHE_SIZE) {
-		kfree(bio->bi_private);
 		bio_put(bio);
 		up_read(&sbi->bio_sem);
 		f2fs_put_page(page, 1);
