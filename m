From: Julien Brunel <brunel@diku.dk>
Date: Fri, 12 Sep 2008 14:23:22 +0000
Subject: [PATCH] fs/9p: Use an IS_ERR test rather than a NULL test
Message-Id: <200809121623.22644.brunel@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ericvh@gmail.com, rminnich@sandia.gov, lucho@ionkov.net, v9fs-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julien Brunel <brunel@diku.dk>

In case of error, the function p9_client_walk returns an ERR pointer,
but never returns a NULL pointer. So a NULL test that comes after an
IS_ERR test should be deleted.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@match_bad_null_test@
expression x, E;
statement S1,S2;
@@
x = p9_client_walk(...)
... when != x = E
*  if (x != NULL) 
S1 else S2
// </smpl>

Signed-off-by:  Julien Brunel <brunel@diku.dk>
Signed-off-by:  Julia Lawall <julia@diku.dk>

---
 fs/9p/vfs_inode.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -626,8 +626,7 @@ static struct dentry *v9fs_vfs_lookup(st
 	return NULL;
 
 error:
-	if (fid)
-		p9_client_clunk(fid);
+	p9_client_clunk(fid);
 
 	return ERR_PTR(result);
 }
