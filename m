From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Jul 2017 20:56:18 +0000
Subject: [PATCH] orangefs: Off by one bugs handling xattrs
Message-Id: <20170711205618.hvrcodygnq5akodx@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The previous patch changed some of these from >= to >, but actually
these do need to be >= so let's change it back.  The issue is that
strlen() doesn't count the NUL terminator so when we copy name with
strcpy() we end up putting the NUL one space beyond the end of the
buffer.

Fixes: e675c5ec51fe ("orangefs: clean up oversize xattr validation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/orangefs/xattr.c b/fs/orangefs/xattr.c
index 237c9c04dc3b..a34b25be39c5 100644
--- a/fs/orangefs/xattr.c
+++ b/fs/orangefs/xattr.c
@@ -76,7 +76,7 @@ ssize_t orangefs_inode_getxattr(struct inode *inode, const char *name,
 	if (S_ISLNK(inode->i_mode))
 		return -EOPNOTSUPP;
 
-	if (strlen(name) > ORANGEFS_MAX_XATTR_NAMELEN)
+	if (strlen(name) >= ORANGEFS_MAX_XATTR_NAMELEN)
 		return -EINVAL;
 
 	fsuid = from_kuid(&init_user_ns, current_fsuid());
@@ -169,7 +169,7 @@ static int orangefs_inode_removexattr(struct inode *inode, const char *name,
 	struct orangefs_kernel_op_s *new_op = NULL;
 	int ret = -ENOMEM;
 
-	if (strlen(name) > ORANGEFS_MAX_XATTR_NAMELEN)
+	if (strlen(name) >= ORANGEFS_MAX_XATTR_NAMELEN)
 		return -EINVAL;
 
 	down_write(&orangefs_inode->xattr_sem);
@@ -233,7 +233,7 @@ int orangefs_inode_setxattr(struct inode *inode, const char *name,
 
 	if (size > ORANGEFS_MAX_XATTR_VALUELEN)
 		return -EINVAL;
-	if (strlen(name) > ORANGEFS_MAX_XATTR_NAMELEN)
+	if (strlen(name) >= ORANGEFS_MAX_XATTR_NAMELEN)
 		return -EINVAL;
 
 	internal_flag = convert_to_internal_xattr_flags(flags);
