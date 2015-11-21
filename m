From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 21 Nov 2015 15:15:37 +0000
Subject: [PATCH] adfs: constify adfs_dir_ops structures
Message-Id: <1448118937-21015-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org

The adfs_dir_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/adfs/adfs.h      |    6 +++---
 fs/adfs/dir.c       |    6 +++---
 fs/adfs/dir_f.c     |    2 +-
 fs/adfs/dir_fplus.c |    2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/adfs/adfs.h b/fs/adfs/adfs.h
index 24575d9..ea4aba5 100644
--- a/fs/adfs/adfs.h
+++ b/fs/adfs/adfs.h
@@ -45,7 +45,7 @@ struct adfs_dir_ops;
 struct adfs_sb_info {
 	union { struct {
 		struct adfs_discmap *s_map;	/* bh list containing map	 */
-		struct adfs_dir_ops *s_dir;	/* directory operations		 */
+		const struct adfs_dir_ops *s_dir; /* directory operations	 */
 		};
 		struct rcu_head rcu;		/* used only at shutdown time	 */
 	};
@@ -168,8 +168,8 @@ void __adfs_error(struct super_block *sb, const char *function,
 extern const struct inode_operations adfs_dir_inode_operations;
 extern const struct file_operations adfs_dir_operations;
 extern const struct dentry_operations adfs_dentry_operations;
-extern struct adfs_dir_ops adfs_f_dir_ops;
-extern struct adfs_dir_ops adfs_fplus_dir_ops;
+extern const struct adfs_dir_ops adfs_f_dir_ops;
+extern const struct adfs_dir_ops adfs_fplus_dir_ops;
 
 extern int adfs_dir_update(struct super_block *sb, struct object_info *obj,
 			   int wait);
diff --git a/fs/adfs/dir.c b/fs/adfs/dir.c
index 51c279a..fd4cf2c 100644
--- a/fs/adfs/dir.c
+++ b/fs/adfs/dir.c
@@ -21,7 +21,7 @@ adfs_readdir(struct file *file, struct dir_context *ctx)
 {
 	struct inode *inode = file_inode(file);
 	struct super_block *sb = inode->i_sb;
-	struct adfs_dir_ops *ops = ADFS_SB(sb)->s_dir;
+	const struct adfs_dir_ops *ops = ADFS_SB(sb)->s_dir;
 	struct object_info obj;
 	struct adfs_dir dir;
 	int ret = 0;
@@ -69,7 +69,7 @@ adfs_dir_update(struct super_block *sb, struct object_info *obj, int wait)
 {
 	int ret = -EINVAL;
 #ifdef CONFIG_ADFS_FS_RW
-	struct adfs_dir_ops *ops = ADFS_SB(sb)->s_dir;
+	const struct adfs_dir_ops *ops = ADFS_SB(sb)->s_dir;
 	struct adfs_dir dir;
 
 	printk(KERN_INFO "adfs_dir_update: object %06X in dir %06X\n",
@@ -129,7 +129,7 @@ static int
 adfs_dir_lookup_byname(struct inode *inode, struct qstr *name, struct object_info *obj)
 {
 	struct super_block *sb = inode->i_sb;
-	struct adfs_dir_ops *ops = ADFS_SB(sb)->s_dir;
+	const struct adfs_dir_ops *ops = ADFS_SB(sb)->s_dir;
 	struct adfs_dir dir;
 	int ret;
 
diff --git a/fs/adfs/dir_f.c b/fs/adfs/dir_f.c
index 4bbe853..0fbfd0b 100644
--- a/fs/adfs/dir_f.c
+++ b/fs/adfs/dir_f.c
@@ -476,7 +476,7 @@ adfs_f_free(struct adfs_dir *dir)
 	dir->sb = NULL;
 }
 
-struct adfs_dir_ops adfs_f_dir_ops = {
+const struct adfs_dir_ops adfs_f_dir_ops = {
 	.read		= adfs_f_read,
 	.setpos		= adfs_f_setpos,
 	.getnext	= adfs_f_getnext,
diff --git a/fs/adfs/dir_fplus.c b/fs/adfs/dir_fplus.c
index 82d14cd..c92cfb6 100644
--- a/fs/adfs/dir_fplus.c
+++ b/fs/adfs/dir_fplus.c
@@ -256,7 +256,7 @@ adfs_fplus_free(struct adfs_dir *dir)
 	dir->sb = NULL;
 }
 
-struct adfs_dir_ops adfs_fplus_dir_ops = {
+const struct adfs_dir_ops adfs_fplus_dir_ops = {
 	.read		= adfs_fplus_read,
 	.setpos		= adfs_fplus_setpos,
 	.getnext	= adfs_fplus_getnext,

