From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 23 Feb 2006 22:13:20 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/ext2
Message-Id: <1140732800.12049.10.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33564711836853456=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140603463.14898.13.camel@alice>
In-Reply-To: <1140603463.14898.13.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============33564711836853456==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/ext2 to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/ext2/super.c.orig	2006-02-23 01:14:43.000000000 +0100
+++ linux-2.6.16-rc4/fs/ext2/super.c	2006-02-23 01:14:58.000000000 +0100
@@ -612,11 +612,10 @@ static int ext2_fill_super(struct super_
 	int i, j;
 	__le32 features;
 
-	sbi = kmalloc(sizeof(*sbi), GFP_KERNEL);
+	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 	sb->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(*sbi));
 
 	/*
 	 * See what the current blocksize for the device is, and
--- linux-2.6.16-rc4/fs/ext2/xattr.c.orig	2006-02-23 01:15:07.000000000 +0100
+++ linux-2.6.16-rc4/fs/ext2/xattr.c	2006-02-23 01:15:28.000000000 +0100
@@ -521,11 +521,10 @@ bad_block:		ext2_error(sb, "ext2_xattr_s
 		}
 	} else {
 		/* Allocate a buffer where we construct the new block. */
-		header = kmalloc(sb->s_blocksize, GFP_KERNEL);
+		header = kzalloc(sb->s_blocksize, GFP_KERNEL);
 		error = -ENOMEM;
 		if (header == NULL)
 			goto cleanup;
-		memset(header, 0, sb->s_blocksize);
 		end = (char *)header + sb->s_blocksize;
 		header->h_magic = cpu_to_le32(EXT2_XATTR_MAGIC);
 		header->h_blocks = header->h_refcount = cpu_to_le32(1);



--===============33564711836853456==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33564711836853456==--
