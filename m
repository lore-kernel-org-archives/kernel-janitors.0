From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 10 Nov 2018 07:21:40 +0000
Subject: [PATCH -next] ocfs2: remove set but not used variable 'end'
Message-Id: <1541834500-56185-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>
Cc: YueHaibing <yuehaibing@huawei.com>, ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/ocfs2/file.c: In function 'ocfs2_prepare_inode_for_write':
fs/ocfs2/file.c:2143:9: warning:
 variable 'end' set but not used [-Wunused-but-set-variable]

It not used any more after commit
f1f973ffce96 ("ocfs2: code clean up for direct io")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/ocfs2/file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index d640c5f..1905ead 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -2140,7 +2140,6 @@ static int ocfs2_prepare_inode_for_write(struct file *file,
 	struct dentry *dentry = file->f_path.dentry;
 	struct inode *inode = d_inode(dentry);
 	struct buffer_head *di_bh = NULL;
-	loff_t end;
 
 	/*
 	 * We start with a read level meta lock and only jump to an ex
@@ -2204,8 +2203,6 @@ static int ocfs2_prepare_inode_for_write(struct file *file,
 			}
 		}
 
-		end = pos + count;
-
 		ret = ocfs2_check_range_for_refcount(inode, pos, count);
 		if (ret = 1) {
 			ocfs2_inode_unlock(inode, meta_level);
