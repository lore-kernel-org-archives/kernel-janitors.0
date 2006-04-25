From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 12:31:57 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the message-subsys
Message-Id: <444E16BD.1030905@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the message-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/message/fusion/mptfc.c linux/drivers/message/fusion/mptfc.c
--- linux-2.6.17-rc2/drivers/message/fusion/mptfc.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/message/fusion/mptfc.c	2006-04-25 14:28:03.000000000 +0200
@@ -131,7 +131,7 @@
   * Supported hardware
   */

-static struct pci_device_id mptfc_pci_table[] = {
+static struct pci_device_id mptfc_pci_table[] __devinitdata = {
  	{ PCI_VENDOR_ID_LSI_LOGIC, PCI_DEVICE_ID_LSI_FC909,
  		PCI_ANY_ID, PCI_ANY_ID },
  	{ PCI_VENDOR_ID_LSI_LOGIC, PCI_DEVICE_ID_LSI_FC919,
diff -urN linux-2.6.17-rc2/drivers/message/fusion/mptsas.c linux/drivers/message/fusion/mptsas.c
--- linux-2.6.17-rc2/drivers/message/fusion/mptsas.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/message/fusion/mptsas.c	2006-04-25 14:28:31.000000000 +0200
@@ -2292,7 +2292,7 @@
  	mptscsih_remove(pdev);
  }

-static struct pci_device_id mptsas_pci_table[] = {
+static struct pci_device_id mptsas_pci_table[] __devinitdata = {
  	{ PCI_VENDOR_ID_LSI_LOGIC, PCI_DEVICE_ID_LSI_SAS1064,
  		PCI_ANY_ID, PCI_ANY_ID },
  	{ PCI_VENDOR_ID_LSI_LOGIC, PCI_DEVICE_ID_LSI_SAS1066,
diff -urN linux-2.6.17-rc2/drivers/message/fusion/mptspi.c linux/drivers/message/fusion/mptspi.c
--- linux-2.6.17-rc2/drivers/message/fusion/mptspi.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/message/fusion/mptspi.c	2006-04-25 14:29:22.000000000 +0200
@@ -774,7 +774,7 @@
   * Supported hardware
   */

-static struct pci_device_id mptspi_pci_table[] = {
+static struct pci_device_id mptspi_pci_table[] __devinitdata = {
  	{ PCI_VENDOR_ID_LSI_LOGIC, PCI_DEVICE_ID_LSI_53C1030,
  		PCI_ANY_ID, PCI_ANY_ID },
  	{ PCI_VENDOR_ID_LSI_LOGIC, PCI_DEVICE_ID_LSI_1030_53C1035,
diff -urN linux-2.6.17-rc2/drivers/message/i2o/pci.c linux/drivers/message/i2o/pci.c
--- linux-2.6.17-rc2/drivers/message/i2o/pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/message/i2o/pci.c	2006-04-25 14:27:03.000000000 +0200
@@ -35,7 +35,7 @@
  #define OSM_DESCRIPTION	"I2O-subsystem"

  /* PCI device id table for all I2O controllers */
-static struct pci_device_id __devinitdata i2o_pci_ids[] = {
+static struct pci_device_id i2o_pci_ids[] __devinitdata = {
  	{PCI_DEVICE_CLASS(PCI_CLASS_INTELLIGENT_I2O << 8, 0xffff00)},
  	{PCI_DEVICE(PCI_VENDOR_ID_DPT, 0xa511)},
  	{.vendor = PCI_VENDOR_ID_INTEL,.device = 0x1962,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
