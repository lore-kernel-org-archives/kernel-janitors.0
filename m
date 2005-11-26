From: Carlos Manuel Duclos Vergara <carlos@embedded.cl>
Date: Sat, 26 Nov 2005 23:00:11 +0000
Subject: [KJ] pci-sh7751.c request_region return value check
Message-Id: <200511262000.12480.carlos@embedded.cl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_8jOiDzegnPywzEA"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_8jOiDzegnPywzEA
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

following your advises in your web site this is a small patch because is the 
first patch I submit to this project.
The request_region value was not checked in the function 
pci_check_direct(...), so I took care of it and in case of problems I return 
ENODEV instead of always returning 0 (as it does now).
Any comments, suggestions, etc... are welcomed.

Cheers!

PS This patch is against kernel 2.6.14.3

-- 
Carlos Manuel Duclos Vergara
http://www.toolchains.com/personal/blog

--Boundary-00=_8jOiDzegnPywzEA
Content-Type: text/x-diff;
  charset="us-ascii";
  name="pci-sh7751.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="pci-sh7751.c.patch"

--- Builds/linux-2.6.14.3/arch/sh/drivers/pci/pci-sh7751.c	2005-11-24 19:10:21.000000000 -0300
+++ Devel/linux-2.6.14.3/arch/sh/drivers/pci/pci-sh7751.c	2005-11-26 19:51:29.000000000 -0300
@@ -126,6 +126,7 @@
 static int __init pci_check_direct(void)
 {
 	unsigned int tmp, id;
+	struct resource * r = NULL;
 
 	/* check for SH7751/SH7751R hardware */
 	id = inl(SH7751_PCIREG_BASE+SH7751_PCICONF0);
@@ -144,7 +145,16 @@
 		if (inl (PCI_REG(SH7751_PCIPAR)) == 0x80000000) {
 			outl (tmp, PCI_REG(SH7751_PCIPAR));
 			printk(KERN_INFO "PCI: Using configuration type 1\n");
-			request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI conf1");
+			r = request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI conf1");
+			/*
+			 * Murphy's law....
+			 * (ENODEV or EINVAL in case of problems?)
+			 */
+			if( r == NULL )
+			{
+				printk( KERN_CRIT "PCI: Could not allocate memory for our controller (Address: %lu)\n", PCI_REG(SH7751_PCIPAR));
+				return -ENODEV;
+			}
 			return 0;
 		}
 		outl (tmp, PCI_REG(SH7751_PCIPAR));

--Boundary-00=_8jOiDzegnPywzEA
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_8jOiDzegnPywzEA--
