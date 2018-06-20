From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jun 2018 10:39:53 +0000
Subject: [PATCH] f2fs: Fix uninitialized return in f2fs_ioc_shutdown()
Message-Id: <20180620103953.bxdqzy2izn3elii7@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk@kernel.org>, Sahitya Tummala <stummala@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

"ret" can be uninitialized on the success path when "in =
F2FS_GOING_DOWN_FULLSYNC".

Fixes: 60b2b4ee2bc0 ("f2fs: Fix deadlock in shutdown ioctl")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6880c6f78d58..73c875c81ed6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1866,7 +1866,7 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct super_block *sb = sbi->sb;
 	__u32 in;
-	int ret;
+	int ret = 0;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
