From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Jun 2016 12:22:34 +0000
Subject: [patch] xfs: don't allow negative error tags
Message-Id: <20160624122234.GA23169@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

Errors go from zero which means no error to XFS_ERRTAG_MAX (22).  My
static checker complains that xfs_errortag_add() puts an upper bound on
this but not a lower bound.  Let's fix it by making it unsigned.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/xfs/xfs_error.h b/fs/xfs/xfs_error.h
index 4ed3042..2e4f67f 100644
--- a/fs/xfs/xfs_error.h
+++ b/fs/xfs/xfs_error.h
@@ -128,7 +128,7 @@ extern int xfs_error_test(int, int *, char *, int, char *, unsigned long);
 	 xfs_error_test((tag), (mp)->m_fixedfsid, "expr", __LINE__, __FILE__, \
 			(rf))))
 
-extern int xfs_errortag_add(int error_tag, struct xfs_mount *mp);
+extern int xfs_errortag_add(unsigned int error_tag, struct xfs_mount *mp);
 extern int xfs_errortag_clearall(struct xfs_mount *mp, int loud);
 #else
 #define XFS_TEST_ERROR(expr, mp, tag, rf)	(expr)
diff --git a/fs/xfs/xfs_error.c b/fs/xfs/xfs_error.c
index 355619a..ed7ee4e 100644
--- a/fs/xfs/xfs_error.c
+++ b/fs/xfs/xfs_error.c
@@ -55,7 +55,7 @@ xfs_error_test(int error_tag, int *fsidp, char *expression,
 }
 
 int
-xfs_errortag_add(int error_tag, xfs_mount_t *mp)
+xfs_errortag_add(unsigned int error_tag, xfs_mount_t *mp)
 {
 	int i;
 	int len;
