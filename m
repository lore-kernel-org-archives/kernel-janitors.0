From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Sun, 20 Jul 2008 22:07:19 +0000
Subject: [PATCH] ext2/3,jbd: replace __FUNCTION__ with __func__
Message-Id: <20080720220719.GB31640@orion>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ext4@vger.kernel.org, sct@redhat.com, akpm@linux-foundation.org, adilger@sun.com, kernel-janitors@vger.kernel.org

From: Alexander Beregalov <a.beregalov@gmail.com>

ext2/3,jbd: replace __FUNCTION__ with __func__


Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

---

 include/linux/ext2_fs.h  |    2 +-
 include/linux/ext3_fs.h  |    4 ++--
 include/linux/ext3_jbd.h |   14 +++++++-------
 include/linux/jbd.h      |    4 ++--
 include/linux/jbd2.h     |    4 ++--
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/linux/ext2_fs.h b/include/linux/ext2_fs.h
index 84cec2a..e81e148 100644
--- a/include/linux/ext2_fs.h
+++ b/include/linux/ext2_fs.h
@@ -47,7 +47,7 @@
 #ifdef EXT2FS_DEBUG
 #	define ext2_debug(f, a...)	{ \
 					printk ("EXT2-fs DEBUG (%s, %d): %s:", \
-						__FILE__, __LINE__, __FUNCTION__); \
+						__FILE__, __LINE__, __func__); \
 				  	printk (f, ## a); \
 					}
 #else
diff --git a/include/linux/ext3_fs.h b/include/linux/ext3_fs.h
index 36c5403..c0a20b2 100644
--- a/include/linux/ext3_fs.h
+++ b/include/linux/ext3_fs.h
@@ -43,7 +43,7 @@
 #define ext3_debug(f, a...)						\
 	do {								\
 		printk (KERN_DEBUG "EXT3-fs DEBUG (%s, %d): %s:",	\
-			__FILE__, __LINE__, __FUNCTION__);		\
+			__FILE__, __LINE__, __func__);			\
 		printk (KERN_DEBUG f, ## a);				\
 	} while (0)
 #else
@@ -868,7 +868,7 @@ extern void ext3_update_dynamic_rev (struct super_block *sb);
 #define ext3_std_error(sb, errno)				\
 do {								\
 	if ((errno))						\
-		__ext3_std_error((sb), __FUNCTION__, (errno));	\
+		__ext3_std_error((sb), __func__, (errno));	\
 } while (0)
 
 /*
diff --git a/include/linux/ext3_jbd.h b/include/linux/ext3_jbd.h
index 8c43b13..cf82d51 100644
--- a/include/linux/ext3_jbd.h
+++ b/include/linux/ext3_jbd.h
@@ -137,17 +137,17 @@ int __ext3_journal_dirty_metadata(const char *where,
 				handle_t *handle, struct buffer_head *bh);
 
 #define ext3_journal_get_undo_access(handle, bh) \
-	__ext3_journal_get_undo_access(__FUNCTION__, (handle), (bh))
+	__ext3_journal_get_undo_access(__func__, (handle), (bh))
 #define ext3_journal_get_write_access(handle, bh) \
-	__ext3_journal_get_write_access(__FUNCTION__, (handle), (bh))
+	__ext3_journal_get_write_access(__func__, (handle), (bh))
 #define ext3_journal_revoke(handle, blocknr, bh) \
-	__ext3_journal_revoke(__FUNCTION__, (handle), (blocknr), (bh))
+	__ext3_journal_revoke(__func__, (handle), (blocknr), (bh))
 #define ext3_journal_get_create_access(handle, bh) \
-	__ext3_journal_get_create_access(__FUNCTION__, (handle), (bh))
+	__ext3_journal_get_create_access(__func__, (handle), (bh))
 #define ext3_journal_dirty_metadata(handle, bh) \
-	__ext3_journal_dirty_metadata(__FUNCTION__, (handle), (bh))
+	__ext3_journal_dirty_metadata(__func__, (handle), (bh))
 #define ext3_journal_forget(handle, bh) \
-	__ext3_journal_forget(__FUNCTION__, (handle), (bh))
+	__ext3_journal_forget(__func__, (handle), (bh))
 
 int ext3_journal_dirty_data(handle_t *handle, struct buffer_head *bh);
 
@@ -160,7 +160,7 @@ static inline handle_t *ext3_journal_start(struct inode *inode, int nblocks)
 }
 
 #define ext3_journal_stop(handle) \
-	__ext3_journal_stop(__FUNCTION__, (handle))
+	__ext3_journal_stop(__func__, (handle))
 
 static inline handle_t *ext3_journal_current_handle(void)
 {
diff --git a/include/linux/jbd.h b/include/linux/jbd.h
index 07a9b52..83bd836 100644
--- a/include/linux/jbd.h
+++ b/include/linux/jbd.h
@@ -61,7 +61,7 @@ extern u8 journal_enable_debug;
 	do {								\
 		if ((n) <= journal_enable_debug) {			\
 			printk (KERN_DEBUG "(%s, %d): %s: ",		\
-				__FILE__, __LINE__, __FUNCTION__);	\
+				__FILE__, __LINE__, __func__);		\
 			printk (f, ## a);				\
 		}							\
 	} while (0)
@@ -984,7 +984,7 @@ extern int	cleanup_journal_tail(journal_t *);
 
 #define jbd_ENOSYS() \
 do {								           \
-	printk (KERN_ERR "JBD unimplemented function %s\n", __FUNCTION__); \
+	printk (KERN_ERR "JBD unimplemented function %s\n", __func__);     \
 	current->state = TASK_UNINTERRUPTIBLE;			           \
 	schedule();						           \
 } while (1)
diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h
index 3dd2090..a7ecc2c 100644
--- a/include/linux/jbd2.h
+++ b/include/linux/jbd2.h
@@ -61,7 +61,7 @@ extern u8 jbd2_journal_enable_debug;
 	do {								\
 		if ((n) <= jbd2_journal_enable_debug) {			\
 			printk (KERN_DEBUG "(%s, %d): %s: ",		\
-				__FILE__, __LINE__, __FUNCTION__);	\
+				__FILE__, __LINE__, __func__);		\
 			printk (f, ## a);				\
 		}							\
 	} while (0)
@@ -1139,7 +1139,7 @@ extern int	jbd2_cleanup_journal_tail(journal_t *);
 
 #define jbd_ENOSYS() \
 do {								           \
-	printk (KERN_ERR "JBD unimplemented function %s\n", __FUNCTION__); \
+	printk (KERN_ERR "JBD unimplemented function %s\n", __func__);     \
 	current->state = TASK_UNINTERRUPTIBLE;			           \
 	schedule();						           \
 } while (1)
