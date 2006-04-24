From: Henne <henne@nachtwindheim.de>
Date: Mon, 24 Apr 2006 16:28:29 +0000
Subject: [KJ] [PATCH] Cleanup of portdrv_pci.c
Message-Id: <444CFCAD.8020002@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id table of portdrv_pci.c as __devinitdata and
making save/resore_config() dependend tp CONFIG_PM
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

--- linux-2.6.17-rc2/drivers/pci/pcie/portdrv_pci.c	2006-04-24 
13:31:00.000000000 +0200
+++ linux_test/drivers/pci/pcie/portdrv_pci.c	2006-04-24 
18:20:29.000000000 +0200
@@ -30,6 +30,7 @@
  /* global data */
  static const char device_name[] = "pcieport-driver";

+#ifdef CONFIG_PM
  static int pcie_portdrv_save_config(struct pci_dev *dev)
  {
  	return pci_save_state(dev);
@@ -46,7 +47,7 @@
  	pci_set_master(dev);
  	return 0;
  }
-
+#endif /* CONFIG_PM */
  /*
   * pcie_portdrv_probe - Probe PCI-Express port devices
   * @dev: PCI-Express port device being probed
@@ -105,7 +106,7 @@
  /*
   * LINUX Device Driver Model
   */
-static const struct pci_device_id port_pci_ids[] = { {
+static const struct pci_device_id port_pci_ids[] __devinitdata= { {
  	/* handle any PCI-Express port */
  	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0),
  	}, { /* end: all zeroes */ }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
