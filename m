From: Jerome Pinot <ngc891@gmail.com>
Date: Sat, 01 Oct 2005 15:42:04 +0000
Subject: [KJ] [PATCH][2.6.14-rc3] ext3: fix build warning if !quota
Message-Id: <88ee31b70510010842545d15ff@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84827293014289684=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84827293014289684==
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,
Posted this on lkml and to Andrew Morton for -rc2 but doesn't get it fixed :-(
Hope a better welcome here for a so trivial fix:
sbi is not used if quota is not defined. This leads to a uselessvariable after preprocessing and a build warning.
Thanks to apply.
Signed-off-by: Jerome Pinot <ngc891@gmail.com>
 ------8<------diff -Naur a/fs/ext3/super.c b/fs/ext3/super.c--- a/fs/ext3/super.c	2005-09-29 00:28:16.000000000 +0000+++ b/fs/ext3/super.c	2005-09-29 02:18:22.000000000 +0000@@ -513,7 +513,9 @@ static int ext3_show_options(struct seq_file *seq, struct vfsmount *vfs) { 	struct super_block *sb = vfs->mnt_sb;+#if defined(CONFIG_QUOTA) 	struct ext3_sb_info *sbi = EXT3_SB(sb);+#endif
 	if (test_opt(sb, DATA_FLAGS) == EXT3_MOUNT_JOURNAL_DATA) 		seq_puts(seq, ",data=journal"); ------8<------
Regards,
--Jerome Pinothttp://ngc891.blogdns.net/

--===============84827293014289684==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84827293014289684==--
