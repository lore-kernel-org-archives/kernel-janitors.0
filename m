From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Oct 2014 08:12:33 +0000
Subject: [patch 2/2] staging: lustre: validate size in ll_setxattr()
Message-Id: <20141022081233.GB31384@mwanda>
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
This was discovered through a code audit.  I'm not terribly familiar
with this code and I haven't tested it.  Please review it carefully.

diff --git a/drivers/staging/lustre/lustre/llite/xattr.c b/drivers/staging/lustre/lustre/llite/xattr.c
index 252a619..75abb97 100644
--- a/drivers/staging/lustre/lustre/llite/xattr.c
+++ b/drivers/staging/lustre/lustre/llite/xattr.c
@@ -223,6 +223,9 @@ int ll_setxattr(struct dentry *dentry, const char *name,
 	CDEBUG(D_VFSTRACE, "VFS Op:inode=%lu/%u(%p), xattr %s\n",
 	       inode->i_ino, inode->i_generation, inode, name);
 
+	if (size != 0 && size < sizeof(struct lov_user_md))
+		return -EINVAL;
+
 	ll_stats_ops_tally(ll_i2sbi(inode), LPROC_LL_SETXATTR, 1);
 
 	if ((strncmp(name, XATTR_TRUSTED_PREFIX,
