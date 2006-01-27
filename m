From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:33:03 +0000
Subject: [KJ] [Patch 10/12] BUG_ON() Conversion in fs/sysv/
Message-Id: <1138354383.7391.62.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71193570901023406=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============71193570901023406==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/sysv/dir.c.orig	2006-01-27 01:50:57.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/sysv/dir.c	2006-01-27 01:51:14.000000000 +0100
@@ -253,8 +253,7 @@ int sysv_delete_entry(struct sysv_dir_en
 
 	lock_page(page);
 	err = mapping->a_ops->prepare_write(NULL, page, from, to);
-	if (err)
-		BUG();
+	BUG_ON(err);
 	de->inode = 0;
 	err = dir_commit_chunk(page, from, to);
 	dir_put_page(page);
@@ -353,8 +352,7 @@ void sysv_set_link(struct sysv_dir_entry
 
 	lock_page(page);
 	err = page->mapping->a_ops->prepare_write(NULL, page, from, to);
-	if (err)
-		BUG();
+	BUG_ON(err);
 	de->inode = cpu_to_fs16(SYSV_SB(inode->i_sb), inode->i_ino);
 	err = dir_commit_chunk(page, from, to);
 	dir_put_page(page);



--===============71193570901023406==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71193570901023406==--
