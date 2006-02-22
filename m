From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 22 Feb 2006 10:17:43 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/ext3
Message-Id: <1140603463.14898.13.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5139916259831192=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5139916259831192==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/ext3 to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/ext3/dir.c.orig	2006-02-22 11:02:22.000000000 +0100
+++ linux-2.6.16-rc4/fs/ext3/dir.c	2006-02-22 11:02:33.000000000 +0100
@@ -346,10 +346,9 @@ int ext3_htree_store_dirent(struct file 
 
 	/* Create and allocate the fname structure */
 	len = sizeof(struct fname) + dirent->name_len + 1;
-	new_fn = kmalloc(len, GFP_KERNEL);
+	new_fn = kzalloc(len, GFP_KERNEL);
 	if (!new_fn)
 		return -ENOMEM;
-	memset(new_fn, 0, len);
 	new_fn->hash = hash;
 	new_fn->minor_hash = minor_hash;
 	new_fn->inode = le32_to_cpu(dirent->inode);
--- linux-2.6.16-rc4/fs/ext3/super.c.orig	2006-02-22 11:02:46.000000000 +0100
+++ linux-2.6.16-rc4/fs/ext3/super.c	2006-02-22 11:03:41.000000000 +0100
@@ -1354,11 +1354,10 @@ static int ext3_fill_super (struct super
 	int needs_recovery;
 	__le32 features;
 
-	sbi = kmalloc(sizeof(*sbi), GFP_KERNEL);
+	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 	sb->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(*sbi));
 	sbi->s_mount_opt = 0;
 	sbi->s_resuid = EXT3_DEF_RESUID;
 	sbi->s_resgid = EXT3_DEF_RESGID;
--- linux-2.6.16-rc4/fs/ext3/xattr.c.orig	2006-02-22 11:03:51.000000000 +0100
+++ linux-2.6.16-rc4/fs/ext3/xattr.c	2006-02-22 11:04:22.000000000 +0100
@@ -733,12 +733,11 @@ ext3_xattr_block_set(handle_t *handle, s
 		}
 	} else {
 		/* Allocate a buffer where we construct the new block. */
-		s->base = kmalloc(sb->s_blocksize, GFP_KERNEL);
+		s->base = kzalloc(sb->s_blocksize, GFP_KERNEL);
 		/* assert(header == s->base) */
 		error = -ENOMEM;
 		if (s->base == NULL)
 			goto cleanup;
-		memset(s->base, 0, sb->s_blocksize);
 		header(s->base)->h_magic = cpu_to_le32(EXT3_XATTR_MAGIC);
 		header(s->base)->h_blocks = cpu_to_le32(1);
 		header(s->base)->h_refcount = cpu_to_le32(1);



--===============5139916259831192==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5139916259831192==--
