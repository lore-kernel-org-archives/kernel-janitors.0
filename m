From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:32:36 +0000
Subject: [KJ] [Patch 3/12] BUG_ON() Conversion in fs/ext2/
Message-Id: <1138354356.7391.50.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84229485907886215=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84229485907886215==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/ext2/dir.c.orig	2006-01-27 01:27:08.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/ext2/dir.c	2006-01-27 01:27:29.000000000 +0100
@@ -420,8 +420,7 @@ void ext2_set_link(struct inode *dir, st
 
 	lock_page(page);
 	err = page->mapping->a_ops->prepare_write(NULL, page, from, to);
-	if (err)
-		BUG();
+	BUG_ON(err);
 	de->inode = cpu_to_le32(inode->i_ino);
 	ext2_set_de_type (de, inode);
 	err = ext2_commit_chunk(page, from, to);
@@ -558,8 +557,7 @@ int ext2_delete_entry (struct ext2_dir_e
 		from = (char*)pde - (char*)page_address(page);
 	lock_page(page);
 	err = mapping->a_ops->prepare_write(NULL, page, from, to);
-	if (err)
-		BUG();
+	BUG_ON(err);
 	if (pde)
 		pde->rec_len = cpu_to_le16(to-from);
 	dir->inode = 0;



--===============84229485907886215==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84229485907886215==--
