From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:02:02 +0000
Subject: [KJ] [PATCH] fs/qnx4/*: fix sparse warnings
Message-Id: <200503100151.24281.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============365970814717828=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============365970814717828==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/fs/qnx4/dir.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/fs/qnx4/dir.c	2005-03-02 09:38:12.000000000 +0200
+++ linux-2.6.11-bk3-sparse/fs/qnx4/dir.c	2005-03-08 12:45:34.000000000 +0200
@@ -61,7 +61,7 @@ static int qnx4_readdir(struct file *fil
 						ino = blknum * QNX4_INODES_PER_BLOCK + ix - 1;
 					else {
 						le  = (struct qnx4_link_info*)de;
-						ino = ( le->dl_inode_blk - 1 ) *
+						ino = ( le32_to_cpu(le->dl_inode_blk) - 1 ) *
 							QNX4_INODES_PER_BLOCK +
 							le->dl_inode_ndx;
 					}
Index: linux-2.6.11-bk3-sparse/fs/qnx4/inode.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/fs/qnx4/inode.c	2005-03-02 09:38:25.000000000 +0200
+++ linux-2.6.11-bk3-sparse/fs/qnx4/inode.c	2005-03-08 12:43:09.000000000 +0200
@@ -236,7 +236,7 @@ unsigned long qnx4_block_map( struct ino
 	struct buffer_head *bh = NULL;
 	struct qnx4_xblk *xblk = NULL;
 	struct qnx4_inode_entry *qnx4_inode = qnx4_raw_inode(inode);
-	qnx4_nxtnt_t nxtnt = le16_to_cpu(qnx4_inode->di_num_xtnts);
+	u16 nxtnt = le16_to_cpu(qnx4_inode->di_num_xtnts);
 
 	if ( iblock < le32_to_cpu(qnx4_inode->di_first_xtnt.xtnt_size) ) {
 		// iblock is in the first extent. This is easy.
@@ -372,7 +372,7 @@ static int qnx4_fill_super(struct super_
 		printk("qnx4: unable to read the superblock\n");
 		goto outnobh;
 	}
-	if ( le32_to_cpu( *(__u32*)bh->b_data ) != QNX4_SUPER_MAGIC ) {
+	if ( le32_to_cpup((__le32*) bh->b_data) != QNX4_SUPER_MAGIC ) {
 		if (!silent)
 			printk("qnx4: wrong fsid in superblock.\n");
 		goto out;
Index: linux-2.6.11-bk3-sparse/include/linux/qnx4_fs.h
===================================================================
--- linux-2.6.11-bk3-sparse.orig/include/linux/qnx4_fs.h	2005-03-02 09:38:33.000000000 +0200
+++ linux-2.6.11-bk3-sparse/include/linux/qnx4_fs.h	2005-03-08 12:47:51.000000000 +0200
@@ -46,11 +46,11 @@ struct qnx4_inode_entry {
 	char		di_fname[QNX4_SHORT_NAME_MAX];
 	qnx4_off_t	di_size;
 	qnx4_xtnt_t	di_first_xtnt;
-	__u32		di_xblk;
-	__s32		di_ftime;
-	__s32		di_mtime;
-	__s32		di_atime;
-	__s32		di_ctime;
+	__le32		di_xblk;
+	__le32		di_ftime;
+	__le32		di_mtime;
+	__le32		di_atime;
+	__le32		di_ctime;
 	qnx4_nxtnt_t	di_num_xtnts;
 	qnx4_mode_t	di_mode;
 	qnx4_muid_t	di_uid;
@@ -63,18 +63,18 @@ struct qnx4_inode_entry {
 
 struct qnx4_link_info {
 	char		dl_fname[QNX4_NAME_MAX];
-	__u32		dl_inode_blk;
+	__le32		dl_inode_blk;
 	__u8		dl_inode_ndx;
 	__u8		dl_spare[10];
 	__u8		dl_status;
 };
 
 struct qnx4_xblk {
-	__u32		xblk_next_xblk;
-	__u32		xblk_prev_xblk;
+	__le32		xblk_next_xblk;
+	__le32		xblk_prev_xblk;
 	__u8		xblk_num_xtnts;
 	__u8		xblk_spare[3];
-	__s32		xblk_num_blocks;
+	__le32		xblk_num_blocks;
 	qnx4_xtnt_t	xblk_xtnts[QNX4_MAX_XTNTS_PER_XBLK];
 	char		xblk_signature[8];
 	qnx4_xtnt_t	xblk_first_xtnt;
Index: linux-2.6.11-bk3-sparse/include/linux/qnxtypes.h
===================================================================
--- linux-2.6.11-bk3-sparse.orig/include/linux/qnxtypes.h	2005-03-02 09:37:55.000000000 +0200
+++ linux-2.6.11-bk3-sparse/include/linux/qnxtypes.h	2005-03-08 12:42:45.000000000 +0200
@@ -12,18 +12,18 @@
 #ifndef _QNX4TYPES_H
 #define _QNX4TYPES_H
 
-typedef __u16 qnx4_nxtnt_t;
+typedef __le16 qnx4_nxtnt_t;
 typedef __u8  qnx4_ftype_t;
 
 typedef struct {
-	__u32 xtnt_blk;
-	__u32 xtnt_size;
+	__le32 xtnt_blk;
+	__le32 xtnt_size;
 } qnx4_xtnt_t;
 
-typedef __u16 qnx4_mode_t;
-typedef __u16 qnx4_muid_t;
-typedef __u16 qnx4_mgid_t;
-typedef __u32 qnx4_off_t;
-typedef __u16 qnx4_nlink_t;
+typedef __le16 qnx4_mode_t;
+typedef __le16 qnx4_muid_t;
+typedef __le16 qnx4_mgid_t;
+typedef __le32 qnx4_off_t;
+typedef __le16 qnx4_nlink_t;
 
 #endif

--===============365970814717828==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============365970814717828==--
