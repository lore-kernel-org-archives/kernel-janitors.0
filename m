From: Henne <henne@nachtwindheim.de>
Date: Mon, 24 Apr 2006 15:09:18 +0000
Subject: [KJ] [PATCH] Cleanup of sn-subsys
Message-Id: <444CEA1E.8000407@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_driver_id tables of sn-subsystem as __devinitdata and
removing a bogus __devinitdata from ioc4's pci_driver table.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---
I hope nobody found out what happened in this pci_driver case.

diff -urN linux-2.6.17-rc2/drivers/sn/ioc3.c linux/drivers/sn/ioc3.c
--- linux-2.6.17-rc2/drivers/sn/ioc3.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/sn/ioc3.c	2006-04-24 16:58:34.000000000 +0200
@@ -800,7 +800,7 @@
  	kfree(idd);
  }

-static struct pci_device_id ioc3_id_table[] = {
+static struct pci_device_id ioc3_id_table[] __devinitdata = {
  	{PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3, PCI_ANY_ID, PCI_ANY_ID},
  	{0}
  };
diff -urN linux-2.6.17-rc2/drivers/sn/ioc4.c linux/drivers/sn/ioc4.c
--- linux-2.6.17-rc2/drivers/sn/ioc4.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/sn/ioc4.c	2006-04-24 17:01:57.000000000 +0200
@@ -378,13 +378,13 @@
  	kfree(idd);
  }

-static struct pci_device_id ioc4_id_table[] = {
+static struct pci_device_id ioc4_id_table[] __devinitdata = {
  	{PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC4, PCI_ANY_ID,
  	 PCI_ANY_ID, 0x0b4000, 0xFFFFFF},
  	{0}
  };

-static struct pci_driver __devinitdata ioc4_driver = {
+static struct pci_driver ioc4_driver = {
  	.name = "IOC4",
  	.id_table = ioc4_id_table,
  	.probe = ioc4_probe,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
