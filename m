From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:59:24 +0000
Subject: [KJ] [PATCH] fs/ext3/super.c: fix sparse warnings
Message-Id: <200503100150.56739.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49172707987019182=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49172707987019182==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk2-sparse/fs/ext3/super.c
===================================================================
--- linux-2.6.11-bk2-sparse.orig/fs/ext3/super.c	2005-03-02 09:38:38.000000000 +0200
+++ linux-2.6.11-bk2-sparse/fs/ext3/super.c	2005-03-07 16:56:54.000000000 +0200
@@ -2106,6 +2106,7 @@ static int ext3_remount (struct super_bl
 			ext3_mark_recovery_complete(sb, es);
 		} else {
 			__le32 ret;
+			int ret1;
 			if ((ret = EXT3_HAS_RO_COMPAT_FEATURE(sb,
 					~EXT3_FEATURE_RO_COMPAT_SUPP))) {
 				printk(KERN_WARNING "EXT3-fs: %s: couldn't "
@@ -2122,8 +2123,8 @@ static int ext3_remount (struct super_bl
 			 */
 			ext3_clear_journal_err(sb, es);
 			sbi->s_mount_state = le16_to_cpu(es->s_state);
-			if ((ret = ext3_group_extend(sb, es, n_blocks_count)))
-				return ret;
+			if ((ret1 = ext3_group_extend(sb, es, n_blocks_count)))
+				return ret1;
 			if (!ext3_setup_super (sb, es, 0))
 				sb->s_flags &= ~MS_RDONLY;
 		}

--===============49172707987019182==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49172707987019182==--
