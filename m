From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 23 Feb 2006 22:13:26 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/udf
Message-Id: <1140732806.12049.12.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6363835951077963=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6363835951077963==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/udf to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/udf/ialloc.c.orig	2006-02-23 01:18:45.000000000 +0100
+++ linux-2.6.16-rc4/fs/udf/ialloc.c	2006-02-23 01:19:21.000000000 +0100
@@ -129,14 +129,12 @@ struct inode * udf_new_inode (struct ino
 	{
 		UDF_I_EFE(inode) = 1;
 		UDF_UPDATE_UDFREV(inode->i_sb, UDF_VERS_USE_EXTENDED_FE);
-		UDF_I_DATA(inode) = kmalloc(inode->i_sb->s_blocksize - sizeof(struct extendedFileEntry), GFP_KERNEL);
-		memset(UDF_I_DATA(inode), 0x00, inode->i_sb->s_blocksize - sizeof(struct extendedFileEntry));
+		UDF_I_DATA(inode) = kzalloc(inode->i_sb->s_blocksize - sizeof(struct extendedFileEntry), GFP_KERNEL);
 	}
 	else
 	{
 		UDF_I_EFE(inode) = 0;
-		UDF_I_DATA(inode) = kmalloc(inode->i_sb->s_blocksize - sizeof(struct fileEntry), GFP_KERNEL);
-		memset(UDF_I_DATA(inode), 0x00, inode->i_sb->s_blocksize - sizeof(struct fileEntry));
+		UDF_I_DATA(inode) = kzalloc(inode->i_sb->s_blocksize - sizeof(struct fileEntry), GFP_KERNEL);
 	}
 	if (UDF_QUERY_FLAG(inode->i_sb, UDF_FLAG_USE_AD_IN_ICB))
 		UDF_I_ALLOCTYPE(inode) = ICBTAG_FLAG_AD_IN_ICB;
--- linux-2.6.16-rc4/fs/udf/super.c.orig	2006-02-23 01:18:22.000000000 +0100
+++ linux-2.6.16-rc4/fs/udf/super.c	2006-02-23 01:18:35.000000000 +0100
@@ -1493,11 +1493,10 @@ static int udf_fill_super(struct super_b
 	uopt.gid = -1;
 	uopt.umask = 0;
 
-	sbi = kmalloc(sizeof(struct udf_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(struct udf_sb_info), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 	sb->s_fs_info = sbi;
-	memset(UDF_SB(sb), 0x00, sizeof(struct udf_sb_info));
 
 	init_MUTEX(&sbi->s_alloc_sem);
 



--===============6363835951077963==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6363835951077963==--
