From: Jerome Pinot <ngc891@gmail.com>
Date: Sat, 01 Oct 2005 16:20:25 +0000
Subject: Re: [KJ] [PATCH][2.6.14-rc3] ext3: fix build warning if !quota
Message-Id: <88ee31b70510010920736b8007@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11631357931450115=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <88ee31b70510010842545d15ff@mail.gmail.com>
In-Reply-To: <88ee31b70510010842545d15ff@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============11631357931450115==
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

> There is a problem with your mailer setup, if you can't manage to> include the patch inline, please attach it (it is considered bad, but> at least your patch can be applied).
I really think I'm doomed with this one.
Here is the patch (sorry for the list)
------8<------diff -Naur a/fs/ext3/super.c b/fs/ext3/super.c--- a/fs/ext3/super.c	2005-09-29 00:28:16.000000000 +0000+++ b/fs/ext3/super.c	2005-09-29 02:18:22.000000000 +0000@@ -513,7 +513,9 @@ static int ext3_show_options(struct seq_file *seq, struct vfsmount *vfs) { 	struct super_block *sb = vfs->mnt_sb;+#if defined(CONFIG_QUOTA) 	struct ext3_sb_info *sbi = EXT3_SB(sb);+#endif
 	if (test_opt(sb, DATA_FLAGS) == EXT3_MOUNT_JOURNAL_DATA) 		seq_puts(seq, ",data=journal");------8<------
You can get it too from here:http://lkml.org/lkml/diff/2005/9/28/341/1
I'll work on my patch submission process...
Thanks
--Jerome Pinothttp://ngc891.blogdns.net/

--===============11631357931450115==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11631357931450115==--
