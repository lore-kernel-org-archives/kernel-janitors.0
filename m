From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 06:31:55 +0000
Subject: [KJ] [PATCH] __devinitdata in serial subsys
Message-Id: <444F13DB.3050907@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the serial-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---
diff -urN linux-2.6.17-rc2/drivers/serial/8250_pci.c linux/drivers/serial/8250_pci.c
--- linux-2.6.17-rc2/drivers/serial/8250_pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/serial/8250_pci.c	2006-04-24 17:11:45.000000000 +0200
@@ -1813,7 +1813,7 @@
  	return 0;
  }

-static struct pci_device_id serial_pci_tbl[] = {
+static struct pci_device_id serial_pci_tbl[] __devinitdata = {
  	{	PCI_VENDOR_ID_V3, PCI_DEVICE_ID_V3_V960,
  		PCI_SUBVENDOR_ID_CONNECT_TECH,
  		PCI_SUBDEVICE_ID_CONNECT_TECH_BH8_232, 0, 0,
diff -urN linux-2.6.17-rc2/drivers/serial/icom.c linux/drivers/serial/icom.c
--- linux-2.6.17-rc2/drivers/serial/icom.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/serial/icom.c	2006-04-24 17:44:48.000000000 +0200
@@ -70,7 +70,7 @@
  #define ICOM_PORT ((struct icom_port *)port)
  #define to_icom_adapter(d) container_of(d, struct icom_adapter, kobj)

-static const struct pci_device_id icom_pci_table[] = {
+static const struct pci_device_id icom_pci_table[] __devinitdata = {
  	{
  	      .vendor = PCI_VENDOR_ID_IBM,
  	      .device = PCI_DEVICE_ID_IBM_ICOM_DEV_ID_1,
diff -urN linux-2.6.17-rc2/drivers/serial/jsm/jsm_driver.c linux/drivers/serial/jsm/jsm_driver.c
--- linux-2.6.17-rc2/drivers/serial/jsm/jsm_driver.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/serial/jsm/jsm_driver.c	2006-04-24 17:12:42.000000000 +0200
@@ -205,7 +205,7 @@
  	kfree(brd);
  }

-static struct pci_device_id jsm_pci_tbl[] = {
+static struct pci_device_id jsm_pci_tbl[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_DIGI, PCI_DEVICE_ID_NEO_2DB9), 0, 0, 0 },
  	{ PCI_DEVICE(PCI_VENDOR_ID_DIGI, PCI_DEVICE_ID_NEO_2DB9PRI), 0, 0, 1 },
  	{ PCI_DEVICE(PCI_VENDOR_ID_DIGI, PCI_DEVICE_ID_NEO_2RJ45), 0, 0, 2 },
diff -urN linux-2.6.17-rc2/drivers/serial/serial_txx9.c linux/drivers/serial/serial_txx9.c
--- linux-2.6.17-rc2/drivers/serial/serial_txx9.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/serial/serial_txx9.c	2006-04-24 17:12:16.000000000 +0200
@@ -1149,7 +1149,7 @@
  	return 0;
  }

-static struct pci_device_id serial_txx9_pci_tbl[] = {
+static struct pci_device_id serial_txx9_pci_tbl[] __devinitdata = {
  	{	PCI_VENDOR_ID_TOSHIBA_2, PCI_DEVICE_ID_TOSHIBA_TC86C001_MISC,
  		PCI_ANY_ID, PCI_ANY_ID,
  		0, 0, 0 },
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
