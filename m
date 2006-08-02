From: Kalle Lundgren <kalle@netzorz.se>
Date: Wed, 02 Aug 2006 19:38:53 +0000
Subject: [KJ] [PATCH] drivers/char/watchdog/i8xx_tco.c pci_find_device
Message-Id: <1154547533.17801.18.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Updated the driver to use pci_get_device instead of pci_find_device. 

Updated pci_dev_id struct to use PCI_DEVICE().

Altered a loop to go through all devices in the i8xx_tco_pci_tbl struct instead of matching PCI_ANY_ID to ids in structure.

Signed-off-by: Kalle Lundgren <kalle@netzorz.se>
--- linux-2.6.18-rc3/drivers/char/watchdog/i8xx_tco.c	2006-07-30 08:15:36.000000000 +0200
+++ mytree/drivers/char/watchdog/i8xx_tco.c	2006-08-02 21:28:17.000000000 +0200
@@ -406,17 +406,17 @@ static struct notifier_block i8xx_tco_no
  * want to register another driver on the same PCI id.
  */
 static struct pci_device_id i8xx_tco_pci_tbl[] = {
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801AA_0,	PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801AB_0,	PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_0,	PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_10,	PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801CA_0,	PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801CA_12,	PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801DB_0,	PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801DB_12,	PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801E_0,	PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801EB_0,	PCI_ANY_ID, PCI_ANY_ID, },
-	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ESB_1,	PCI_ANY_ID, PCI_ANY_ID, },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801AA_0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801AB_0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_10) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801CA_0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801CA_12) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801DB_0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801DB_12) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801E_0)	},
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801EB_0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ESB_1) },
 	{ 0, },			/* End of list */
 };
 MODULE_DEVICE_TABLE (pci, i8xx_tco_pci_tbl);
@@ -430,12 +430,13 @@ static unsigned char __init i8xx_tco_get
 	struct pci_dev *dev = NULL;
 	u8 val1, val2;
 	u16 badr;
+	int pci_tbl_numids = ARRAY_SIZE(i8xx_tco_pci_tbl) -1, board;
 	/*
 	 *      Find the PCI device
 	 */
-
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
-		if (pci_match_id(i8xx_tco_pci_tbl, dev)) {
+	for (board = 0 ; board < pci_tbl_numids ; board++) {
+		dev = pci_get_device(i8xx_tco_pci_tbl[board].vendor, i8xx_tco_pci_tbl[board].device, dev);
+		if(dev) {
 			i8xx_tco_pci = dev;
 			break;
 		}
@@ -454,7 +455,7 @@ static unsigned char __init i8xx_tco_get
 		/* Something's wrong here, ACPIBASE has to be set */
 		if (badr = 0x0001 || badr = 0x0000) {
 			printk (KERN_ERR PFX "failed to get TCOBASE address\n");
-			return 0;
+			goto err_out;
 		}
 
 		/* Check chipset's NO_REBOOT bit */
@@ -465,7 +466,7 @@ static unsigned char __init i8xx_tco_get
 			pci_read_config_byte (i8xx_tco_pci, 0xd4, &val1);
 			if (val1 & 0x02) {
 				printk (KERN_ERR PFX "failed to reset NO_REBOOT flag, reboot disabled by hardware\n");
-				return 0;	/* Cannot reset NO_REBOOT bit */
+				goto err_out;	/* Cannot reset NO_REBOOT bit */
 			}
 		}
 		/* Disable reboots untill the watchdog starts */
@@ -476,7 +477,7 @@ static unsigned char __init i8xx_tco_get
 		if (!request_region (SMI_EN + 1, 1, "i8xx TCO")) {
 			printk (KERN_ERR PFX "I/O address 0x%04x already in use\n",
 				SMI_EN + 1);
-			return 0;
+			goto err_out;
 		}
 		val1 = inb (SMI_EN + 1);
 		val1 &= 0xdf;
@@ -485,6 +486,10 @@ static unsigned char __init i8xx_tco_get
 		return 1;
 	}
 	return 0;
+
+err_out:
+	pci_dev_put(i8xx_tco_pci);
+	return 0;
 }
 
 static int __init watchdog_init (void)
@@ -555,6 +560,7 @@ static void __exit watchdog_cleanup (voi
 	misc_deregister (&i8xx_tco_miscdev);
 	unregister_reboot_notifier(&i8xx_tco_notifier);
 	release_region (TCOBASE, 0x10);
+	pci_dev_put(i8xx_tco_pci);
 }
 
 module_init(watchdog_init);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
