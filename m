From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 04 Feb 2021 18:00:56 +0000
Subject: [PATCH 2/5] fs: update kernel-doc for vfs_rename()
Message-Id: <20210204180059.28360-3-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian.brauner@ubuntu.com>, linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 9fe61450972d ("namei: introduce struct renamedata") introduces a
new struct for vfs_rename() and makes the vfs_rename() kernel-doc argument
description out of sync.

Move the description of arguments for vfs_rename() to a new kernel-doc for
the struct renamedata to make these descriptions checkable against the
actual implementation.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 fs/namei.c         |  9 +--------
 include/linux/fs.h | 11 +++++++++++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index f131d3efec63..98ea56ebcaf0 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4406,14 +4406,7 @@ SYSCALL_DEFINE2(link, const char __user *, oldname, const char __user *, newname
 
 /**
  * vfs_rename - rename a filesystem object
- * @old_mnt_userns:	old user namespace of the mount the inode was found from
- * @old_dir:		parent of source
- * @old_dentry:		source
- * @new_mnt_userns:	new user namespace of the mount the inode was found from
- * @new_dir:		parent of destination
- * @new_dentry:		destination
- * @delegated_inode:	returns an inode needing a delegation break
- * @flags:		rename flags
+ * @rd: struct with all information required for renaming
  *
  * The caller must hold multiple mutexes--see lock_rename()).
  *
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 04b6b142dfcf..52b6d9e34b92 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1782,6 +1782,17 @@ int vfs_rmdir(struct user_namespace *, struct inode *, struct dentry *);
 int vfs_unlink(struct user_namespace *, struct inode *, struct dentry *,
 	       struct inode **);
 
+/**
+ * struct renamedata - contains all information required for renaming
+ * @old_mnt_userns:    old user namespace of the mount the inode was found from
+ * @old_dir:           parent of source
+ * @old_dentry:                source
+ * @new_mnt_userns:    new user namespace of the mount the inode was found from
+ * @new_dir:           parent of destination
+ * @new_dentry:                destination
+ * @delegated_inode:   returns an inode needing a delegation break
+ * @flags:             rename flags
+ */
 struct renamedata {
 	struct user_namespace *old_mnt_userns;
 	struct inode *old_dir;
-- 
2.17.1
