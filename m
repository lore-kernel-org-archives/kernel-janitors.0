From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:59:18 +0000
Subject: [KJ] [PATCH] fs/hpfs/inode.c: fix sparse warnings
Message-Id: <200503100151.12259.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65478873655990988=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65478873655990988==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk3-sparse/fs/hpfs/inode.c
===================================================================
--- linux-2.6.11-bk3-sparse.orig/fs/hpfs/inode.c	2005-03-08 03:15:15.000000000 +0200
+++ linux-2.6.11-bk3-sparse/fs/hpfs/inode.c	2005-03-08 03:16:11.000000000 +0200
@@ -61,14 +61,14 @@ void hpfs_read_inode(struct inode *i)
 	if (hpfs_sb(i->i_sb)->sb_eas) {
 		if ((ea = hpfs_get_ea(i->i_sb, fnode, "UID", &ea_size))) {
 			if (ea_size == 2) {
-				i->i_uid = le16_to_cpu(*(u16*)ea);
+				i->i_uid = le16_to_cpup((__le16*)ea);
 				hpfs_inode->i_ea_uid = 1;
 			}
 			kfree(ea);
 		}
 		if ((ea = hpfs_get_ea(i->i_sb, fnode, "GID", &ea_size))) {
 			if (ea_size == 2) {
-				i->i_gid = le16_to_cpu(*(u16*)ea);
+				i->i_gid = le16_to_cpup((__le16*)ea);
 				hpfs_inode->i_ea_gid = 1;
 			}
 			kfree(ea);
@@ -88,7 +88,7 @@ void hpfs_read_inode(struct inode *i)
 			int rdev = 0;
 			umode_t mode = hpfs_sb(sb)->sb_mode;
 			if (ea_size == 2) {
-				mode = le16_to_cpu(*(u16*)ea);
+				mode = le16_to_cpup((__le16*)ea);
 				hpfs_inode->i_ea_mode = 1;
 			}
 			kfree(ea);
@@ -96,7 +96,7 @@ void hpfs_read_inode(struct inode *i)
 			if (S_ISBLK(mode) || S_ISCHR(mode)) {
 				if ((ea = hpfs_get_ea(i->i_sb, fnode, "DEV", &ea_size))) {
 					if (ea_size == 4)
-						rdev = le32_to_cpu(*(u32*)ea);
+						rdev = le32_to_cpup((__le32*)ea);
 					kfree(ea);
 				}
 			}
@@ -149,7 +149,7 @@ void hpfs_write_inode_ea(struct inode *i
 		   we'd better not overwrite them
 		hpfs_error(i->i_sb, "fnode %08x has some unknown HPFS386 stuctures", i->i_ino);
 	} else*/ if (hpfs_sb(i->i_sb)->sb_eas >= 2) {
-		u32 ea;
+		__le32 ea;
 		if ((i->i_uid != hpfs_sb(i->i_sb)->sb_uid) || hpfs_inode->i_ea_uid) {
 			ea = cpu_to_le32(i->i_uid);
 			hpfs_set_ea(i, fnode, "UID", (char*)&ea, 2);

--===============65478873655990988==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65478873655990988==--
