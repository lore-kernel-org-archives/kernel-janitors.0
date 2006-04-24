From: Henne <henne@nachtwindheim.de>
Date: Mon, 24 Apr 2006 15:24:35 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the pcmcia-subsys
Message-Id: <444CEDB3.10901@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the pcmcia-subsys as __devinitdata.
Signed-off-by: Henrik kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/pcmcia/i82092.c 
linux/drivers/pcmcia/i82092.c
--- linux-2.6.17-rc2/drivers/pcmcia/i82092.c	2006-04-24 
13:31:00.000000000 +0200
+++ linux/drivers/pcmcia/i82092.c	2006-04-24 17:20:26.000000000 +0200
@@ -30,7 +30,7 @@
  MODULE_LICENSE("GPL");

  /* PCI core routines */
-static struct pci_device_id i82092aa_pci_ids[] = {
+static struct pci_device_id i82092aa_pci_ids[] __devinitdata = {
  	{
  	      .vendor = PCI_VENDOR_ID_INTEL,
  	      .device = PCI_DEVICE_ID_INTEL_82092AA_0,
diff -urN linux-2.6.17-rc2/drivers/pcmcia/pd6729.c 
linux/drivers/pcmcia/pd6729.c
--- linux-2.6.17-rc2/drivers/pcmcia/pd6729.c	2006-04-24 
13:31:00.000000000 +0200
+++ linux/drivers/pcmcia/pd6729.c	2006-04-24 17:20:43.000000000 +0200
@@ -764,7 +764,7 @@
  	return pcmcia_socket_dev_resume(&dev->dev);
  }

-static struct pci_device_id pd6729_pci_ids[] = {
+static struct pci_device_id pd6729_pci_ids[] __devinitdata = {
  	{
  		.vendor		= PCI_VENDOR_ID_CIRRUS,
  		.device		= PCI_DEVICE_ID_CIRRUS_6729,
diff -urN linux-2.6.17-rc2/drivers/pcmcia/ti113x.h 
linux/drivers/pcmcia/ti113x.h
--- linux-2.6.17-rc2/drivers/pcmcia/ti113x.h	2006-04-24 
13:31:00.000000000 +0200
+++ linux/drivers/pcmcia/ti113x.h	2006-04-24 17:21:15.000000000 +0200
@@ -889,7 +889,7 @@
  		.subdevice	= _subdev,			\
  		.driver_data	= ((mask) << 8 | (bits)),	\
  	}
-static struct pci_device_id ene_tune_tbl[] = {
+static struct pci_device_id ene_tune_tbl[] __devinitdata = {
  	/* Echo Audio products based on motorola DSP56301 and DSP56361 */
  	DEVID(PCI_VENDOR_ID_MOTOROLA, 0x1801, 0xECC0, PCI_ANY_ID,
  		ENE_TEST_C9_TLTENABLE | ENE_TEST_C9_PFENABLE, ENE_TEST_C9_TLTENABLE),
diff -urN linux-2.6.17-rc2/drivers/pcmcia/yenta_socket.c 
linux/drivers/pcmcia/yenta_socket.c
--- linux-2.6.17-rc2/drivers/pcmcia/yenta_socket.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/pcmcia/yenta_socket.c	2006-04-24 17:21:53.000000000 +0200
@@ -1195,7 +1195,7 @@
  		.driver_data	= CARDBUS_TYPE_##type,	\
  	}

-static struct pci_device_id yenta_table [] = {
+static struct pci_device_id yenta_table[] __devinitdata = {
  	CB_ID(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_1031, TI),

  	/*
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
