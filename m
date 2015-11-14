From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Nov 2015 12:30:23 +0000
Subject: [PATCH] Orangefs: constify inode_operations structures
Message-Id: <1447504223-25135-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

The inode_operations structures are never modified, so declare them
as const, like all the other inode_operations structures.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/orangefs/inode.c        |    2 +-
 fs/orangefs/namei.c        |    2 +-
 fs/orangefs/pvfs2-kernel.h |    6 +++---
 fs/orangefs/symlink.c      |    2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 4f7c45a..97e64b9 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -295,7 +295,7 @@ int pvfs2_getattr(struct vfsmount *mnt,
 }
 
 /* PVFS2 implementation of VFS inode operations for files */
-struct inode_operations pvfs2_file_inode_operations = {
+const struct inode_operations pvfs2_file_inode_operations = {
 	.get_acl = pvfs2_get_acl,
 	.set_acl = pvfs2_set_acl,
 	.setattr = pvfs2_setattr,
diff --git a/fs/orangefs/namei.c b/fs/orangefs/namei.c
index 05f6fea..6fcb517 100644
--- a/fs/orangefs/namei.c
+++ b/fs/orangefs/namei.c
@@ -448,7 +448,7 @@ static int pvfs2_rename(struct inode *old_dir,
 }
 
 /* PVFS2 implementation of VFS inode operations for directories */
-struct inode_operations pvfs2_dir_inode_operations = {
+const struct inode_operations pvfs2_dir_inode_operations = {
 	.lookup = pvfs2_lookup,
 	.get_acl = pvfs2_get_acl,
 	.set_acl = pvfs2_set_acl,
diff --git a/fs/orangefs/pvfs2-kernel.h b/fs/orangefs/pvfs2-kernel.h
index 29b4a48..68cbd28 100644
--- a/fs/orangefs/pvfs2-kernel.h
+++ b/fs/orangefs/pvfs2-kernel.h
@@ -674,10 +674,10 @@ extern int hash_table_size;
 
 extern const struct address_space_operations pvfs2_address_operations;
 extern struct backing_dev_info pvfs2_backing_dev_info;
-extern struct inode_operations pvfs2_file_inode_operations;
+extern const struct inode_operations pvfs2_file_inode_operations;
 extern const struct file_operations pvfs2_file_operations;
-extern struct inode_operations pvfs2_symlink_inode_operations;
-extern struct inode_operations pvfs2_dir_inode_operations;
+extern const struct inode_operations pvfs2_symlink_inode_operations;
+extern const struct inode_operations pvfs2_dir_inode_operations;
 extern const struct file_operations pvfs2_dir_operations;
 extern const struct dentry_operations pvfs2_dentry_operations;
 extern const struct file_operations pvfs2_devreq_file_operations;
diff --git a/fs/orangefs/symlink.c b/fs/orangefs/symlink.c
index 2adfcef..38dd73c 100644
--- a/fs/orangefs/symlink.c
+++ b/fs/orangefs/symlink.c
@@ -21,7 +21,7 @@ static const char *pvfs2_follow_link(struct dentry *dentry, void **cookie)
 	return target;
 }
 
-struct inode_operations pvfs2_symlink_inode_operations = {
+const struct inode_operations pvfs2_symlink_inode_operations = {
 	.readlink = generic_readlink,
 	.follow_link = pvfs2_follow_link,
 	.setattr = pvfs2_setattr,

