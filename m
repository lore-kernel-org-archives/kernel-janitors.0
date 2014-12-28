From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 20:46:06 +0000
Subject: [PATCH 5/8] fs/9p: One function call less in v9fs_vfs_atomic_open_dotl() after error detection
Message-Id: <54A06C0E.4030105@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net>
In-Reply-To: <54A01326.3050306@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 09:29:40 +0100

The p9_client_clunk() function was called in three cases by the
v9fs_vfs_atomic_open_dotl() function during error handling even if the passed
variable "fid" contained a null pointer.

This implementation detail could be improved by the adjustment of jump targets.
Let us delete also an unnecessary variable assignment there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/9p/vfs_inode_dotl.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index 3611b0f..ce1f5bb 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -297,14 +297,14 @@ v9fs_vfs_atomic_open_dotl(struct inode *dir, struct dentry *dentry,
 	if (err) {
 		p9_debug(P9_DEBUG_VFS, "Failed to get acl values in creat %d\n",
 			 err);
-		goto error;
+		goto err_clunk_old_fid;
 	}
 	err = p9_client_create_dotl(ofid, name, v9fs_open_to_dotl_flags(flags),
 				    mode, gid, &qid);
 	if (err < 0) {
 		p9_debug(P9_DEBUG_VFS, "p9_client_open_dotl failed in creat %d\n",
 			 err);
-		goto error;
+		goto err_clunk_old_fid;
 	}
 	v9fs_invalidate_inode_attr(dir);
 
@@ -313,8 +313,7 @@ v9fs_vfs_atomic_open_dotl(struct inode *dir, struct dentry *dentry,
 	if (IS_ERR(fid)) {
 		err = PTR_ERR(fid);
 		p9_debug(P9_DEBUG_VFS, "p9_client_walk failed %d\n", err);
-		fid = NULL;
-		goto error;
+		goto err_clunk_old_fid;
 	}
 	inode = v9fs_get_new_inode_from_fid(v9ses, fid, dir->i_sb);
 	if (IS_ERR(inode)) {
-- 
2.2.1

