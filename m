From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 06:04:06 +0000
Subject: [KJ] [PATCH 8/18] drivers/mtd/ remove pci_find_{device, subsys}
Message-Id: <200502141122.11786.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36462078886977145=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36462078886977145==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys


AG
--
May the source be with you


Signed-off-by: Amit Gud <gud@eth.net>


diff -uprN orig/drivers/mtd/devices/pmc551.c linux-2.6.11-rc3/drivers/mtd/devices/pmc551.c
--- orig/drivers/mtd/devices/pmc551.c	2005-02-11 15:19:47.000000000 +0530
+++ linux-2.6.11-rc3/drivers/mtd/devices/pmc551.c	2005-02-14 02:34:15.000000000 +0530
@@ -680,7 +680,7 @@ static int __init init_pmc551(void)
          */
         for( count = 0; count < MAX_MTD_DEVICES; count++ ) {
 
-                if ((PCI_Device = pci_find_device(PCI_VENDOR_ID_V3_SEMI,
+                if ((PCI_Device = pci_get_device(PCI_VENDOR_ID_V3_SEMI,
                                                   PCI_DEVICE_ID_V3_SEMI_V370PDC,
 						  PCI_Device ) ) == NULL) {
                         break;
diff -uprN orig/drivers/mtd/maps/amd76xrom.c linux-2.6.11-rc3/drivers/mtd/maps/amd76xrom.c
--- orig/drivers/mtd/maps/amd76xrom.c	2005-02-11 15:19:47.000000000 +0530
+++ linux-2.6.11-rc3/drivers/mtd/maps/amd76xrom.c	2005-02-14 02:34:21.000000000 +0530
@@ -304,7 +304,7 @@ static int __init init_amd76xrom(void)
 	struct pci_device_id *id;
 	pdev = NULL;
 	for(id = amd76xrom_pci_tbl; id->vendor; id++) {
-		pdev = pci_find_device(id->vendor, id->device, NULL);
+		pdev = pci_get_device(id->vendor, id->device, NULL);
 		if (pdev) {
 			break;
 		}
diff -uprN orig/drivers/mtd/maps/ich2rom.c linux-2.6.11-rc3/drivers/mtd/maps/ich2rom.c
--- orig/drivers/mtd/maps/ich2rom.c	2004-10-19 03:25:35.000000000 +0530
+++ linux-2.6.11-rc3/drivers/mtd/maps/ich2rom.c	2005-02-14 02:34:26.000000000 +0530
@@ -288,7 +288,7 @@ int __init init_ich2rom(void)
 	struct pci_device_id *id;
 	pdev = NULL;
 	for(id = ich2rom_pci_tbl; id->vendor; id++) {
-		pdev = pci_find_device(id->vendor, id->device, NULL);
+		pdev = pci_get_device(id->vendor, id->device, NULL);
 		if (pdev) {
 			break;
 		}
diff -uprN orig/drivers/mtd/maps/ichxrom.c linux-2.6.11-rc3/drivers/mtd/maps/ichxrom.c
--- orig/drivers/mtd/maps/ichxrom.c	2005-02-11 15:19:47.000000000 +0530
+++ linux-2.6.11-rc3/drivers/mtd/maps/ichxrom.c	2005-02-14 02:34:31.000000000 +0530
@@ -356,7 +356,7 @@ static int __init init_ichxrom(void)
 
 	pdev = NULL;
 	for (id = ichxrom_pci_tbl; id->vendor; id++) {
-		pdev = pci_find_device(id->vendor, id->device, NULL);
+		pdev = pci_get_device(id->vendor, id->device, NULL);
 		if (pdev) {
 			break;
 		}
diff -uprN orig/drivers/mtd/maps/l440gx.c linux-2.6.11-rc3/drivers/mtd/maps/l440gx.c
--- orig/drivers/mtd/maps/l440gx.c	2005-02-11 15:19:47.000000000 +0530
+++ linux-2.6.11-rc3/drivers/mtd/maps/l440gx.c	2005-02-14 02:34:44.000000000 +0530
@@ -62,10 +62,10 @@ static int __init init_l440gx(void)
 	struct resource *pm_iobase;
 	__u16 word;
 
-	dev = pci_find_device(PCI_VENDOR_ID_INTEL, 
+	dev = pci_get_device(PCI_VENDOR_ID_INTEL, 
 		PCI_DEVICE_ID_INTEL_82371AB_0, NULL);
 
-	pm_dev = pci_find_device(PCI_VENDOR_ID_INTEL, 
+	pm_dev = pci_get_device(PCI_VENDOR_ID_INTEL, 
 		PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
 
 	if (!dev || !pm_dev) {
diff -uprN orig/drivers/mtd/maps/scx200_docflash.c linux-2.6.11-rc3/drivers/mtd/maps/scx200_docflash.c
--- orig/drivers/mtd/maps/scx200_docflash.c	2005-02-11 15:19:47.000000000 +0530
+++ linux-2.6.11-rc3/drivers/mtd/maps/scx200_docflash.c	2005-02-14 02:34:50.000000000 +0530
@@ -88,7 +88,7 @@ static int __init init_scx200_docflash(v
 
 	printk(KERN_DEBUG NAME ": NatSemi SCx200 DOCCS Flash Driver\n");
 
-	if ((bridge = pci_find_device(PCI_VENDOR_ID_NS, 
+	if ((bridge = pci_get_device(PCI_VENDOR_ID_NS, 
 				      PCI_DEVICE_ID_NS_SCx200_BRIDGE,
 				      NULL)) == NULL)
 		return -ENODEV;


--===============36462078886977145==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36462078886977145==--
