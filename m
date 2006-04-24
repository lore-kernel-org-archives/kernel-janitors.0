From: Henne <henne@nachtwindheim.de>
Date: Mon, 24 Apr 2006 12:17:57 +0000
Subject: [KJ] [PATCH] Marking the pci_device tables in the ATM-subsystem as
Message-Id: <444CC1F5.7050906@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device tables in the ATM-subsystem as __devinitdata.

Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/atm/ambassador.c 
linux/drivers/atm/ambassador.c
--- linux-2.6.17-rc2/drivers/atm/ambassador.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/atm/ambassador.c	2006-04-24 13:48:56.000000000 +0200
@@ -2416,7 +2416,7 @@

  /********** module entry **********/

-static struct pci_device_id amb_pci_tbl[] = {
+static struct pci_device_id amb_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_MADGE, PCI_DEVICE_ID_MADGE_AMBASSADOR, PCI_ANY_ID, 
PCI_ANY_ID,
  	  0, 0, 0 },
  	{ PCI_VENDOR_ID_MADGE, PCI_DEVICE_ID_MADGE_AMBASSADOR_BAD, 
PCI_ANY_ID, PCI_ANY_ID,
diff -urN linux-2.6.17-rc2/drivers/atm/eni.c linux/drivers/atm/eni.c
--- linux-2.6.17-rc2/drivers/atm/eni.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/atm/eni.c	2006-04-24 13:49:57.000000000 +0200
@@ -2265,7 +2265,7 @@
  }


-static struct pci_device_id eni_pci_tbl[] = {
+static struct pci_device_id eni_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_EF, PCI_DEVICE_ID_EF_ATM_FPGA, PCI_ANY_ID, PCI_ANY_ID,
  	  0, 0, 0 /* FPGA */ },
  	{ PCI_VENDOR_ID_EF, PCI_DEVICE_ID_EF_ATM_ASIC, PCI_ANY_ID, PCI_ANY_ID,
diff -urN linux-2.6.17-rc2/drivers/atm/firestream.c 
linux/drivers/atm/firestream.c
--- linux-2.6.17-rc2/drivers/atm/firestream.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/atm/firestream.c	2006-04-24 13:50:44.000000000 +0200
@@ -2013,7 +2013,7 @@
  	func_exit ();
  }

-static struct pci_device_id firestream_pci_tbl[] = {
+static struct pci_device_id firestream_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_FUJITSU_ME, PCI_DEVICE_ID_FUJITSU_FS50,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, FS_IS50},
  	{ PCI_VENDOR_ID_FUJITSU_ME, PCI_DEVICE_ID_FUJITSU_FS155,
diff -urN linux-2.6.17-rc2/drivers/atm/fore200e.c 
linux/drivers/atm/fore200e.c
--- linux-2.6.17-rc2/drivers/atm/fore200e.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/atm/fore200e.c	2006-04-24 13:51:46.000000000 +0200
@@ -2795,7 +2795,7 @@


  #ifdef CONFIG_ATM_FORE200E_PCA
-static struct pci_device_id fore200e_pca_tbl[] = {
+static struct pci_device_id fore200e_pca_tbl[] __devinitdata = {
      { PCI_VENDOR_ID_FORE, PCI_DEVICE_ID_FORE_PCA200E, PCI_ANY_ID, 
PCI_ANY_ID,
        0, 0, (unsigned long) &fore200e_bus[0] },
      { 0, }
diff -urN linux-2.6.17-rc2/drivers/atm/he.c linux/drivers/atm/he.c
--- linux-2.6.17-rc2/drivers/atm/he.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/atm/he.c	2006-04-24 13:52:15.000000000 +0200
@@ -3060,7 +3060,7 @@
  module_param(sdh, bool, 0);
  MODULE_PARM_DESC(sdh, "use SDH framing (default 0)");

-static struct pci_device_id he_pci_tbl[] = {
+static struct pci_device_id he_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_FORE, PCI_DEVICE_ID_FORE_HE, PCI_ANY_ID, PCI_ANY_ID,
  	  0, 0, 0 },
  	{ 0, }
diff -urN linux-2.6.17-rc2/drivers/atm/horizon.c linux/drivers/atm/horizon.c
--- linux-2.6.17-rc2/drivers/atm/horizon.c	2006-03-20 06:53:29.000000000 
+0100
+++ linux/drivers/atm/horizon.c	2006-04-24 13:52:40.000000000 +0200
@@ -2907,7 +2907,7 @@
  MODULE_PARM_DESC(max_rx_size, "maximum size of RX AAL5 frames");
  MODULE_PARM_DESC(pci_lat, "PCI latency in bus cycles");

-static struct pci_device_id hrz_pci_tbl[] = {
+static struct pci_device_id hrz_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_MADGE, PCI_DEVICE_ID_MADGE_HORIZON, PCI_ANY_ID, 
PCI_ANY_ID,
  	  0, 0, 0 },
  	{ 0, }
diff -urN linux-2.6.17-rc2/drivers/atm/idt77252.c 
linux/drivers/atm/idt77252.c
--- linux-2.6.17-rc2/drivers/atm/idt77252.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/atm/idt77252.c	2006-04-24 13:53:06.000000000 +0200
@@ -3812,7 +3812,7 @@
  	return err;
  }

-static struct pci_device_id idt77252_pci_tbl[] +static struct pci_device_id idt77252_pci_tbl[] __devinitdata   {
  	{ PCI_VENDOR_ID_IDT, PCI_DEVICE_ID_IDT_IDT77252,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
diff -urN linux-2.6.17-rc2/drivers/atm/iphase.c linux/drivers/atm/iphase.c
--- linux-2.6.17-rc2/drivers/atm/iphase.c	2006-03-20 06:53:29.000000000 
+0100
+++ linux/drivers/atm/iphase.c	2006-04-24 13:53:50.000000000 +0200
@@ -3258,7 +3258,7 @@
        	kfree(iadev);
  }

-static struct pci_device_id ia_pci_tbl[] = {
+static struct pci_device_id ia_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_IPHASE, 0x0008, PCI_ANY_ID, PCI_ANY_ID, },
  	{ PCI_VENDOR_ID_IPHASE, 0x0009, PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0,}
diff -urN linux-2.6.17-rc2/drivers/atm/lanai.c linux/drivers/atm/lanai.c
--- linux-2.6.17-rc2/drivers/atm/lanai.c	2006-04-24 13:30:53.000000000 +0200
+++ linux/drivers/atm/lanai.c	2006-04-24 13:54:46.000000000 +0200
@@ -2638,7 +2638,7 @@
  	return result;
  }

-static struct pci_device_id lanai_pci_tbl[] = {
+static struct pci_device_id lanai_pci_tbl[] __devinitdata = {
  	{
  		PCI_VENDOR_ID_EF, PCI_VENDOR_ID_EF_ATM_LANAI2,
  		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
