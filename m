From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 13:03:10 +0000
Subject: [KJ] [Patch 2/7] BUG_ON() Conversion in mm/memory.c
Message-Id: <1138712590.11570.13.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44467441010300846=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============44467441010300846==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/mm/memory.c.orig	2006-01-30 23:13:27.000000000 +0100
+++ linux-2.6.16-rc1-git4/mm/memory.c	2006-01-30 23:13:45.000000000 +0100
@@ -2339,10 +2339,8 @@ int make_pages_present(unsigned long add
 	if (!vma)
 		return -1;
 	write = (vma->vm_flags & VM_WRITE) != 0;
-	if (addr >= end)
-		BUG();
-	if (end > vma->vm_end)
-		BUG();
+	BUG_ON(addr >= end);
+	BUG_ON(end > vma->vm_end);
 	len = (end+PAGE_SIZE-1)/PAGE_SIZE-addr/PAGE_SIZE;
 	ret = get_user_pages(current, current->mm, addr,
 			len, write, 0, NULL, NULL);



--===============44467441010300846==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44467441010300846==--
