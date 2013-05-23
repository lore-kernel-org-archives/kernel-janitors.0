From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 May 2013 10:02:13 +0000
Subject: [patch] f2fs: dereferencing an ERR_PTR
Message-Id: <20130523100213.GA19107@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

There is an error path where "dir" is an ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 5148d90..921aede 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -71,7 +71,8 @@ static int recover_dentry(struct page *ipage, struct inode *inode)
 out:
 	f2fs_msg(inode->i_sb, KERN_NOTICE, "recover_inode and its dentry: "
 			"ino = %x, name = %s, dir = %lx, err = %d",
-			ino_of_node(ipage), raw_inode->i_name, dir->i_ino, err);
+			ino_of_node(ipage), raw_inode->i_name,
+			IS_ERR(dir) ? 0 : dir->i_ino, err);
 	return err;
 }
 
