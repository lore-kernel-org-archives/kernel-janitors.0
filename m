From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 19 Dec 2005 00:24:21 +0000
Subject: Re: [KJ] [Patch 2/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <1134951861.8352.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32453751288992994=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134946431.7394.7.camel@alice>
In-Reply-To: <1134946431.7394.7.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============32453751288992994==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> In this case, you could make the code more readable by expanding all 
> uses of PCIDEV_NAME in vlsi_ir.c.

attached is an updated patch for vlsi_ir.h which also removes
the PCIDE_NAME macro, i will reply to this mail with a patch to change
the vlsi_ir.c 

> And the "#ifndef IRQ_RETVAL" block in vlsi_ir.h is also kernel 2.4 
> compatibility stuff.

can you give me some more information on this? Seems quite some
irda drivers use the IRQ_NONE an friends macro.


Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/irda/vlsi_ir.h.orig	2005-12-19 01:14:15.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/irda/vlsi_ir.h	2005-12-19 01:18:55.000000000 +0100
@@ -54,26 +54,6 @@ typedef void irqreturn_t;
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
-/* whatever we get from the associated struct device - bus:slot:dev.fn id */
-#define PCIDEV_NAME(pdev)	(pci_name(pdev))
-
-#endif
-
 /* ================================================================ */
 
 /* non-standard PCI registers */



--===============32453751288992994==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32453751288992994==--
