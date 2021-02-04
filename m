From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 04 Feb 2021 18:00:59 +0000
Subject: [PATCH 5/5] fs: update kernel-doc for new mnt_userns argument
Message-Id: <20210204180059.28360-6-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian.brauner@ubuntu.com>, linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 549c7297717c ("fs: make helpers idmap mount aware") and commit
c7c7a1a18af4 ("xattr: handle idmapped mounts") refactor the inode methods
with mount-user-namespace arguments, but did not adjust the kernel-doc of
some functions.

Hence, make htmldocs warns:

  ./fs/libfs.c:498: warning: Function parameter or member 'mnt_userns' not described in 'simple_setattr'
  ./fs/xattr.c:257: warning: Function parameter or member 'mnt_userns' not described in '__vfs_setxattr_locked'
  ./fs/xattr.c:485: warning: Function parameter or member 'mnt_userns' not described in '__vfs_removexattr_locked'

Copy the existing kernel-doc description for that new argument from
__vfs_setxattr_noperm() to the other functions as well.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 fs/libfs.c | 1 +
 fs/xattr.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index e2de5401abca..61c684014392 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -481,6 +481,7 @@ EXPORT_SYMBOL(simple_rename);
 
 /**
  * simple_setattr - setattr for simple filesystem
+ * @mnt_userns: user namespace of the mount the inode was found from
  * @dentry: dentry
  * @iattr: iattr structure
  *
diff --git a/fs/xattr.c b/fs/xattr.c
index b3444e06cded..57f47f0caf22 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -242,6 +242,7 @@ int __vfs_setxattr_noperm(struct user_namespace *mnt_userns,
  * __vfs_setxattr_locked - set an extended attribute while holding the inode
  * lock
  *
+ *  @mnt_userns: user namespace of the mount the inode was found from
  *  @dentry: object to perform setxattr on
  *  @name: xattr name to set
  *  @value: value to set @name to
@@ -473,6 +474,7 @@ EXPORT_SYMBOL(__vfs_removexattr);
  * __vfs_removexattr_locked - set an extended attribute while holding the inode
  * lock
  *
+ *  @mnt_userns: user namespace of the mount the inode was found from
  *  @dentry: object to perform setxattr on
  *  @name: name of xattr to remove
  *  @delegated_inode: on return, will contain an inode pointer that
-- 
2.17.1
