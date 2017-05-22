From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 May 2017 12:08:31 +0000
Subject: [PATCH] orangefs: off by ones in xattr size checks
Message-Id: <20170522120831.GA27513@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

A previous patch which claimed to remove off by ones actually introduced
them.

strlen() returns the length of the string not including the NUL
character.  We are using strcpy() to copy "name" into a buffer which is
ORANGEFS_MAX_XATTR_NAMELEN characters long.  We should make sure to
leave space for the NUL, otherwise we're writing one character beyond
the end of the buffer.

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
