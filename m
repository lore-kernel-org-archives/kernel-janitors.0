From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 20:40:25 +0000
Subject: [PATCH 1/8] fs/9p: Deletion of unnecessary checks before the function call "p9_client_clunk"
Message-Id: <54A06AB9.4020505@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net>
In-Reply-To: <54A01326.3050306@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Dec 2014 09:34:39 +0100

The p9_client_clunk() function tests whether its argument is NULL
and then returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/9p/vfs_dir.c        |  3 +--
 fs/9p/vfs_inode.c      | 12 ++++--------
 fs/9p/vfs_inode_dotl.c | 15 +++++----------
 fs/9p/xattr.c          |  3 +--
 4 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/fs/9p/vfs_dir.c b/fs/9p/vfs_dir.c
index 4f11510..9c13866 100644
--- a/fs/9p/vfs_dir.c
+++ b/fs/9p/vfs_dir.c
@@ -229,8 +229,7 @@ int v9fs_dir_release(struct inode *inode, struct file *filp)
 	fid = filp->private_data;
 	p9_debug(P9_DEBUG_VFS, "inode: %p filp: %p fid: %d\n",
 		 inode, filp, fid ? fid->fid : -1);
-	if (fid)
-		p9_client_clunk(fid);
+	p9_client_clunk(fid);
 	return 0;
 }
 
diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 9ee5343..a787d4c 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -700,11 +700,9 @@ v9fs_create(struct v9fs_session_info *v9ses, struct inode *dir,
 	}
 	return ofid;
 error:
-	if (ofid)
-		p9_client_clunk(ofid);
+	p9_client_clunk(ofid);
 
-	if (fid)
-		p9_client_clunk(fid);
+	p9_client_clunk(fid);
 
 	return ERR_PTR(err);
 }
@@ -768,8 +766,7 @@ static int v9fs_vfs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode
 		v9fs_invalidate_inode_attr(dir);
 	}
 
-	if (fid)
-		p9_client_clunk(fid);
+	p9_client_clunk(fid);
 
 	return err;
 }
@@ -916,8 +913,7 @@ out:
 	return err;
 
 error:
-	if (fid)
-		p9_client_clunk(fid);
+	p9_client_clunk(fid);
 	goto out;
 }
 
diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index 6054c16b..3611b0f 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -363,11 +363,9 @@ out:
 	return err;
 
 error:
-	if (fid)
-		p9_client_clunk(fid);
+	p9_client_clunk(fid);
 err_clunk_old_fid:
-	if (ofid)
-		p9_client_clunk(ofid);
+	p9_client_clunk(ofid);
 	goto out;
 }
 
@@ -464,8 +462,7 @@ static int v9fs_vfs_mkdir_dotl(struct inode *dir,
 	inc_nlink(dir);
 	v9fs_invalidate_inode_attr(dir);
 error:
-	if (fid)
-		p9_client_clunk(fid);
+	p9_client_clunk(fid);
 	v9fs_put_acl(dacl, pacl);
 	return err;
 }
@@ -744,8 +741,7 @@ v9fs_vfs_symlink_dotl(struct inode *dir, struct dentry *dentry,
 	}
 
 error:
-	if (fid)
-		p9_client_clunk(fid);
+	p9_client_clunk(fid);
 
 	return err;
 }
@@ -896,8 +892,7 @@ v9fs_vfs_mknod_dotl(struct inode *dir, struct dentry *dentry, umode_t omode,
 		d_instantiate(dentry, inode);
 	}
 error:
-	if (fid)
-		p9_client_clunk(fid);
+	p9_client_clunk(fid);
 	v9fs_put_acl(dacl, pacl);
 	return err;
 }
diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
index f95e01e..8e72269 100644
--- a/fs/9p/xattr.c
+++ b/fs/9p/xattr.c
@@ -65,8 +65,7 @@ ssize_t v9fs_fid_xattr_get(struct p9_fid *fid, const char *name,
 	/* Total read xattr bytes */
 	retval = offset;
 error:
-	if (attr_fid)
-		p9_client_clunk(attr_fid);
+	p9_client_clunk(attr_fid);
 	return retval;
 
 }
-- 
2.2.1

