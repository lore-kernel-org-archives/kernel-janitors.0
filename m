From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 20:43:28 +0000
Subject: [PATCH 3/8] fs/9p: One function call less in v9fs_vfs_atomic_open() after error detection
Message-Id: <54A06B70.20707@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net>
In-Reply-To: <54A01326.3050306@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 08:45:31 +0100

The p9_client_clunk() function was called in one case by the
v9fs_vfs_atomic_open() function during error handling even if the passed
variable "fid" contained a null pointer.

This implementation detail could be improved by the adjustment of a jump target.
Let us delete also an unnecessary variable assignment there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/9p/vfs_inode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 81b945a..f568427 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -873,8 +873,7 @@ v9fs_vfs_atomic_open(struct inode *dir, struct dentry *dentry,
 						v9fs_proto_dotu(v9ses)));
 	if (IS_ERR(fid)) {
 		err = PTR_ERR(fid);
-		fid = NULL;
-		goto error;
+		goto out;
 	}
 
 	v9fs_invalidate_inode_attr(dir);
-- 
2.2.1

