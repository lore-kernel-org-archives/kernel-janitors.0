From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 20:41:50 +0000
Subject: [PATCH 2/8] fs/9p: One function call less in v9fs_create() after error detection
Message-Id: <54A06B0E.4080709@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net>
In-Reply-To: <54A01326.3050306@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 08:28:51 +0100

The p9_client_clunk() function was called in two cases by the v9fs_create()
function during error handling even if the passed variable "fid"
contained a null pointer. This implementation detail could be improved
by the introduction of another jump label.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/9p/vfs_inode.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index a787d4c..81b945a 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -672,7 +672,7 @@ v9fs_create(struct v9fs_session_info *v9ses, struct inode *dir,
 	err = p9_client_fcreate(ofid, name, perm, mode, extension);
 	if (err < 0) {
 		p9_debug(P9_DEBUG_VFS, "p9_client_fcreate failed %d\n", err);
-		goto error;
+		goto ofid_clunk;
 	}
 
 	if (!(perm & P9_DMLINK)) {
@@ -682,8 +682,7 @@ v9fs_create(struct v9fs_session_info *v9ses, struct inode *dir,
 			err = PTR_ERR(fid);
 			p9_debug(P9_DEBUG_VFS,
 				   "p9_client_walk failed %d\n", err);
-			fid = NULL;
-			goto error;
+			goto ofid_clunk;
 		}
 		/*
 		 * instantiate inode and assign the unopened fid to the dentry
@@ -693,16 +692,17 @@ v9fs_create(struct v9fs_session_info *v9ses, struct inode *dir,
 			err = PTR_ERR(inode);
 			p9_debug(P9_DEBUG_VFS,
 				   "inode creation failed %d\n", err);
-			goto error;
+			goto fid_clunk;
 		}
 		v9fs_fid_add(dentry, fid);
 		d_instantiate(dentry, inode);
 	}
 	return ofid;
-error:
-	p9_client_clunk(ofid);
 
+fid_clunk:
 	p9_client_clunk(fid);
+ofid_clunk:
+	p9_client_clunk(ofid);
 
 	return ERR_PTR(err);
 }
-- 
2.2.1

