From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Mar 2020 13:50:18 +0000
Subject: [PATCH] reiserfs: clean up several indentation issues
Message-Id: <20200325135018.113431-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, reiserfs-devel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several places where code is indented incorrectly. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/reiserfs/do_balan.c |  2 +-
 fs/reiserfs/ioctl.c    | 11 ++++++-----
 fs/reiserfs/namei.c    | 10 +++++-----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
index 4075e41408b4..5129efc6f2e6 100644
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -842,7 +842,7 @@ static void balance_leaf_paste_right_whole(struct tree_balance *tb,
 	struct item_head *pasted;
 	struct buffer_info bi;
 
-							buffer_info_init_right(tb, &bi);
+	buffer_info_init_right(tb, &bi);
 	leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
 
 	/* append item in R[0] */
diff --git a/fs/reiserfs/ioctl.c b/fs/reiserfs/ioctl.c
index 45e1a5d11af3..adb21bea3d60 100644
--- a/fs/reiserfs/ioctl.c
+++ b/fs/reiserfs/ioctl.c
@@ -184,11 +184,12 @@ int reiserfs_unpack(struct inode *inode, struct file *filp)
 	}
 
 	/* we need to make sure nobody is changing the file size beneath us */
-{
-	int depth = reiserfs_write_unlock_nested(inode->i_sb);
-	inode_lock(inode);
-	reiserfs_write_lock_nested(inode->i_sb, depth);
-}
+	{
+		int depth = reiserfs_write_unlock_nested(inode->i_sb);
+
+		inode_lock(inode);
+		reiserfs_write_lock_nested(inode->i_sb, depth);
+	}
 
 	reiserfs_write_lock(inode->i_sb);
 
diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 959a066b7bb0..ed433721134e 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -838,10 +838,10 @@ static int reiserfs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode
 	 */
 	INC_DIR_INODE_NLINK(dir)
 
-	    retval = reiserfs_new_inode(&th, dir, mode, NULL /*symlink */ ,
-					old_format_only(dir->i_sb) ?
-					EMPTY_DIR_SIZE_V1 : EMPTY_DIR_SIZE,
-					dentry, inode, &security);
+	retval = reiserfs_new_inode(&th, dir, mode, NULL /*symlink */,
+				    old_format_only(dir->i_sb) ?
+				    EMPTY_DIR_SIZE_V1 : EMPTY_DIR_SIZE,
+				    dentry, inode, &security);
 	if (retval) {
 		DEC_DIR_INODE_NLINK(dir)
 		goto out_failed;
@@ -967,7 +967,7 @@ static int reiserfs_rmdir(struct inode *dir, struct dentry *dentry)
 	reiserfs_update_sd(&th, inode);
 
 	DEC_DIR_INODE_NLINK(dir)
-	    dir->i_size -= (DEH_SIZE + de.de_entrylen);
+	dir->i_size -= (DEH_SIZE + de.de_entrylen);
 	reiserfs_update_sd(&th, dir);
 
 	/* prevent empty directory from getting lost */
-- 
2.25.1
