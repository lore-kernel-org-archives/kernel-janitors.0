From: Ron Gage <ron@rongage.org>
Date: Sat, 04 Feb 2006 15:47:22 +0000
Subject: [KJ] [PATCH] - request_region
Message-Id: <20060204104722.3vjv1fgevs0kwcs4@webmail.rongage.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Greetings:

Trial patch - want to make sure that I am doing things "correctly" before I dive
in too far...

diff -ur linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c
linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c
--- linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c  2006-01-02
21:21:10.000000000 -0600
+++ linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c       2006-02-04
10:29:03.000000000 -0600
@@ -142,9 +142,12 @@
                tmp = inl (PCI_REG(SH7751_PCIPAR));
                outl (0x80000000, PCI_REG(SH7751_PCIPAR));
                if (inl (PCI_REG(SH7751_PCIPAR)) = 0x80000000) {
+                       struct resource *region;
                        outl (tmp, PCI_REG(SH7751_PCIPAR));
                        printk(KERN_INFO "PCI: Using configuration type 1\n");
-                       request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI conf1");
+                       region = request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI
conf1");
+                       if (!region)
+                               return -EBUSY;
                        return 0;
                }
                outl (tmp, PCI_REG(SH7751_PCIPAR));



-- 
Ron Gage
(LPIC1 MCP A+ Net+)
Westland, Michigan

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
