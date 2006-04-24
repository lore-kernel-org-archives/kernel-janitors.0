From: Henne <henne@nachtwindheim.de>
Date: Mon, 24 Apr 2006 12:35:09 +0000
Subject: [KJ] [PATCH] Marking the pci_device tables in the block-subsys as
Message-Id: <444CC5FD.7020805@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CC1F5.7050906@nachtwindheim.de>
In-Reply-To: <444CC1F5.7050906@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device tables in the block-subsys as __devinitdata.

Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/block/DAC960.c 
linux/drivers/block/DAC960.c
--- linux-2.6.17-rc2/drivers/block/DAC960.c     2006-04-24 
13:30:54.000000000 +0200
+++ linux/drivers/block/DAC960.c        2006-04-24 14:28:44.000000000 +0200
@@ -7111,7 +7111,7 @@
         .MemoryWindowSize =     DAC960_PD_RegisterWindowSize,
  };

-static struct pci_device_id DAC960_id_table[] = {
+static struct pci_device_id DAC960_id_table[] __devinitdata = {
         {
                 .vendor         = PCI_VENDOR_ID_MYLEX,
                 .device         = PCI_DEVICE_ID_MYLEX_DAC960_GEM,
diff -urN linux-2.6.17-rc2/drivers/block/sx8.c linux/drivers/block/sx8.c
--- linux-2.6.17-rc2/drivers/block/sx8.c        2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/block/sx8.c   2006-04-24 14:29:09.000000000 +0200
@@ -409,7 +409,7 @@
  static void carm_remove_one (struct pci_dev *pdev);
  static int carm_bdev_getgeo(struct block_device *bdev, struct 
hd_geometry *geo);

-static struct pci_device_id carm_pci_tbl[] = {
+static struct pci_device_id carm_pci_tbl[] __devinitdata = {
         { PCI_VENDOR_ID_PROMISE, 0x8000, PCI_ANY_ID, PCI_ANY_ID, 0, 0, },
         { PCI_VENDOR_ID_PROMISE, 0x8002, PCI_ANY_ID, PCI_ANY_ID, 0, 0, },
         { }     /* terminate list */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
