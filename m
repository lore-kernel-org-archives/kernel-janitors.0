From: Scott Feldman <sfeldma@pobox.com>
Date: Sun, 03 Oct 2004 06:19:14 +0000
Subject: [Kernel-janitors] [PATCH 1/6] janitor: net/e1000: remove
Message-Id: <1096784354.3819.150.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99556864748003471=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99556864748003471==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Removing pci_find_device required removing driver's custom
reboot notifier which walked the device list and replace it
with standard driver ->shutdown method.  Compiled and tested.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc3/drivers/net/e1000/e1000_main.c linux-2.6.9-rc3-dsf/drivers/net/e1000/e1000_main.c
--- linux-2.6.9-rc3/drivers/net/e1000/e1000_main.c	2004-10-02 21:17:24.000000000 -0700
+++ linux-2.6.9-rc3-dsf/drivers/net/e1000/e1000_main.c	2004-10-02 00:52:32.000000000 -0700
@@ -160,7 +160,7 @@ static void e1000_vlan_rx_add_vid(struct
 static void e1000_vlan_rx_kill_vid(struct net_device *netdev, uint16_t vid);
 static void e1000_restore_vlan(struct e1000_adapter *adapter);
 
-static int e1000_notify_reboot(struct notifier_block *, unsigned long event, void *ptr);
+static void e1000_shutdown(struct device *dev);
 static int e1000_suspend(struct pci_dev *pdev, uint32_t state);
 #ifdef CONFIG_PM
 static int e1000_resume(struct pci_dev *pdev);
@@ -171,12 +171,6 @@ static int e1000_resume(struct pci_dev *
 static void e1000_netpoll (struct net_device *netdev);
 #endif
 
-struct notifier_block e1000_notifier_reboot = {
-	.notifier_call	= e1000_notify_reboot,
-	.next		= NULL,
-	.priority	= 0
-};
-
 /* Exported from other modules */
 
 extern void e1000_check_options(struct e1000_adapter *adapter);
@@ -189,8 +183,11 @@ static struct pci_driver e1000_driver = 
 	/* Power Managment Hooks */
 #ifdef CONFIG_PM
 	.suspend  = e1000_suspend,
-	.resume   = e1000_resume
+	.resume   = e1000_resume,
 #endif
+	.driver   = {
+		.shutdown  = e1000_shutdown,
+	}
 };
 
 MODULE_AUTHOR("Intel Corporation, <linux.nics@intel.com>");
@@ -211,17 +208,12 @@ MODULE_PARM_DESC(debug, "Debug level (0=
 static int __init
 e1000_init_module(void)
 {
-	int ret;
 	printk(KERN_INFO "%s - version %s\n",
 	       e1000_driver_string, e1000_driver_version);
 
 	printk(KERN_INFO "%s\n", e1000_copyright);
 
-	ret = pci_module_init(&e1000_driver);
-	if(ret >= 0) {
-		register_reboot_notifier(&e1000_notifier_reboot);
-	}
-	return ret;
+	return pci_module_init(&e1000_driver);
 }
 
 module_init(e1000_init_module);
@@ -236,7 +228,6 @@ module_init(e1000_init_module);
 static void __exit
 e1000_exit_module(void)
 {
-	unregister_reboot_notifier(&e1000_notifier_reboot);
 	pci_unregister_driver(&e1000_driver);
 }
 
@@ -2792,21 +2783,12 @@ e1000_set_spd_dplx(struct e1000_adapter 
 	return 0;
 }
 
-static int
-e1000_notify_reboot(struct notifier_block *nb, unsigned long event, void *p)
+static
+void e1000_shutdown(struct device *dev)
 {
-	struct pci_dev *pdev = NULL;
+	struct pci_dev *pdev = container_of(dev, struct pci_dev, dev);
 
-	switch(event) {
-	case SYS_DOWN:
-	case SYS_HALT:
-	case SYS_POWER_OFF:
-		while((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
-			if(pci_dev_driver(pdev) == &e1000_driver)
-				e1000_suspend(pdev, 3);
-		}
-	}
-	return NOTIFY_DONE;
+	e1000_suspend(pdev, 3);
 }
 
 static int



--===============99556864748003471==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99556864748003471==--
