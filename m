From: Ron Gage <ron@rongage.org>
Date: Sat, 04 Feb 2006 16:38:07 +0000
Subject: [KJ] [PATCH][RESUBMIT] - request_region
Message-Id: <20060204113807.8llr86twwudc4wwg@webmail.rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_6g1kg38t4z9c"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This message is in MIME format.

--=_6g1kg38t4z9c
Content-Type: text/plain;
	charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Resubmitted to clean up tabs to spaces conversion.


-- 
Ron Gage
(LPIC1 MCP A+ Net+)
Westland, Michigan

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

--=_6g1kg38t4z9c
Content-Type: text/x-patch;
	charset=ISO-8859-1;
	name="sh_pci_sh7751.patch"
Content-Disposition: attachment;
	filename="sh_pci_sh7751.patch"
Content-Transfer-Encoding: 7bit

diff -ur linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c
--- linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c	2006-02-04 11:00:10.000000000 -0500
+++ linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c	2006-02-04 10:54:11.000000000 -0500
@@ -142,9 +142,12 @@
 		tmp = inl (PCI_REG(SH7751_PCIPAR));
 		outl (0x80000000, PCI_REG(SH7751_PCIPAR));
 		if (inl (PCI_REG(SH7751_PCIPAR)) == 0x80000000) {
+			struct resource *region;
 			outl (tmp, PCI_REG(SH7751_PCIPAR));
 			printk(KERN_INFO "PCI: Using configuration type 1\n");
-			request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI conf1");
+			region = request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI conf1");
+			if (!region)
+				return -EBUSY;
 			return 0;
 		}
 		outl (tmp, PCI_REG(SH7751_PCIPAR));

--=_6g1kg38t4z9c
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--=_6g1kg38t4z9c--
