From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 23 Feb 2006 22:13:15 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/affs
Message-Id: <1140732796.12049.9.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42293809902032509=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140653105.5833.7.camel@alice>
In-Reply-To: <1140653105.5833.7.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============42293809902032509==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/affs to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/affs/bitmap.c.orig	2006-02-23 01:16:12.000000000 +0100
+++ linux-2.6.16-rc4/fs/affs/bitmap.c	2006-02-23 01:16:33.000000000 +0100
@@ -289,12 +289,11 @@ int affs_init_bitmap(struct super_block 
 	sbi->s_bmap_count = (sbi->s_partition_size - sbi->s_reserved +
 				 sbi->s_bmap_bits - 1) / sbi->s_bmap_bits;
 	size = sbi->s_bmap_count * sizeof(*bm);
-	bm = sbi->s_bitmap = kmalloc(size, GFP_KERNEL);
+	bm = sbi->s_bitmap = kzalloc(size, GFP_KERNEL);
 	if (!sbi->s_bitmap) {
 		printk(KERN_ERR "AFFS: Bitmap allocation failed\n");
 		return -ENOMEM;
 	}
-	memset(sbi->s_bitmap, 0, size);
 
 	bmap_blk = (__be32 *)sbi->s_root_bh->b_data;
 	blk = sb->s_blocksize / 4 - 49;
--- linux-2.6.16-rc4/fs/affs/super.c.orig	2006-02-23 01:16:42.000000000 +0100
+++ linux-2.6.16-rc4/fs/affs/super.c	2006-02-23 01:16:54.000000000 +0100
@@ -277,11 +277,10 @@ static int affs_fill_super(struct super_
 	sb->s_op                = &affs_sops;
 	sb->s_flags |= MS_NODIRATIME;
 
-	sbi = kmalloc(sizeof(struct affs_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(struct affs_sb_info), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 	sb->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(*sbi));
 	init_MUTEX(&sbi->s_bmlock);
 
 	if (!parse_options(data,&uid,&gid,&i,&reserved,&root_block,



--===============42293809902032509==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42293809902032509==--
