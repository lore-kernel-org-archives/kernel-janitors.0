From: Patrik Kullman <patrik@yes.nu>
Date: Wed, 02 Aug 2006 20:01:29 +0000
Subject: [KJ] [PATCH 3]
Message-Id: <1154548889.4286.13.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remade the patch as instructed by Tobias Klauser.

Also added spaces to other ifs in the module.


Signed-off-by: Patrik Kullman <patrik@yes.nu>
--- linux-2.6.18-rc3/drivers/char/watchdog/alim1535_wdt.c	2006-08-01 14:12:20.000000000 +0200
+++ linux/drivers/char/watchdog/alim1535_wdt.c	2006-08-02 21:48:22.000000000 +0200
@@ -103,13 +103,13 @@
 
 static int ali_settimer(int t)
 {
-	if(t < 0)
+	if (t < 0)
 		return -EINVAL;
-	else if(t < 60)
+	else if (t < 60)
 		ali_timeout_bits = t|(1<<6);
-	else if(t < 3600)
+	else if (t < 3600)
 		ali_timeout_bits = (t/60)|(1<<7);
-	else if(t < 18000)
+	else if (t < 18000)
 		ali_timeout_bits = (t/300)|(1<<6)|(1<<7);
 	else return -EINVAL;
 
@@ -148,7 +148,7 @@
 			/* scan to see whether or not we got the magic character */
 			for (i = 0; i != len; i++) {
 				char c;
-				if(get_user(c, data+i))
+				if (get_user(c, data+i))
 					return -EFAULT;
 				if (c = 'V')
 					ali_expect_release = 42;
@@ -312,7 +312,7 @@
  */
 
 static struct pci_device_id ali_pci_tbl[] = {
-	{ PCI_VENDOR_ID_AL, 0x1535, PCI_ANY_ID, PCI_ANY_ID,},
+	{ PCI_DEVICE(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1535) },
 	{ 0, },
 };
 MODULE_DEVICE_TABLE(pci, ali_pci_tbl);
@@ -330,17 +330,19 @@
 	u32 wdog;
 
 	/* Check for a 1535 series bridge */
-	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x1535, NULL);
-	if(pdev = NULL)
+	pdev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1535, NULL);
+	if (!pdev)
 		return -ENODEV;
 
 	/* Check for the a 7101 PMU */
-	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x7101, NULL);
-	if(pdev = NULL)
+	pdev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101, NULL);
+	if (!pdev)
 		return -ENODEV;
 
-	if(pci_enable_device(pdev))
+	if (pci_enable_device(pdev)) {
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
--- linux-2.6.18-rc3/drivers/char/watchdog/alim7101_wdt.c	2006-08-01 14:12:20.000000000 +0200
+++ linux/drivers/char/watchdog/alim7101_wdt.c	2006-08-01 14:00:24.000000000 +0200
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
