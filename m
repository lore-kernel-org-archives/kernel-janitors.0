From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 01 Oct 2005 16:36:46 +0000
Subject: Re: [KJ] [PATCH][2.6.14-rc3] ext3: fix build warning if !quota
Message-Id: <20051001163646.GA8633@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45075709152444565=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <88ee31b70510010842545d15ff@mail.gmail.com>
In-Reply-To: <88ee31b70510010842545d15ff@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============45075709152444565==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 02, 2005 at 12:42:04AM +0900, Jerome Pinot wrote:
> Posted this on lkml and to Andrew Morton for -rc2 but doesn't get it fixed :-(

Uhh... Who stripped almost all newlines from the patch?

> Hope a better welcome here for a so trivial fix:

Sure. For MUA testing send a patch to youself, the apply it.

> sbi is not used if quota is not defined. This leads to a uselessvariable after preprocessing and a build warning.
> Thanks to apply.
> Signed-off-by: Jerome Pinot <ngc891@gmail.com>
>  ------8<------diff -Naur a/fs/ext3/super.c b/fs/ext3/super.c--- a/fs/ext3/super.c	2005-09-29 00:28:16.000000000 +0000+++ b/fs/ext3/super.c	2005-09-29 02:18:22.000000000 +0000@@ -513,7 +513,9 @@ static int ext3_show_options(struct seq_file *seq, struct vfsmount *vfs) { 	struct super_block *sb = vfs->mnt_sb;+#if defined(CONFIG_QUOTA) 	struct ext3_sb_info *sbi = EXT3_SB(sb);+#endif
>  	if (test_opt(sb, DATA_FLAGS) == EXT3_MOUNT_JOURNAL_DATA) 		seq_puts(seq, ",data=journal"); ------8<------


--===============45075709152444565==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45075709152444565==--
