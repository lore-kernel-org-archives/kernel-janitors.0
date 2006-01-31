From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 13:03:29 +0000
Subject: [KJ] [Patch 7/7] BUG_ON() Conversion in mm/vmalloc.c
Message-Id: <1138712609.11570.21.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66179552379333173=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66179552379333173==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/mm/vmalloc.c.orig	2006-01-30 22:26:02.000000000 +0100
+++ linux-2.6.16-rc1-git4/mm/vmalloc.c	2006-01-30 22:26:56.000000000 +0100
@@ -321,8 +321,7 @@ void __vunmap(void *addr, int deallocate
 		int i;
 
 		for (i = 0; i < area->nr_pages; i++) {
-			if (unlikely(!area->pages[i]))
-				BUG();
+			BUG_ON(unlikely(!area->pages[i]));
 			__free_page(area->pages[i]);
 		}
 



--===============66179552379333173==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66179552379333173==--
