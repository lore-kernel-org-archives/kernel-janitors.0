From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 06:47:42 +0000
Subject: [KJ] [PATCH 18/18] arch/ remove pci_find_{device, subsys}
Message-Id: <200502141205.46515.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5536693985986576=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5536693985986576==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/arch/alpha/kernel/sys_alcor.c linux-2.6.11-rc3/arch/alpha/kernel/sys_alcor.c
--- orig/arch/alpha/kernel/sys_alcor.c	2005-01-20 20:06:07.000000000 +0530
+++ linux-2.6.11-rc3/arch/alpha/kernel/sys_alcor.c	2005-02-14 00:02:35.000000000 +0530
@@ -254,7 +254,7 @@ alcor_init_pci(void)
 	 * motherboard, by looking for a 21040 TULIP in slot 6, which is
 	 * built into XLT and BRET/MAVERICK, but not available on ALCOR.
 	 */
-	dev = pci_find_device(PCI_VENDOR_ID_DEC,
+	dev = pci_get_device(PCI_VENDOR_ID_DEC,
 			      PCI_DEVICE_ID_DEC_TULIP,
 			      NULL);
 	if (dev && dev->devfn == PCI_DEVFN(6,0)) {
diff -uprN orig/arch/alpha/kernel/sys_sio.c linux-2.6.11-rc3/arch/alpha/kernel/sys_sio.c
--- orig/arch/alpha/kernel/sys_sio.c	2004-10-19 03:23:06.000000000 +0530
+++ linux-2.6.11-rc3/arch/alpha/kernel/sys_sio.c	2005-02-14 00:13:59.000000000 +0530
@@ -105,7 +105,7 @@ sio_collect_irq_levels(void)
 	struct pci_dev *dev = NULL;
 
 	/* Iterate through the devices, collecting IRQ levels.  */
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		if ((dev->class >> 16 == PCI_BASE_CLASS_BRIDGE) &&
 		    (dev->class >> 8 != PCI_CLASS_BRIDGE_PCMCIA))
 			continue;
@@ -229,7 +229,7 @@ alphabook1_init_pci(void)
 	 */
 
 	dev = NULL;
-	while ((dev = pci_find_device(PCI_VENDOR_ID_NCR, PCI_ANY_ID, dev))) {
+	while ((dev = pci_get_device(PCI_VENDOR_ID_NCR, PCI_ANY_ID, dev))) {
                 if (dev->device == PCI_DEVICE_ID_NCR_53C810
 		    || dev->device == PCI_DEVICE_ID_NCR_53C815
 		    || dev->device == PCI_DEVICE_ID_NCR_53C820
diff -uprN orig/arch/frv/mb93090-mb00/pci-frv.c linux-2.6.11-rc3/arch/frv/mb93090-mb00/pci-frv.c
--- orig/arch/frv/mb93090-mb00/pci-frv.c	2005-02-11 15:19:34.000000000 +0530
+++ linux-2.6.11-rc3/arch/frv/mb93090-mb00/pci-frv.c	2005-02-14 00:18:13.000000000 +0530
@@ -142,7 +142,7 @@ static void __init pcibios_allocate_reso
 	u16 command;
 	struct resource *r, *pr;
 
-	while (dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev),
+	while (dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev),
 	       dev != NULL
 	       ) {
 		pci_read_config_word(dev, PCI_COMMAND, &command);
@@ -188,7 +188,7 @@ static void __init pcibios_assign_resour
 	int idx;
 	struct resource *r;
 
-	while (dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev),
+	while (dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev),
 	       dev != NULL
 	       ) {
 		int class = dev->class >> 8;
diff -uprN orig/arch/frv/mb93090-mb00/pci-irq.c linux-2.6.11-rc3/arch/frv/mb93090-mb00/pci-irq.c
--- orig/arch/frv/mb93090-mb00/pci-irq.c	2005-02-11 15:19:34.000000000 +0530
+++ linux-2.6.11-rc3/arch/frv/mb93090-mb00/pci-irq.c	2005-02-14 00:21:00.000000000 +0530
@@ -48,7 +48,7 @@ void __init pcibios_fixup_irqs(void)
 	struct pci_dev *dev = NULL;
 	uint8_t line, pin;
 
-	while (dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev),
+	while (dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev),
 	       dev != NULL
 	       ) {
 		pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
diff -uprN orig/arch/ia64/sn/kernel/io_init.c linux-2.6.11-rc3/arch/ia64/sn/kernel/io_init.c
--- orig/arch/ia64/sn/kernel/io_init.c	2005-02-11 15:19:35.000000000 +0530
+++ linux-2.6.11-rc3/arch/ia64/sn/kernel/io_init.c	2005-02-14 00:22:15.000000000 +0530
@@ -365,7 +365,7 @@ static int __init sn_pci_init(void)
 	 */
 
 	while ((pci_dev =
-		pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
+		pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
 		sn_pci_fixup_slot(pci_dev);
 	}
 
diff -uprN orig/arch/ppc/kernel/pci.c linux-2.6.11-rc3/arch/ppc/kernel/pci.c
--- orig/arch/ppc/kernel/pci.c	2005-02-11 15:19:37.000000000 +0530
+++ linux-2.6.11-rc3/arch/ppc/kernel/pci.c	2005-02-14 00:24:17.000000000 +0530
@@ -503,7 +503,7 @@ pcibios_allocate_resources(int pass)
 	u16 command;
 	struct resource *r;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		pci_read_config_word(dev, PCI_COMMAND, &command);
 		for (idx = 0; idx < 6; idx++) {
 			r = &dev->resource[idx];
@@ -540,7 +540,7 @@ pcibios_assign_resources(void)
 	int idx;
 	struct resource *r;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		int class = dev->class >> 8;
 
 		/* Don't touch classless devices and host bridges */
@@ -866,7 +866,7 @@ pci_device_from_OF_node(struct device_no
 	 */
 	if (!pci_to_OF_bus_map)
 		return 0;
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		if (pci_to_OF_bus_map[dev->bus->number] != *bus)
 			continue;
 		if (dev->devfn != *devfn)
diff -uprN orig/arch/ppc/platforms/chestnut.c linux-2.6.11-rc3/arch/ppc/platforms/chestnut.c
--- orig/arch/ppc/platforms/chestnut.c	2005-02-11 15:19:37.000000000 +0530
+++ linux-2.6.11-rc3/arch/ppc/platforms/chestnut.c	2005-02-14 00:57:06.000000000 +0530
@@ -486,7 +486,7 @@ set_pci_command_invalidate(void)
 	struct pci_dev *dev = NULL;
 	u16 val;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		pci_read_config_word(dev, PCI_COMMAND, &val);
 		val |= PCI_COMMAND_INVALIDATE;
 		pci_write_config_word(dev, PCI_COMMAND, val);
diff -uprN orig/arch/sparc64/kernel/ebus.c linux-2.6.11-rc3/arch/sparc64/kernel/ebus.c
--- orig/arch/sparc64/kernel/ebus.c	2004-10-19 03:23:46.000000000 +0530
+++ linux-2.6.11-rc3/arch/sparc64/kernel/ebus.c	2005-02-14 00:57:43.000000000 +0530
@@ -528,7 +528,7 @@ static struct pci_dev *find_next_ebus(st
 	struct pci_dev *pdev = start;
 
 	do {
-		pdev = pci_find_device(PCI_VENDOR_ID_SUN, PCI_ANY_ID, pdev);
+		pdev = pci_get_device(PCI_VENDOR_ID_SUN, PCI_ANY_ID, pdev);
 		if (pdev &&
 		    (pdev->device == PCI_DEVICE_ID_SUN_EBUS ||
 		     pdev->device == PCI_DEVICE_ID_SUN_RIO_EBUS))


--===============5536693985986576==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5536693985986576==--
