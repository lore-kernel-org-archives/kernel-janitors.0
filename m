From: Daniele Pizzoni <auouo@tin.it>
Date: Mon, 18 Oct 2004 18:50:25 +0000
Subject: [KJ] [PATCH] Replace Dprintk with pr_debug from kernel.h - boot.c
Message-Id: <1098128556.3024.58.camel@pdp11.tsho.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0008263884439638769=="
List-Id: <kernel-janitors.vger.kernel.org>
To: Len Brown <len.brown@intel.com>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, LKML <linux-kernel@vger.kernel.org>

--===============0008263884439638769==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Replaced Dprintk with pr_debug from kernel.h
Compile tested

Signed-off-by: Daniele Pizzoni <auouo@tin.it>

Index: linux-2.6.9-rc4/arch/i386/kernel/acpi/boot.c
===================================================================
--- linux-2.6.9-rc4.orig/arch/i386/kernel/acpi/boot.c	2004-10-18 19:41:13.000000000 +0200
+++ linux-2.6.9-rc4/arch/i386/kernel/acpi/boot.c	2004-10-18 21:20:18.712354096 +0200
@@ -23,6 +23,8 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+//#define DEBUG // pr_debug
+#include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/config.h>
 #include <linux/acpi.h>
@@ -461,7 +463,7 @@ unsigned int acpi_register_gsi(u32 gsi, 
 
 		if (edge_level == ACPI_LEVEL_SENSITIVE) {
 			if ((gsi < 16) && !((1 << gsi) & irq_mask)) {
-				Dprintk(KERN_DEBUG PREFIX "Setting GSI %u as level-triggered\n", gsi);
+				pr_debug(PREFIX "Setting GSI %u as level-triggered\n", gsi);
 				irq_mask |= (1 << gsi);
 				eisa_set_level_irq(gsi);
 			}



--===============0008263884439638769==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0008263884439638769==--
