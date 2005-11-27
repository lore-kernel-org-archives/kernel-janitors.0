From: Carlos Manuel Duclos Vergara <carlos@embedded.cl>
Date: Sun, 27 Nov 2005 17:09:49 +0000
Subject: Re: [KJ] pci-sh7751.c request_region return value check
Message-Id: <200511271409.50485.carlos@embedded.cl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_eheiD9wxIo0D1ps"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200511262000.12480.carlos@embedded.cl>
In-Reply-To: <200511262000.12480.carlos@embedded.cl>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_eheiD9wxIo0D1ps
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Ok, thanks for your corrections. Attached is the new patch.

-- 
Carlos Manuel Duclos Vergara
http://www.toolchains.com/personal/blog

--Boundary-00=_eheiD9wxIo0D1ps
Content-Type: text/x-diff; charset="iso-8859-1"; name="pci-sh7751.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="pci-sh7751.c.patch"

--- Builds/linux-2.6.14.3/arch/sh/drivers/pci/pci-sh7751.c	2005-11-24 19:10:21.000000000 -0300
+++ Devel/linux-2.6.14.3/arch/sh/drivers/pci/pci-sh7751.c	2005-11-27 14:07:39.000000000 -0300
@@ -126,6 +126,7 @@
 static int __init pci_check_direct(void)
 {
 	unsigned int tmp, id;
+	struct resource *r = NULL;
 
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
+			if( !r )
+			{
+				printk(KERN_CRIT "PCI: Could not allocate memory for our controller (Address: %lu)\n", PCI_REG(SH7751_PCIPAR));
+				return -ENODEV;
+			}
 			return 0;
 		}
 		outl (tmp, PCI_REG(SH7751_PCIPAR));

--Boundary-00=_eheiD9wxIo0D1ps
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_eheiD9wxIo0D1ps--
