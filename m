From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 13:41:47 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the
Message-Id: <444E271B.1090200@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the ieee1394-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/ieee1394/ohci1394.c linux/drivers/ieee1394/ohci1394.c
--- linux-2.6.17-rc2/drivers/ieee1394/ohci1394.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/ieee1394/ohci1394.c	2006-04-25 15:37:49.000000000 +0200
@@ -3564,7 +3564,7 @@

  #define PCI_CLASS_FIREWIRE_OHCI     ((PCI_CLASS_SERIAL_FIREWIRE << 8) | 0x10)

-static struct pci_device_id ohci1394_pci_tbl[] = {
+static struct pci_device_id ohci1394_pci_tbl[] __devinitdata = {
  	{
  		.class = 	PCI_CLASS_FIREWIRE_OHCI,
  		.class_mask = 	PCI_ANY_ID,
diff -urN linux-2.6.17-rc2/drivers/ieee1394/pcilynx.c linux/drivers/ieee1394/pcilynx.c
--- linux-2.6.17-rc2/drivers/ieee1394/pcilynx.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ieee1394/pcilynx.c	2006-04-25 15:38:14.000000000 +0200
@@ -1519,7 +1519,7 @@
  }


-static struct pci_device_id pci_table[] = {
+static struct pci_device_id pci_table[] __devinitdata = {
  	{
                  .vendor =    PCI_VENDOR_ID_TI,
                  .device =    PCI_DEVICE_ID_TI_PCILYNX,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
