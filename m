From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:59:30 +0000
Subject: [KJ] [PATCH] fs/ext3/resize.c: fix sparse warnings
Message-Id: <200503100151.04706.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70465444348380224=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70465444348380224==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk2-sparse/fs/ext3/resize.c
===================================================================
--- linux-2.6.11-bk2-sparse.orig/fs/ext3/resize.c	2005-03-02 09:38:34.000000000 +0200
+++ linux-2.6.11-bk2-sparse/fs/ext3/resize.c	2005-03-07 17:03:30.000000000 +0200
@@ -328,7 +328,7 @@ static int verify_reserved_gdb(struct su
 	unsigned five = 5;
 	unsigned seven = 7;
 	unsigned grp;
-	__u32 *p = (__u32 *)primary->b_data;
+	__le32 *p = (__le32 *)primary->b_data;
 	int gdbackups = 0;
 
 	while ((grp = ext3_list_backups(sb, &three, &five, &seven)) < end) {
@@ -371,7 +371,7 @@ static int add_new_gdb(handle_t *handle,
 	struct buffer_head *dind;
 	int gdbackups;
 	struct ext3_iloc iloc;
-	__u32 *data;
+	__le32 *data;
 	int err;
 
 	if (test_opt(sb, DEBUG))
@@ -408,7 +408,7 @@ static int add_new_gdb(handle_t *handle,
 		goto exit_bh;
 	}
 
-	data = (__u32 *)dind->b_data;
+	data = (__le32 *)dind->b_data;
 	if (le32_to_cpu(data[gdb_num % EXT3_ADDR_PER_BLOCK(sb)]) != gdblock) {
 		ext3_warning(sb, __FUNCTION__,
 			     "new group %u GDT block %lu not reserved\n",
@@ -510,7 +510,7 @@ static int reserve_backup_gdb(handle_t *
 	struct buffer_head *dind;
 	struct ext3_iloc iloc;
 	unsigned long blk;
-	__u32 *data, *end;
+	__le32 *data, *end;
 	int gdbackups = 0;
 	int res, i;
 	int err;
@@ -527,15 +527,15 @@ static int reserve_backup_gdb(handle_t *
 	}
 
 	blk = EXT3_SB(sb)->s_sbh->b_blocknr + 1 + EXT3_SB(sb)->s_gdb_count;
-	data = (__u32 *)dind->b_data + EXT3_SB(sb)->s_gdb_count;
-	end = (__u32 *)dind->b_data + EXT3_ADDR_PER_BLOCK(sb);
+	data = (__le32 *)dind->b_data + EXT3_SB(sb)->s_gdb_count;
+	end = (__le32 *)dind->b_data + EXT3_ADDR_PER_BLOCK(sb);
 
 	/* Get each reserved primary GDT block and verify it holds backups */
 	for (res = 0; res < reserved_gdb; res++, blk++) {
 		if (le32_to_cpu(*data) != blk) {
 			ext3_warning(sb, __FUNCTION__,
 				     "reserved block %lu not at offset %ld\n",
-				     blk, (long)(data - (__u32 *)dind->b_data));
+				     blk, (long)(data - (__le32 *)dind->b_data));
 			err = -EINVAL;
 			goto exit_bh;
 		}
@@ -550,7 +550,7 @@ static int reserve_backup_gdb(handle_t *
 			goto exit_bh;
 		}
 		if (++data >= end)
-			data = (__u32 *)dind->b_data;
+			data = (__le32 *)dind->b_data;
 	}
 
 	for (i = 0; i < reserved_gdb; i++) {
@@ -574,7 +574,7 @@ static int reserve_backup_gdb(handle_t *
 	blk = input->group * EXT3_BLOCKS_PER_GROUP(sb);
 	for (i = 0; i < reserved_gdb; i++) {
 		int err2;
-		data = (__u32 *)primary[i]->b_data;
+		data = (__le32 *)primary[i]->b_data;
 		/* printk("reserving backup %lu[%u] = %lu\n",
 		       primary[i]->b_blocknr, gdbackups,
 		       blk + primary[i]->b_blocknr); */
@@ -675,7 +675,7 @@ exit_err:
 			     "can't update backup for group %d (err %d), "
 			     "forcing fsck on next reboot\n", group, err);
 		sbi->s_mount_state &= ~EXT3_VALID_FS;
-		sbi->s_es->s_state &= ~cpu_to_le16(EXT3_VALID_FS);
+		sbi->s_es->s_state &= cpu_to_le16(~EXT3_VALID_FS);
 		mark_buffer_dirty(sbi->s_sbh);
 	}
 }
Index: linux-2.6.11-bk2-sparse/include/linux/ext3_fs.h
===================================================================
--- linux-2.6.11-bk2-sparse.orig/include/linux/ext3_fs.h	2005-03-02 09:38:10.000000000 +0200
+++ linux-2.6.11-bk2-sparse/include/linux/ext3_fs.h	2005-03-07 17:03:06.000000000 +0200
@@ -450,7 +450,7 @@ struct ext3_super_block {
 	 */
 	__u8	s_prealloc_blocks;	/* Nr of blocks to try to preallocate*/
 	__u8	s_prealloc_dir_blocks;	/* Nr to preallocate for dirs */
-	__u16	s_reserved_gdt_blocks;	/* Per group desc for online growth */
+	__le16	s_reserved_gdt_blocks;	/* Per group desc for online growth */
 	/*
 	 * Journaling support valid if EXT3_FEATURE_COMPAT_HAS_JOURNAL set.
 	 */

--===============70465444348380224==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70465444348380224==--
