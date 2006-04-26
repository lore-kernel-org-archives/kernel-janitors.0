From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 07:09:01 +0000
Subject: [KJ] [PATCH]  __devinitdata to block-subsys
Message-Id: <444F1C8D.4010402@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the block-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/block/cciss.c linux/drivers/block/cciss.c
--- linux-2.6.17-rc2/drivers/block/cciss.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/block/cciss.c	2006-04-26 09:05:21.000000000 +0200
@@ -63,7 +63,7 @@
  #include <linux/cciss_ioctl.h>

  /* define the PCI info for the cards we can control */
-static const struct pci_device_id cciss_pci_device_id[] = {
+static const struct pci_device_id cciss_pci_device_id[] __devinitdata = {
  	{ PCI_VENDOR_ID_COMPAQ, PCI_DEVICE_ID_COMPAQ_CISS,
  			0x0E11, 0x4070, 0, 0, 0},
  	{ PCI_VENDOR_ID_COMPAQ, PCI_DEVICE_ID_COMPAQ_CISSB,
diff -urN linux-2.6.17-rc2/drivers/block/DAC960.c linux/drivers/block/DAC960.c
--- linux-2.6.17-rc2/drivers/block/DAC960.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/block/DAC960.c	2006-04-24 14:28:44.000000000 +0200
@@ -7111,7 +7111,7 @@
  	.MemoryWindowSize =	DAC960_PD_RegisterWindowSize,
  };

-static struct pci_device_id DAC960_id_table[] = {
+static struct pci_device_id DAC960_id_table[] __devinitdata = {
  	{
  		.vendor 	= PCI_VENDOR_ID_MYLEX,
  		.device		= PCI_DEVICE_ID_MYLEX_DAC960_GEM,
diff -urN linux-2.6.17-rc2/drivers/block/sx8.c linux/drivers/block/sx8.c
--- linux-2.6.17-rc2/drivers/block/sx8.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/block/sx8.c	2006-04-24 14:29:09.000000000 +0200
@@ -409,7 +409,7 @@
  static void carm_remove_one (struct pci_dev *pdev);
  static int carm_bdev_getgeo(struct block_device *bdev, struct hd_geometry *geo);

-static struct pci_device_id carm_pci_tbl[] = {
+static struct pci_device_id carm_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_PROMISE, 0x8000, PCI_ANY_ID, PCI_ANY_ID, 0, 0, },
  	{ PCI_VENDOR_ID_PROMISE, 0x8002, PCI_ANY_ID, PCI_ANY_ID, 0, 0, },
  	{ }	/* terminate list */
diff -urN linux-2.6.17-rc2/drivers/block/umem.c linux/drivers/block/umem.c
--- linux-2.6.17-rc2/drivers/block/umem.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/block/umem.c	2006-04-26 09:06:08.000000000 +0200
@@ -1135,7 +1135,7 @@
  	blk_cleanup_queue(card->queue);
  }

-static const struct pci_device_id mm_pci_ids[] = { {
+static const struct pci_device_id mm_pci_ids[] __devinitdata = { {
  	.vendor =	PCI_VENDOR_ID_MICRO_MEMORY,
  	.device =	PCI_DEVICE_ID_MICRO_MEMORY_5415CN,
  	}, {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
