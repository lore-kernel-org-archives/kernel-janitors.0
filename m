From: james4765@verizon.net
Date: Sat, 20 Nov 2004 17:18:24 +0000
Subject: [KJ] [PATCH][RESEND] floppy: relocate devfs comment
Message-Id: <20041120171846.15784.42839.43474@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89360969215535724=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org, james4765@verizon.net

--===============89360969215535724==

Oops, forgot Signed-off-by: line.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.10-rc2-original/drivers/block/floppy.c linux-2.6.10-rc2/drivers/block/floppy.c
--- linux-2.6.10-rc2-original/drivers/block/floppy.c	2004-11-15 21:38:15.000000000 -0500
+++ linux-2.6.10-rc2/drivers/block/floppy.c	2004-11-20 11:11:47.670201702 -0500
@@ -98,6 +98,10 @@
  */
 
 /*
+ * 1998/1/21 -- Richard Gooch <rgooch@atnf.csiro.au> -- devfs support
+ */
+
+/*
  * 1998/05/07 -- Russell King -- More portability cleanups; moved definition of
  * interrupt and dma channel to asm/floppy.h. Cleaned up some formatting &
  * use of '0' for NULL.
@@ -159,10 +163,6 @@
 #define FDPATCHES
 #include <linux/fdreg.h>
 
-/*
- * 1998/1/21 -- Richard Gooch <rgooch@atnf.csiro.au> -- devfs support
- */
-
 #include <linux/fd.h>
 #include <linux/hdreg.h>
 

--===============89360969215535724==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89360969215535724==--
