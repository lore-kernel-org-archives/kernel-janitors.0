From: Patrik Kullman <patrik@yes.nu>
Date: Wed, 02 Aug 2006 21:15:54 +0000
Subject: [KJ] [PATCH 4]
Message-Id: <1154553354.4286.23.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Failed to remake the previous patch properly, so sending again (with even more coding style changes).

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
+++ linux/drivers/char/watchdog/alim7101_wdt.c	2006-08-02 23:03:13.000000000 +0200
@@ -90,8 +90,7 @@
 	 */
 	char	tmp;
 
-	if(time_before(jiffies, next_heartbeat))
-	{
+	if (time_before(jiffies, next_heartbeat)) {
 		/* Ping the WDT (this is actually a disarm/arm sequence) */
 		pci_read_config_byte(alim7101_pmu, 0x92, &tmp);
 		pci_write_config_byte(alim7101_pmu, ALI_7101_WDT, (tmp & ~ALI_WDT_ARM));
@@ -174,7 +173,7 @@
 static ssize_t fop_write(struct file * file, const char __user * buf, size_t count, loff_t * ppos)
 {
 	/* See if we got the magic character 'V' and reload the timer */
-	if(count) {
+	if (count) {
 		if (!nowayout) {
 			size_t ofs;
 
@@ -200,7 +199,7 @@
 static int fop_open(struct inode * inode, struct file * file)
 {
 	/* Just in case we're already talking to someone... */
-	if(test_and_set_bit(0, &wdt_is_open))
+	if (test_and_set_bit(0, &wdt_is_open))
 		return -EBUSY;
 	/* Good, fire up the show */
 	wdt_startup();
@@ -209,7 +208,7 @@
 
 static int fop_close(struct inode * inode, struct file * file)
 {
-	if(wdt_expect_close = 42)
+	if (wdt_expect_close = 42)
 		wdt_turnoff();
 	else {
 		/* wim: shouldn't there be a: del_timer(&timer); */
@@ -231,8 +230,7 @@
 		.identity = "ALiM7101",
 	};
 
-	switch(cmd)
-	{
+	switch(cmd) {
 		case WDIOC_GETSUPPORT:
 			return copy_to_user(argp, &ident, sizeof(ident))?-EFAULT:0;
 		case WDIOC_GETSTATUS:
@@ -245,15 +243,15 @@
 		{
 			int new_options, retval = -EINVAL;
 
-			if(get_user(new_options, p))
+			if (get_user(new_options, p))
 				return -EFAULT;
 
-			if(new_options & WDIOS_DISABLECARD) {
+			if (new_options & WDIOS_DISABLECARD) {
 				wdt_turnoff();
 				retval = 0;
 			}
 
-			if(new_options & WDIOS_ENABLECARD) {
+			if (new_options & WDIOS_ENABLECARD) {
 				wdt_startup();
 				retval = 0;
 			}
@@ -264,10 +262,10 @@
 		{
 			int new_timeout;
 
-			if(get_user(new_timeout, p))
+			if (get_user(new_timeout, p))
 				return -EFAULT;
 
-			if(new_timeout < 1 || new_timeout > 3600) /* arbitrary upper limit */
+			if (new_timeout < 1 || new_timeout > 3600) /* arbitrary upper limit */
 				return -EINVAL;
 
 			timeout = new_timeout;
@@ -322,8 +320,7 @@
  *	turn the timebomb registers off.
  */
 
-static struct notifier_block wdt_notifier-{
+static struct notifier_block wdt_notifier = {
 	.notifier_call = wdt_notify_sys,
 };
 
@@ -332,6 +329,7 @@
 	wdt_turnoff();
 	/* Deregister */
 	misc_deregister(&wdt_miscdev);
+	pci_dev_put(alim7101_pmu);
 	unregister_reboot_notifier(&wdt_notifier);
 }
 
@@ -342,34 +340,33 @@
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
 
-	if(timeout < 1 || timeout > 3600) /* arbitrary upper limit */
-	{
+	if (timeout < 1 || timeout > 3600) { /* arbitrary upper limit */
 		timeout = WATCHDOG_TIMEOUT;
 		printk(KERN_INFO PFX "timeout value must be 1<=x<600, using %d\n",
 			timeout);
@@ -383,7 +380,7 @@
 	if (rc) {
 		printk(KERN_ERR PFX "cannot register miscdev on minor=%d (err=%d)\n",
 			wdt_miscdev.minor, rc);
-		goto err_out;
+		goto err_out_dev1543;
 	}
 
 	rc = register_reboot_notifier(&wdt_notifier);
@@ -397,12 +394,17 @@
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
