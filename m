From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 12:17:18 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the mtd-subsys as
Message-Id: <444E134E.5010102@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de

Marking the pci_device_id tables of the mtd-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/mtd/maps/amd76xrom.c linux/drivers/mtd/maps/amd76xrom.c
--- linux-2.6.17-rc2/drivers/mtd/maps/amd76xrom.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/mtd/maps/amd76xrom.c	2006-04-25 14:11:48.000000000 +0200
@@ -276,7 +276,7 @@
  	amd76xrom_cleanup(window);
  }

-static struct pci_device_id amd76xrom_pci_tbl[] = {
+static struct pci_device_id amd76xrom_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_VIPER_7410,
  		PCI_ANY_ID, PCI_ANY_ID, },
  	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_VIPER_7440,
diff -urN linux-2.6.17-rc2/drivers/mtd/maps/pci.c linux/drivers/mtd/maps/pci.c
--- linux-2.6.17-rc2/drivers/mtd/maps/pci.c	2006-04-24 13:30:57.000000000 +0200
+++ linux/drivers/mtd/maps/pci.c	2006-04-25 14:12:32.000000000 +0200
@@ -265,7 +265,7 @@
   * PCI device ID table
   */

-static struct pci_device_id mtd_pci_ids[] = {
+static struct pci_device_id mtd_pci_ids[] __devinitdata = {
  	{
  		.vendor =	PCI_VENDOR_ID_INTEL,
  		.device =	0x530d,
diff -urN linux-2.6.17-rc2/drivers/mtd/maps/scb2_flash.c linux/drivers/mtd/maps/scb2_flash.c
--- linux-2.6.17-rc2/drivers/mtd/maps/scb2_flash.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/mtd/maps/scb2_flash.c	2006-04-25 14:13:00.000000000 +0200
@@ -218,7 +218,7 @@
  	pci_set_drvdata(dev, NULL);
  }

-static struct pci_device_id scb2_flash_pci_ids[] = {
+static struct pci_device_id scb2_flash_pci_ids[] __devinitdata = {
  	{
  	  .vendor = PCI_VENDOR_ID_SERVERWORKS,
  	  .device = PCI_DEVICE_ID_SERVERWORKS_CSB5,

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
