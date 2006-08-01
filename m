From: Patrik Kullman <patrik@yes.nu>
Date: Tue, 01 Aug 2006 07:09:46 +0000
Subject: [KJ] [PATCH 2] drivers/char/watchdog/alim*.c:
Message-Id: <20060801070946.GB20012@texi.yes.nu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Remade the patch as instructed by Domen Puncer and Henne.

Although I don't know which way would be the best way for erroring out..

1. The current form with different gotos depending on what needs to be reversed (I saw other drivers doing it this way, most effective?)

2. Same goto (err_out) for all errors, depending on pci_dev_put()'s "if (dev)" to check if the device = NULL

3. Same goto (err_out) for all errors, with "if (dev) { pci_dev_put(dev); }" (Maybe more fault tolerant?)

However I'm sure you will tell me! ;)


Signed-off-by: Patrik Kullman <patrik@yes.nu>
--- linux-2.6.17/drivers/char/watchdog/alim1535_wdt.c	2006-06-18 03:49:35.000000000 +0200
+++ linux/drivers/char/watchdog/alim1535_wdt.c	2006-08-01 07:25:21.000000000 +0200
@@ -312,7 +312,7 @@
  */
 
 static struct pci_device_id ali_pci_tbl[] = {
-	{ PCI_VENDOR_ID_AL, 0x1535, PCI_ANY_ID, PCI_ANY_ID,},
+	{PCI_DEVICE(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1535)},
 	{ 0, },
 };
 MODULE_DEVICE_TABLE(pci, ali_pci_tbl);
@@ -330,17 +330,19 @@
 	u32 wdog;
 
 	/* Check for a 1535 series bridge */
-	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x1535, NULL);
-	if(pdev = NULL)
+	pdev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1535, NULL);
+	if(!pdev)
 		return -ENODEV;
 
 	/* Check for the a 7101 PMU */
-	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x7101, NULL);
-	if(pdev = NULL)
+	pdev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101, NULL);
+	if(!pdev)
 		return -ENODEV;
 
-	if(pci_enable_device(pdev))
+	if(pci_enable_device(pdev)) {
+		pci_dev_put(pdev);
 		return -EIO;
+	}
 
 	ali_pci = pdev;
 
@@ -447,6 +449,7 @@
 	/* Deregister */
 	unregister_reboot_notifier(&ali_notifier);
 	misc_deregister(&ali_miscdev);
+	pci_dev_put(ali_pci);
 }
 
 module_init(watchdog_init);
--- linux-2.6.17/drivers/char/watchdog/alim7101_wdt.c	2006-06-18 03:49:35.000000000 +0200
+++ linux/drivers/char/watchdog/alim7101_wdt.c	2006-07-31 22:20:19.000000000 +0200
@@ -332,6 +332,7 @@
 	wdt_turnoff();
 	/* Deregister */
 	misc_deregister(&wdt_miscdev);
+	pci_dev_put(alim7101_pmu);
 	unregister_reboot_notifier(&wdt_notifier);
 }
 
@@ -342,30 +343,30 @@
 	char tmp;
 
 	printk(KERN_INFO PFX "Steve Hill <steve@navaho.co.uk>.\n");
-	alim7101_pmu = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101,NULL);
+	alim7101_pmu = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101,NULL);
 	if (!alim7101_pmu) {
 		printk(KERN_INFO PFX "ALi M7101 PMU not present - WDT not set\n");
-		return -EBUSY;
+		goto err_out;
 	}
 
 	/* Set the WDT in the PMU to 1 second */
 	pci_write_config_byte(alim7101_pmu, ALI_7101_WDT, 0x02);
 
-	ali1543_south = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, NULL);
+	ali1543_south = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, NULL);
 	if (!ali1543_south) {
 		printk(KERN_INFO PFX "ALi 1543 South-Bridge not present - WDT not set\n");
-		return -EBUSY;
+		goto err_out_dev7101;
 	}
 	pci_read_config_byte(ali1543_south, 0x5e, &tmp);
 	if ((tmp & 0x1e) = 0x00) {
 		if (!use_gpio) {
 			printk(KERN_INFO PFX "Detected old alim7101 revision 'a1d'.  If this is a cobalt board, set the 'use_gpio' module parameter.\n");
-			return -EBUSY;
+			goto err_out_dev1543;
 		} 
 		nowayout = 1;
 	} else if ((tmp & 0x1e) != 0x12 && (tmp & 0x1e) != 0x00) {
 		printk(KERN_INFO PFX "ALi 1543 South-Bridge does not have the correct revision number (???1001?) - WDT not set\n");
-		return -EBUSY;
+		goto err_out_dev1543;
 	}
 
 	if(timeout < 1 || timeout > 3600) /* arbitrary upper limit */
@@ -383,7 +384,7 @@
 	if (rc) {
 		printk(KERN_ERR PFX "cannot register miscdev on minor=%d (err=%d)\n",
 			wdt_miscdev.minor, rc);
-		goto err_out;
+		goto err_out_dev1543;
 	}
 
 	rc = register_reboot_notifier(&wdt_notifier);
@@ -397,12 +398,17 @@
 		__module_get(THIS_MODULE);
 	}
 
+	pci_dev_put(ali1543_south);
 	printk(KERN_INFO PFX "WDT driver for ALi M7101 initialised. timeout=%d sec (nowayout=%d)\n",
 		timeout, nowayout);
 	return 0;
 
 err_out_miscdev:
 	misc_deregister(&wdt_miscdev);
+err_out_dev1543:
+	pci_dev_put(ali1543_south);
+err_out_dev7101:
+	pci_dev_put(alim7101_pmu);
 err_out:
 	return rc;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
