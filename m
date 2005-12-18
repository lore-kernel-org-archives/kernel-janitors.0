From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Sun, 18 Dec 2005 22:53:51 +0000
Subject: [KJ] [Patch 2/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <1134946431.7394.7.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65305518871492119=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65305518871492119==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this removes LINUX_VERSION_CODE checks in irda/vlsi_ir.h

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/irda/vlsi_ir.h.orig	2005-12-18 23:45:15.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/irda/vlsi_ir.h	2005-12-18 23:46:10.000000000 +0100
@@ -54,26 +54,9 @@ typedef void irqreturn_t;
  */
 #include <linux/version.h>
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-
-/* PDE() introduced in 2.5.4 */
-#ifdef CONFIG_PROC_FS
-#define PDE(inode) ((inode)->u.generic_ip)
-#endif
-
-/* irda crc16 calculation exported in 2.5.42 */
-#define irda_calc_crc16(fcs,buf,len)	(GOOD_FCS)
-
-/* we use this for unified pci device name access */
-#define PCIDEV_NAME(pdev)	((pdev)->name)
-
-#else /* 2.5 or later */
-
 /* whatever we get from the associated struct device - bus:slot:dev.fn id */
 #define PCIDEV_NAME(pdev)	(pci_name(pdev))
 
-#endif
-
 /* ================================================================ */
 
 /* non-standard PCI registers */



--===============65305518871492119==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65305518871492119==--
