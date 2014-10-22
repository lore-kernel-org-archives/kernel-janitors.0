From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Oct 2014 14:23:07 +0000
Subject: [patch 2/2 v2] staging: lustre: validate size in ll_setxattr()
Message-Id: <20141022142306.GA2279@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If size is smaller than the lov_user_md struct then we are reading
beyond the end of the buffer.  I guess this is an information leak or it
could cause an Oops if the memory is not mapped.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  Andrew Perepechko pointed out that the check needs to be inside the
if statement.

diff --git a/drivers/staging/lustre/lustre/llite/xattr.c b/drivers/staging/lustre/lustre/llite/xattr.c
index 252a619..3ad9796 100644
--- a/drivers/staging/lustre/lustre/llite/xattr.c
+++ b/drivers/staging/lustre/lustre/llite/xattr.c
@@ -234,6 +234,9 @@ int ll_setxattr(struct dentry *dentry, const char *name,
 		struct lov_user_md *lump = (struct lov_user_md *)value;
 		int rc = 0;
 
+		if (size != 0 && size < sizeof(struct lov_user_md))
+			return -EINVAL;
+
 		/* Attributes that are saved via getxattr will always have
 		 * the stripe_offset as 0.  Instead, the MDS should be
 		 * allowed to pick the starting OST index.   b846 */
