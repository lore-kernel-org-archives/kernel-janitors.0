From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 07 Aug 2006 21:21:55 +0000
Subject: [KJ] [Patch] isa_read[bwl] in TODO
Message-Id: <1154985715.28109.2.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

it seems that there are no more users of isa_read[bwl] and it isnt even
defined anymore in most arches. The only define is in /include/asm-i386/io.h which is also the only user of this define
( maps readb() and readw() to isa_readb() and isa_readw() ).
I guess its therefore safe to remove it from the janitor TODO list.

Signed-off-by: Eric Sesterhenn

--- TODO.orig	2006-08-07 23:16:53.000000000 +0200
+++ TODO	2006-08-07 23:17:47.000000000 +0200
@@ -199,21 +199,6 @@ copy_to/from_user:
 
 Items with longer description in no particular order:
 -----------------------------------------------------------------------------
-- get rid of isa_read/write[bwl], use ioremap instead
-	-  unsigned long addr = 0xC0000;
-	-  isa_writeb (0xC0, addr);
-	+  void __iomem *cookie = ioremap(0xC0000, region_size);
-	+  if (!cookie) { fail... }
-	+  writeb(0xC0, cookie);
-	+  iounmap(cookie);
-
-Note there is a ioremap step at driver init time, and an iounmap step at
-driver shutdown time.  isa_xxx simply doesn't have the remap/unmap
-stuff.
-
-Read Documentation/IO-mapping.txt for more details.
-
------------------------------------------------------------------------------
 [Al Viro]
 
         * try and convince XFS folks that they want to use negative numbers


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
