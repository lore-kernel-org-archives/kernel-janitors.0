From: Scott Feldman <sfeldma@pobox.com>
Date: Sun, 03 Oct 2004 06:19:41 +0000
Subject: [Kernel-janitors] [PATCH 3/6] janitor: net/ixgb: remove
Message-Id: <1096784380.3819.159.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78918028360598869=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78918028360598869==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Removing pci_find_device required removing driver's custom
reboot notifier which walked the device list and then called
the suspend func.  But, the suspend func isn't even hooked up
to the driver's PM ->suspend hook!  So it's vestigial (cut-
and-paste from e1000).  If ixgb ever implements PM hooks,
and there is a need to call ->suspend during shutdown, then
->shutdown can be implemented.  The need would be something
like Wake-on-LAN (10GbE?) arming.  Until then, all this code
needs to go.  Compile tested.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc3/drivers/net/ixgb/ixgb_main.c linux-2.6.9-rc3-dsf/drivers/net/ixgb/ixgb_main.c
--- linux-2.6.9-rc3/drivers/net/ixgb/ixgb_main.c	2004-10-02 21:17:24.000000000 -0700
+++ linux-2.6.9-rc3-dsf/drivers/net/ixgb/ixgb_main.c	2004-10-02 22:15:27.000000000 -0700
@@ -106,21 +106,11 @@ static void ixgb_vlan_rx_add_vid(struct 
 static void ixgb_vlan_rx_kill_vid(struct net_device *netdev, uint16_t vid);
 static void ixgb_restore_vlan(struct ixgb_adapter *adapter);
 
-static int ixgb_notify_reboot(struct notifier_block *, unsigned long event,
-			      void *ptr);
-static int ixgb_suspend(struct pci_dev *pdev, uint32_t state);
-
 #ifdef CONFIG_NET_POLL_CONTROLLER
 /* for netdump / net console */
 static void ixgb_netpoll(struct net_device *dev);
 #endif
 
-struct notifier_block ixgb_notifier_reboot = {
-	.notifier_call = ixgb_notify_reboot,
-	.next = NULL,
-	.priority = 0
-};
-
 /* Exported from other modules */
 
 extern void ixgb_check_options(struct ixgb_adapter *adapter);
@@ -131,9 +121,6 @@ static struct pci_driver ixgb_driver = {
 	.id_table = ixgb_pci_tbl,
 	.probe = ixgb_probe,
 	.remove = __devexit_p(ixgb_remove),
-	/* Power Managment Hooks */
-	.suspend = NULL,
-	.resume = NULL
 };
 
 MODULE_AUTHOR("Intel Corporation, <linux.nics@intel.com>");
@@ -155,17 +142,12 @@ MODULE_LICENSE("GPL");
 
 static int __init ixgb_init_module(void)
 {
-	int ret;
 	printk(KERN_INFO "%s - version %s\n",
 	       ixgb_driver_string, ixgb_driver_version);
 
 	printk(KERN_INFO "%s\n", ixgb_copyright);
 
-	ret = pci_module_init(&ixgb_driver);
-	if (ret >= 0) {
-		register_reboot_notifier(&ixgb_notifier_reboot);
-	}
-	return ret;
+	return pci_module_init(&ixgb_driver);
 }
 
 module_init(ixgb_init_module);
@@ -179,7 +161,6 @@ module_init(ixgb_init_module);
 
 static void __exit ixgb_exit_module(void)
 {
-	unregister_reboot_notifier(&ixgb_notifier_reboot);
 	pci_unregister_driver(&ixgb_driver);
 }
 
@@ -2079,53 +2060,6 @@ static void ixgb_restore_vlan(struct ixg
 	}
 }
 
-/**
- * ixgb_notify_reboot - handles OS notification of reboot event.
- * @param nb notifier block, unused
- * @param event Event being passed to driver to act upon
- * @param p A pointer to our net device
- **/
-static int
-ixgb_notify_reboot(struct notifier_block *nb, unsigned long event, void *p)
-{
-	struct pci_dev *pdev = NULL;
-
-	switch (event) {
-	case SYS_DOWN:
-	case SYS_HALT:
-	case SYS_POWER_OFF:
-		while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
-			if (pci_dev_driver(pdev) == &ixgb_driver)
-				ixgb_suspend(pdev, 3);
-		}
-	}
-	return NOTIFY_DONE;
-}
-
-/**
- * ixgb_suspend - driver suspend function called from notify.
- * @param pdev pci driver structure used for passing to
- * @param state power state to enter 
- **/
-static int ixgb_suspend(struct pci_dev *pdev, uint32_t state)
-{
-	struct net_device *netdev = pci_get_drvdata(pdev);
-	struct ixgb_adapter *adapter = netdev->priv;
-
-	netif_device_detach(netdev);
-
-	if (netif_running(netdev))
-		ixgb_down(adapter, TRUE);
-
-	pci_save_state(pdev, adapter->pci_state);
-
-	state = (state > 0) ? 3 : 0;
-	pci_set_power_state(pdev, state);
-	msec_delay(200);
-
-	return 0;
-}
-
 #ifdef CONFIG_NET_POLL_CONTROLLER
 /*
  * Polling 'interrupt' - used by things like netconsole to send skbs



--===============78918028360598869==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78918028360598869==--
