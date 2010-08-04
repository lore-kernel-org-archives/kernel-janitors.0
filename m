From: Dan Carpenter <error27@gmail.com>
Date: Wed, 04 Aug 2010 16:29:03 +0000
Subject: [patch] 9p: remove unneeded checks
Message-Id: <20100804162903.GB9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

git_t is unsigned an can never be less than zero.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 6e94f32..b6304b1 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -881,10 +881,6 @@ static int v9fs_vfs_mkdir_dotl(struct inode *dir, struct dentry *dentry,
 	}
 
 	gid = v9fs_get_fsgid_for_create(dir);
-	if (gid < 0) {
-		P9_DPRINTK(P9_DEBUG_VFS, "v9fs_get_fsgid_for_create failed\n");
-		goto error;
-	}
 
 	name = (char *) dentry->d_name.name;
 	err = p9_client_mkdir_dotl(dfid, name, mode, gid, &qid);
@@ -1591,11 +1587,6 @@ v9fs_vfs_symlink_dotl(struct inode *dir, struct dentry *dentry,
 
 	gid = v9fs_get_fsgid_for_create(dir);
 
-	if (gid < 0) {
-		P9_DPRINTK(P9_DEBUG_VFS, "v9fs_get_egid failed %d\n", gid);
-		goto error;
-	}
-
 	/* Server doesn't alter fid on TSYMLINK. Hence no need to clone it. */
 	err = p9_client_symlink(dfid, name, (char *)symname, gid, &qid);
 
@@ -1859,10 +1850,6 @@ v9fs_vfs_mknod_dotl(struct inode *dir, struct dentry *dentry, int mode,
 	}
 
 	gid = v9fs_get_fsgid_for_create(dir);
-	if (gid < 0) {
-		P9_DPRINTK(P9_DEBUG_VFS, "v9fs_get_fsgid_for_create failed\n");
-		goto error;
-	}
 
 	name = (char *) dentry->d_name.name;
 
