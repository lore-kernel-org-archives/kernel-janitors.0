From: Ron Gage <ron@rongage.org>
Date: Sat, 04 Feb 2006 19:52:54 +0000
Subject: [KJ] [PATCH][INLINE] region_request - sh/pci_sh7751.c
Message-Id: <200602041452.55062.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27326467175760949=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27326467175760949==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch adds return value checking to request_region.  No other structural 
changes included...  Using kmail->message->insert file to post patch.

diff -ur linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c 
linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c
--- linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c	2006-02-04 
11:00:10.000000000 -0500
+++ linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c	2006-02-04 
10:54:11.000000000 -0500
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

-- 
Ron Gage 
(LPIC1, MCP, A+, Net+)
Westland Michigan

--===============27326467175760949==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27326467175760949==--
