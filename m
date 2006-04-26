From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 06:52:53 +0000
Subject: [KJ] [PATCH] __devinitdata to usb-subsys
Message-Id: <444F18C5.7060606@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the usb-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/usb/gadget/goku_udc.c linux/drivers/usb/gadget/goku_udc.c
--- linux-2.6.17-rc2/drivers/usb/gadget/goku_udc.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/usb/gadget/goku_udc.c	2006-04-24 16:53:23.000000000 +0200
@@ -1954,7 +1954,7 @@

  /*-------------------------------------------------------------------------*/

-static struct pci_device_id pci_ids [] = { {
+static struct pci_device_id pci_ids[] __devinitdata = { {
  	.class = 	((PCI_CLASS_SERIAL_USB << 8) | 0xfe),
  	.class_mask = 	~0,
  	.vendor =	0x102f,		/* Toshiba */
diff -urN linux-2.6.17-rc2/drivers/usb/gadget/net2280.c linux/drivers/usb/gadget/net2280.c
--- linux-2.6.17-rc2/drivers/usb/gadget/net2280.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/usb/gadget/net2280.c	2006-04-24 16:53:12.000000000 +0200
@@ -2974,7 +2974,7 @@

  /*-------------------------------------------------------------------------*/

-static struct pci_device_id pci_ids [] = { {
+static struct pci_device_id pci_ids[] __devinitdata = { {
  	.class = 	((PCI_CLASS_SERIAL_USB << 8) | 0xfe),
  	.class_mask = 	~0,
  	.vendor =	0x17cc,
diff -urN linux-2.6.17-rc2/drivers/usb/host/ehci-pci.c linux/drivers/usb/host/ehci-pci.c
--- linux-2.6.17-rc2/drivers/usb/host/ehci-pci.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/usb/host/ehci-pci.c	2006-04-26 08:49:39.000000000 +0200
@@ -348,7 +348,7 @@
  /*-------------------------------------------------------------------------*/

  /* PCI driver selection metadata; PCI hotplugging uses this */
-static const struct pci_device_id pci_ids [] = { {
+static const struct pci_device_id pci_ids[] __devinitdata = { {
  	/* handle any USB 2.0 EHCI controller */
  	PCI_DEVICE_CLASS(((PCI_CLASS_SERIAL_USB << 8) | 0x20), ~0),
  	.driver_data =	(unsigned long) &ehci_pci_hc_driver,
diff -urN linux-2.6.17-rc2/drivers/usb/host/ohci-pci.c linux/drivers/usb/host/ohci-pci.c
--- linux-2.6.17-rc2/drivers/usb/host/ohci-pci.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/usb/host/ohci-pci.c	2006-04-26 08:44:48.000000000 +0200
@@ -204,7 +204,7 @@
  /*-------------------------------------------------------------------------*/


-static const struct pci_device_id pci_ids [] = { {
+static const struct pci_device_id pci_ids[] __devinitdata = { {
  	/* handle any USB OHCI controller */
  	PCI_DEVICE_CLASS((PCI_CLASS_SERIAL_USB << 8) | 0x10, ~0),
  	.driver_data =	(unsigned long) &ohci_pci_hc_driver,
diff -urN linux-2.6.17-rc2/drivers/usb/host/uhci-hcd.c linux/drivers/usb/host/uhci-hcd.c
--- linux-2.6.17-rc2/drivers/usb/host/uhci-hcd.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/usb/host/uhci-hcd.c	2006-04-26 08:45:52.000000000 +0200
@@ -856,7 +856,7 @@
  	.hub_control =		uhci_hub_control,
  };

-static const struct pci_device_id uhci_pci_ids[] = { {
+static const struct pci_device_id uhci_pci_ids[] __devinitdata = { {
  	/* handle any USB UHCI controller */
  	PCI_DEVICE_CLASS(((PCI_CLASS_SERIAL_USB << 8) | 0x00), ~0),
  	.driver_data =	(unsigned long) &uhci_driver,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
