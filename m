From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 05:54:48 +0000
Subject: [KJ] [PATCH 4/18] drivers/ide/ remove pci_find_{device, subsys}
Message-Id: <200502141112.50114.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5189750843463381=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5189750843463381==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys


AG
--
May the source be with you


Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/drivers/ide/pci/alim15x3.c linux-2.6.11-rc3/drivers/ide/pci/alim15x3.c
--- orig/drivers/ide/pci/alim15x3.c	2005-02-11 15:19:43.000000000 +0530
+++ linux-2.6.11-rc3/drivers/ide/pci/alim15x3.c	2005-02-14 05:16:10.000000000 +0530
@@ -591,7 +591,7 @@ static unsigned int __init init_chipset_
 
 	pci_read_config_byte(dev, PCI_REVISION_ID, &m5229_revision);
 
-	isa_dev = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, NULL);
+	isa_dev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, NULL);
 
 #if defined(DISPLAY_ALI_TIMINGS) && defined(CONFIG_PROC_FS)
 	if (!ali_proc) {
@@ -878,7 +878,7 @@ static int __devinit alim15x3_init_one(s
 {
 	ide_pci_device_t *d = &ali15x3_chipset;
 
-	if(pci_find_device(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RS100, NULL))
+	if(pci_get_device(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RS100, NULL))
 		printk(KERN_ERR "Warning: ATI Radeon IGP Northbridge is not yet fully tested.\n");
 
 #if defined(CONFIG_SPARC64)
diff -uprN orig/drivers/ide/pci/cs5530.c linux-2.6.11-rc3/drivers/ide/pci/cs5530.c
--- orig/drivers/ide/pci/cs5530.c	2005-02-11 15:19:43.000000000 +0530
+++ linux-2.6.11-rc3/drivers/ide/pci/cs5530.c	2005-02-14 05:16:21.000000000 +0530
@@ -223,7 +223,7 @@ static unsigned int __init init_chipset_
 	unsigned long flags;
 
 	dev = NULL;
-	while ((dev = pci_find_device(PCI_VENDOR_ID_CYRIX, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_VENDOR_ID_CYRIX, PCI_ANY_ID, dev)) != NULL) {
 		switch (dev->device) {
 			case PCI_DEVICE_ID_CYRIX_PCI_MASTER:
 				master_0 = dev;
diff -uprN orig/drivers/ide/pci/hpt366.c linux-2.6.11-rc3/drivers/ide/pci/hpt366.c
--- orig/drivers/ide/pci/hpt366.c	2005-02-11 15:19:44.000000000 +0530
+++ linux-2.6.11-rc3/drivers/ide/pci/hpt366.c	2005-02-14 05:16:34.000000000 +0530
@@ -1198,7 +1198,7 @@ static int __devinit init_setup_hpt374(s
 	if (PCI_FUNC(dev->devfn) & 1)
 		return -ENODEV;
 
-	while ((findev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, findev)) != NULL) {
+	while ((findev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, findev)) != NULL) {
 		if ((findev->vendor == dev->vendor) &&
 		    (findev->device == dev->device) &&
 		    ((findev->devfn - dev->devfn) == 1) &&
@@ -1254,7 +1254,7 @@ static int __devinit init_setup_hpt366(s
 	d->channels = 1;
 
 	pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin1);
-	while ((findev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, findev)) != NULL) {
+	while ((findev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, findev)) != NULL) {
 		if ((findev->vendor == dev->vendor) &&
 		    (findev->device == dev->device) &&
 		    ((findev->devfn - dev->devfn) == 1) &&
diff -uprN orig/drivers/ide/pci/pdc202xx_new.c linux-2.6.11-rc3/drivers/ide/pci/pdc202xx_new.c
--- orig/drivers/ide/pci/pdc202xx_new.c	2005-02-11 15:19:44.000000000 +0530
+++ linux-2.6.11-rc3/drivers/ide/pci/pdc202xx_new.c	2005-02-14 05:16:40.000000000 +0530
@@ -332,7 +332,7 @@ static int __devinit init_setup_pdc20270
 		if (PCI_SLOT(dev->devfn) & 2)
 			return -ENODEV;
 		d->extra = 0;
-		while ((findev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, findev)) != NULL) {
+		while ((findev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, findev)) != NULL) {
 			if ((findev->vendor == dev->vendor) &&
 			    (findev->device == dev->device) &&
 			    (PCI_SLOT(findev->devfn) & 2)) {
diff -uprN orig/drivers/ide/pci/piix.c linux-2.6.11-rc3/drivers/ide/pci/piix.c
--- orig/drivers/ide/pci/piix.c	2005-02-11 15:19:44.000000000 +0530
+++ linux-2.6.11-rc3/drivers/ide/pci/piix.c	2005-02-14 05:16:45.000000000 +0530
@@ -572,7 +572,7 @@ static void __devinit piix_check_450nx(v
 	struct pci_dev *pdev = NULL;
 	u16 cfg;
 	u8 rev;
-	while((pdev=pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82454NX, pdev))!=NULL)
+	while((pdev=pci_get_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82454NX, pdev))!=NULL)
 	{
 		/* Look for 450NX PXB. Check for problem configurations
 		   A PCI quirk checks bit 6 already */
diff -uprN orig/drivers/ide/pci/serverworks.c linux-2.6.11-rc3/drivers/ide/pci/serverworks.c
--- orig/drivers/ide/pci/serverworks.c	2005-02-11 15:19:44.000000000 +0530
+++ linux-2.6.11-rc3/drivers/ide/pci/serverworks.c	2005-02-14 05:17:02.000000000 +0530
@@ -343,7 +343,7 @@ static unsigned int __init init_chipset_
 
 	/* OSB4 : South Bridge and IDE */
 	if (dev->device == PCI_DEVICE_ID_SERVERWORKS_OSB4IDE) {
-		isa_dev = pci_find_device(PCI_VENDOR_ID_SERVERWORKS,
+		isa_dev = pci_get_device(PCI_VENDOR_ID_SERVERWORKS,
 			  PCI_DEVICE_ID_SERVERWORKS_OSB4, NULL);
 		if (isa_dev) {
 			pci_read_config_dword(isa_dev, 0x64, &reg);
@@ -364,7 +364,7 @@ static unsigned int __init init_chipset_
 		if (!(PCI_FUNC(dev->devfn) & 1)) {
 			struct pci_dev * findev = NULL;
 			u32 reg4c = 0;
-			findev = pci_find_device(PCI_VENDOR_ID_SERVERWORKS,
+			findev = pci_get_device(PCI_VENDOR_ID_SERVERWORKS,
 				PCI_DEVICE_ID_SERVERWORKS_CSB5, NULL);
 			if (findev) {
 				pci_read_config_dword(findev, 0x4C, &reg4c);
@@ -389,7 +389,7 @@ static unsigned int __init init_chipset_
 			struct pci_dev * findev = NULL;
 			u8 reg41 = 0;
 
-			findev = pci_find_device(PCI_VENDOR_ID_SERVERWORKS,
+			findev = pci_get_device(PCI_VENDOR_ID_SERVERWORKS,
 					PCI_DEVICE_ID_SERVERWORKS_CSB6, NULL);
 			if (findev) {
 				pci_read_config_byte(findev, 0x41, &reg41);
diff -uprN orig/drivers/ide/pci/sis5513.c linux-2.6.11-rc3/drivers/ide/pci/sis5513.c
--- orig/drivers/ide/pci/sis5513.c	2005-02-11 15:19:44.000000000 +0530
+++ linux-2.6.11-rc3/drivers/ide/pci/sis5513.c	2005-02-14 05:17:08.000000000 +0530
@@ -735,7 +735,7 @@ static unsigned int __init init_chipset_
 
 	for (i = 0; i < ARRAY_SIZE(SiSHostChipInfo) && !chipset_family; i++) {
 
-		host = pci_find_device(PCI_VENDOR_ID_SI, SiSHostChipInfo[i].host_id, NULL);
+		host = pci_get_device(PCI_VENDOR_ID_SI, SiSHostChipInfo[i].host_id, NULL);
 
 		if (!host)
 			continue;
diff -uprN orig/drivers/ide/pci/via82cxxx.c linux-2.6.11-rc3/drivers/ide/pci/via82cxxx.c
--- orig/drivers/ide/pci/via82cxxx.c	2005-02-11 15:19:44.000000000 +0530
+++ linux-2.6.11-rc3/drivers/ide/pci/via82cxxx.c	2005-02-14 05:17:14.000000000 +0530
@@ -430,7 +430,7 @@ static unsigned int __init init_chipset_
 	 */
 
 	for (via_config = via_isa_bridges; via_config->id; via_config++)
-		if ((isa = pci_find_device(PCI_VENDOR_ID_VIA +
+		if ((isa = pci_get_device(PCI_VENDOR_ID_VIA +
 			!!(via_config->flags & VIA_BAD_ID),
 			via_config->id, NULL))) {
 
diff -uprN orig/drivers/ide/setup-pci.c linux-2.6.11-rc3/drivers/ide/setup-pci.c
--- orig/drivers/ide/setup-pci.c	2005-02-11 15:19:44.000000000 +0530
+++ linux-2.6.11-rc3/drivers/ide/setup-pci.c	2005-02-14 05:17:20.000000000 +0530
@@ -878,7 +878,7 @@ void __init ide_scan_pcibus (int scan_di
 
 	pre_init = 0;
 	if (!scan_direction) {
-		while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+		while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 			ide_scan_pcidev(dev);
 		}
 	} else {


--===============5189750843463381==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5189750843463381==--
