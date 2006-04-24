From: Henne <henne@nachtwindheim.de>
Date: Mon, 24 Apr 2006 14:56:45 +0000
Subject: [KJ] [PATCH] Marking the pci_device table of the usb-subsys as
Message-Id: <444CE72D.1090209@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CC1F5.7050906@nachtwindheim.de>
In-Reply-To: <444CC1F5.7050906@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device table of the usb-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/usb/gadget/goku_udc.c 
linux/drivers/usb/gadget/goku_udc.c
--- linux-2.6.17-rc2/drivers/usb/gadget/goku_udc.c	2006-04-24 
13:31:01.000000000 +0200
+++ linux/drivers/usb/gadget/goku_udc.c	2006-04-24 16:53:23.000000000 +0200
@@ -1954,7 +1954,7 @@

 
/*-------------------------------------------------------------------------*/

-static struct pci_device_id pci_ids [] = { {
+static struct pci_device_id pci_ids[] __devinitdata = { {
  	.class = 	((PCI_CLASS_SERIAL_USB << 8) | 0xfe),
  	.class_mask = 	~0,
  	.vendor =	0x102f,		/* Toshiba */
diff -urN linux-2.6.17-rc2/drivers/usb/gadget/net2280.c 
linux/drivers/usb/gadget/net2280.c
--- linux-2.6.17-rc2/drivers/usb/gadget/net2280.c	2006-04-24 
13:31:01.000000000 +0200
+++ linux/drivers/usb/gadget/net2280.c	2006-04-24 16:53:12.000000000 +0200
@@ -2974,7 +2974,7 @@

 
/*-------------------------------------------------------------------------*/

-static struct pci_device_id pci_ids [] = { {
+static struct pci_device_id pci_ids[] __devinitdata = { {
  	.class = 	((PCI_CLASS_SERIAL_USB << 8) | 0xfe),
  	.class_mask = 	~0,
  	.vendor =	0x17cc,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
