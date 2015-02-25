From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 13:20:36 +0000
Subject: [patch] Staging: lustre: missing curly braces in ll_setattr_raw()
Message-Id: <20150225132036.GG19745@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From the indenting, it looks like curly braces were intended here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is not tested, and it changes how the code works.  Please review
it a bit carefully.  Sometimes people just do weird indenting for no
reason.

diff --git a/drivers/staging/lustre/lustre/llite/llite_lib.c b/drivers/staging/lustre/lustre/llite/llite_lib.c
index 0c1b583..ba97d9e 100644
--- a/drivers/staging/lustre/lustre/llite/llite_lib.c
+++ b/drivers/staging/lustre/lustre/llite/llite_lib.c
@@ -1432,7 +1432,7 @@ int ll_setattr_raw(struct dentry *dentry, struct iattr *attr, bool hsm_import)
 
 	if (attr->ia_valid & (ATTR_SIZE |
 			      ATTR_ATIME | ATTR_ATIME_SET |
-			      ATTR_MTIME | ATTR_MTIME_SET))
+			      ATTR_MTIME | ATTR_MTIME_SET)) {
 		/* For truncate and utimes sending attributes to OSTs, setting
 		 * mtime/atime to the past will be performed under PW [0:EOF]
 		 * extent lock (new_size:EOF for truncate).  It may seem
@@ -1444,6 +1444,7 @@ int ll_setattr_raw(struct dentry *dentry, struct iattr *attr, bool hsm_import)
 		rc = ll_setattr_ost(inode, attr);
 		if (attr->ia_valid & ATTR_SIZE)
 			up_write(&lli->lli_trunc_sem);
+	}
 out:
 	if (op_data) {
 		if (op_data->op_ioepoch) {
