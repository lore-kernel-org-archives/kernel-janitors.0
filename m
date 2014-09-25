From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Sep 2014 11:39:17 +0000
Subject: [patch] f2fs: potential shift wrapping buf in f2fs_trim_fs()
Message-Id: <20140925113917.GA3708@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Changman Lee <cm224.lee@samsung.com>, linux-f2fs-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

My static checker complains that segment is a u64 but only the lower 31
bits can be used before we hit a shift wrapping bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b423005..d8ed1b8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -949,7 +949,7 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 	block_t start_addr = SM_I(sbi)->main_blkaddr;
 	__u64 start = range->start >> sbi->log_blocksize;
 	__u64 end = start + (range->len >> sbi->log_blocksize) - 1;
-	__u64 segment = 1 << (sbi->log_blocksize + sbi->log_blocks_per_seg);
+	__u64 segment = 1ULL << (sbi->log_blocksize + sbi->log_blocks_per_seg);
 	unsigned int start_segno, end_segno;
 	struct cp_control cpc;
 
