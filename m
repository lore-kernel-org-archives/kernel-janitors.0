From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 19 Dec 2005 20:32:58 +0000
Subject: [KJ] [Patch] Cleanup LINUX_VERSION_CODE in mtd/nand/au1550nd.
Message-Id: <1135024378.22691.4.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31922668403418397=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1135024293.22691.1.camel@alice>
In-Reply-To: <1135024293.22691.1.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============31922668403418397==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch removes LINUX_VERSION_CODE 
from au1550nd.c.

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc6/drivers/mtd/nand/au1550nd.c.orig	2005-12-19 21:05:06.000000000 +0100
+++ linux-2.6.15-rc6/drivers/mtd/nand/au1550nd.c	2005-12-19 21:05:43.000000000 +0100
@@ -20,18 +20,7 @@
 #include <linux/version.h>
 #include <asm/io.h>
 
-/* fixme: this is ugly */
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2, 6, 0)
 #include <asm/mach-au1x00/au1xxx.h>
-#else
-#include <asm/au1000.h>
-#ifdef CONFIG_MIPS_PB1550
-#include <asm/pb1550.h>
-#endif
-#ifdef CONFIG_MIPS_DB1550
-#include <asm/db1x00.h>
-#endif
-#endif
 
 /*
  * MTD structure for NAND controller



--===============31922668403418397==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31922668403418397==--
