From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 07:03:57 +0000
Subject: [KJ] [PATCH] __devinitdata for pci-eisa bridge
Message-Id: <444F1B5D.7080209@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device tables of eisa-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/eisa/pci_eisa.c linux/drivers/eisa/pci_eisa.c
--- linux-2.6.17-rc2/drivers/eisa/pci_eisa.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/eisa/pci_eisa.c	2006-04-24 14:39:20.000000000 +0200
@@ -45,7 +45,7 @@
  	return 0;
  }

-static struct pci_device_id pci_eisa_pci_tbl[] = {
+static struct pci_device_id pci_eisa_pci_tbl[] __devinitdata = {
  	{ PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
  	  PCI_CLASS_BRIDGE_EISA << 8, 0xffff00, 0 },
  	{ 0, }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
