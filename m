From: Michael Veeck <michael.veeck@gmx.net>
Date: Sun, 15 Aug 2004 11:44:05 +0000
Subject: [Kernel-janitors] [PATCH] minmax-removal arch/m68k/kernel/bios32.c
Message-Id: <411F4C85.6010407@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010107000804070004070306"
List-Id: <kernel-janitors.vger.kernel.org>
References: <411F4C54.4090609@gmx.net>
In-Reply-To: <411F4C54.4090609@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010107000804070004070306
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.8.1) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Since I dont have the hardware those patches are not tested.

Best regards
Veeck

Signed-off-by: Michael Veeck <michael.veeck@gmx.net>





--------------010107000804070004070306
Content-Type: text/plain;
 name="minmax-arch-m68k-kernel.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax-arch-m68k-kernel.patch"

--- linux-2.6.8-old/arch/m68k/kernel/bios32.c	2004-08-14 11:49:02.000000000 +0200
+++ linux-2.6.8-new/arch/m68k/kernel/bios32.c	2004-08-15 13:05:10.251098088 +0200
@@ -46,8 +46,6 @@
 
 #define ALIGN(val,align)	(((val) + ((align) - 1)) & ~((align) - 1))
 
-#define MAX(val1, val2)		(((val1) > (val2)) ? val1 : val2)
-
 /*
  * Offsets relative to the I/O and memory base addresses from where resources
  * are allocated.
@@ -176,7 +174,7 @@ static void __init layout_dev(struct pci
 			 * Align to multiple of size of minimum base.
 			 */
 
-			alignto = MAX(0x040, size) ;
+			alignto = max_t(unsigned int, 0x040, size);
 			base = ALIGN(io_base, alignto);
 			io_base = base + size;
 			pci_write_config_dword(dev, reg, base | PCI_BASE_ADDRESS_SPACE_IO);
@@ -219,7 +217,7 @@ static void __init layout_dev(struct pci
 			 * Align to multiple of size of minimum base.
 			 */
 
-			alignto = MAX(0x1000, size) ;
+			alignto = max_t(unsigned int, 0x1000, size);
 			base = ALIGN(mem_base, alignto);
 			mem_base = base + size;
 			pci_write_config_dword(dev, reg, base);

--------------010107000804070004070306
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010107000804070004070306--
