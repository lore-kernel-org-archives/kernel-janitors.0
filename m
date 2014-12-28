From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 20:47:17 +0000
Subject: [PATCH 6/8] fs/9p: Less function calls in v9fs_vfs_mkdir_dotl() after error detection
Message-Id: <54A06C55.7060409@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net>
In-Reply-To: <54A01326.3050306@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 12:44:22 +0100

The p9_client_clunk() function was called in some cases by the
v9fs_vfs_mkdir_dotl() function during error handling even if the passed
variable "fid" contained a null pointer.

* Corresponding details could be improved by the introduction of another
  jump label.

* Let us delete also two unnecessary variable assignments there.

* Return from this implementation directly after failure detection for
  the function calls "v9fs_fid_lookup" and "v9fs_acl_mode".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/9p/vfs_inode_dotl.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index ce1f5bb..672d84f 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -403,8 +403,7 @@ static int v9fs_vfs_mkdir_dotl(struct inode *dir,
 	if (IS_ERR(dfid)) {
 		err = PTR_ERR(dfid);
 		p9_debug(P9_DEBUG_VFS, "fid lookup failed %d\n", err);
-		dfid = NULL;
-		goto error;
+		return err;
 	}
 
 	gid = v9fs_get_fsgid_for_create(dir);
@@ -414,20 +413,19 @@ static int v9fs_vfs_mkdir_dotl(struct inode *dir,
 	if (err) {
 		p9_debug(P9_DEBUG_VFS, "Failed to get acl values in mkdir %d\n",
 			 err);
-		goto error;
+		return err;
 	}
 	name = (char *) dentry->d_name.name;
 	err = p9_client_mkdir_dotl(dfid, name, mode, gid, &qid);
 	if (err < 0)
-		goto error;
+		goto put_acl;
 
 	fid = p9_client_walk(dfid, 1, &name, 1);
 	if (IS_ERR(fid)) {
 		err = PTR_ERR(fid);
 		p9_debug(P9_DEBUG_VFS, "p9_client_walk failed %d\n",
 			 err);
-		fid = NULL;
-		goto error;
+		goto put_acl;
 	}
 
 	/* instantiate inode and assign the unopened fid to the dentry */
@@ -462,6 +460,7 @@ static int v9fs_vfs_mkdir_dotl(struct inode *dir,
 	v9fs_invalidate_inode_attr(dir);
 error:
 	p9_client_clunk(fid);
+put_acl:
 	v9fs_put_acl(dacl, pacl);
 	return err;
 }
-- 
2.2.1

