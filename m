From: Qi Yong <qiyong@fc-cn.com>
Date: Mon, 03 Dec 2007 03:43:59 +0000
Subject: [patch] kill an unused PTR_ERR in bdev_cache_init
Message-Id: <200712031143.59946.qiyong@fc-cn.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Kill an old unused PTR_ERR in bdev_cache_init().


Signed-off-by: Qi Yong <qiyong@fc-cn.com>

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 993f78c..b5fa625 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -534,7 +534,6 @@ void __init bdev_cache_init(void)
 	if (err)
 		panic("Cannot register bdev pseudo-fs");
 	bd_mnt = kern_mount(&bd_type);
-	err = PTR_ERR(bd_mnt);
 	if (IS_ERR(bd_mnt))
 		panic("Cannot create bdev pseudo-fs");
 	blockdev_superblock = bd_mnt->mnt_sb;	/* For writeback */
-- 
Qi Yong
