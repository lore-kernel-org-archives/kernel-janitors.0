From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 20:44:52 +0000
Subject: [PATCH 4/8] fs/9p: One function call less in v9fs_fid_xattr_get() after error detection
Message-Id: <54A06BC4.5030200@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54A01326.3050306@users.sourceforge.net>
In-Reply-To: <54A01326.3050306@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Dec 2014 09:05:25 +0100

The p9_client_clunk() function was called in one case by the
v9fs_fid_xattr_get() function during error handling even if the passed
variable "attr_fid" contained a null pointer.

Let us delete an unnecessary variable assignment there and return from
this implementation directly after a failure detection for
a p9_client_xattrwalk() call.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/9p/xattr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
index 8e72269..05ef790 100644
--- a/fs/9p/xattr.c
+++ b/fs/9p/xattr.c
@@ -34,8 +34,7 @@ ssize_t v9fs_fid_xattr_get(struct p9_fid *fid, const char *name,
 		retval = PTR_ERR(attr_fid);
 		p9_debug(P9_DEBUG_VFS, "p9_client_attrwalk failed %zd\n",
 			 retval);
-		attr_fid = NULL;
-		goto error;
+		return retval;
 	}
 	if (!buffer_size) {
 		/* request to get the attr_size */
-- 
2.2.1

