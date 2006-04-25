From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 07:09:41 +0000
Subject: [KJ] [PATCH] cleanup of PCIE-portbus driver
Message-Id: <444DCB35.1060208@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id table of portdrv_pci.c as __devinitdata and
making save/resore_config() dependend to CONFIG_PM
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

--- linux-2.6.17-rc2/drivers/pci/pcie/portdrv_pci.c	2006-04-24 
13:31:00.000000000 +0200
+++ linux/drivers/pci/pcie/portdrv_pci.c	2006-04-25 09:04:42.000000000 +0200
@@ -30,23 +30,6 @@
  /* global data */
  static const char device_name[] = "pcieport-driver";

-static int pcie_portdrv_save_config(struct pci_dev *dev)
-{
-	return pci_save_state(dev);
-}
-
-static int pcie_portdrv_restore_config(struct pci_dev *dev)
-{
-	int retval;
-
-	pci_restore_state(dev);
-	retval = pci_enable_device(dev);
-	if (retval)
-		return retval;
-	pci_set_master(dev);
-	return 0;
-}
-
  /*
   * pcie_portdrv_probe - Probe PCI-Express port devices
   * @dev: PCI-Express port device being probed
@@ -86,6 +69,23 @@
  }

  #ifdef CONFIG_PM
+static int pcie_portdrv_save_config(struct pci_dev *dev)
+{
+	return pci_save_state(dev);
+}
+
+static int pcie_portdrv_restore_config(struct pci_dev *dev)
+{
+	int retval;
+
+	pci_restore_state(dev);
+	retval = pci_enable_device(dev);
+	if (retval)
+		return retval;
+	pci_set_master(dev);
+	return 0;
+}
+
  static int pcie_portdrv_suspend (struct pci_dev *dev, pm_message_t state)
  {
  	int ret = pcie_port_device_suspend(dev, state);
@@ -105,7 +105,7 @@
  /*
   * LINUX Device Driver Model
   */
-static const struct pci_device_id port_pci_ids[] = { {
+static const struct pci_device_id port_pci_ids[] __devinitdata = { {
  	/* handle any PCI-Express port */
  	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0),
  	}, { /* end: all zeroes */ }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
