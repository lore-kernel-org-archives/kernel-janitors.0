From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:32:55 +0000
Subject: [KJ] [Patch 8/12] BUG_ON() Conversion in fs/smbfs/
Message-Id: <1138354376.7391.58.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32771158420256885=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32771158420256885==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/smbfs/file.c.orig	2006-01-27 01:49:40.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/smbfs/file.c	2006-01-27 01:49:57.000000000 +0100
@@ -178,11 +178,9 @@ smb_writepage(struct page *page, struct 
 	unsigned offset = PAGE_CACHE_SIZE;
 	int err;
 
-	if (!mapping)
-		BUG();
+	BUG_ON(!mapping);
 	inode = mapping->host;
-	if (!inode)
-		BUG();
+	BUG_ON(!inode);
 
 	end_index = inode->i_size >> PAGE_CACHE_SHIFT;
 



--===============32771158420256885==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32771158420256885==--
