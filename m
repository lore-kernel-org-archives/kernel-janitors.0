From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 05 Oct 2004 05:43:31 +0000
Subject: [Kernel-janitors] [PATCH] janitor: net/sunhme: pci_driver
Message-Id: <1096955011.3828.17.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70981646585071489=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70981646585071489==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Replacing pci_find_device requires converting CONFIG_PCI portion
of driver to pci_driver.  Compile tested on x86 and CONFIG_PCI.  

Need to compile/test with CONFIG_SBUS and test with CONFIG_PCI.
If anyone has access to a SPARC or QFE PCI card to test this one,
I would appreciate it.  I'm not sure how to test it otherwise -
and it needs to be tested.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

--- linux-2.6.9-rc3-orig/drivers/net/sunhme.c	2004-10-02 21:17:24.000000000 -0700
+++ linux-2.6.9-rc3/drivers/net/sunhme.c	2004-10-04 22:21:08.819343720 -0700
@@ -176,12 +176,7 @@ static __inline__ void tx_dump_ring(stru
 #define DEFAULT_JAMSIZE    4 /* Toe jam */
 
 #ifdef CONFIG_PCI
-/* This happy_pci_ids is declared __initdata because it is only used
-   as an advisory to depmod.  If this is ported to the new PCI interface
-   where it could be referenced at any time due to hot plugging,
-   the __initdata reference should be removed. */
-
-struct pci_device_id happymeal_pci_ids[] = {
+static struct pci_device_id happymeal_pci_ids[] = {
 	{
 	  .vendor	= PCI_VENDOR_ID_SUN,
 	  .device	= PCI_DEVICE_ID_SUN_HAPPYMEAL,
@@ -3307,44 +3302,70 @@ static int __init happy_meal_sbus_probe(
 #endif
 
 #ifdef CONFIG_PCI
-static int __init happy_meal_pci_probe(void)
+static int __devinit happy_meal_pci_probe(struct pci_dev *pdev,
+	const struct pci_device_id *ent)
 {
-	struct pci_dev *pdev = NULL;
-	int cards = 0;
+	int err;
 
-	while ((pdev = pci_find_device(PCI_VENDOR_ID_SUN,
-				       PCI_DEVICE_ID_SUN_HAPPYMEAL, pdev)) != NULL) {
-		if (pci_enable_device(pdev))
-			continue;
-		pci_set_master(pdev);
-		cards++;
-		happy_meal_pci_init(pdev);
+	err = pci_enable_device(pdev);
+	if (err)
+		return err;
+
+	pci_set_master(pdev);
+
+	happy_meal_pci_init(pdev);
+
+	return 0;
+}
+
+static void __devexit happy_meal_pci_remove(struct pci_dev *pdev)
+{
+	struct net_device *dev = pci_get_drvdata(pdev);
+
+	if (dev) {
+		struct happy_meal *hp = netdev_priv(dev);
+
+		unregister_netdev(dev);
+		if ((hp->happy_flags & HFLAG_PCI)) {
+			pci_free_consistent(hp->happy_dev,
+					    PAGE_SIZE,
+					    hp->happy_block,
+					    hp->hblock_dvma);
+			iounmap((void *)hp->gregs);
+			pci_release_regions(pdev);
+		}
+		free_netdev(dev);
+		pci_disable_device(pdev);
+		pci_set_drvdata(pdev, NULL);
 	}
-	return cards;
 }
+
+static struct pci_driver happy_meal_driver = {
+	.name =         DRV_NAME,
+	.id_table =     happymeal_pci_ids,
+	.probe =        happy_meal_pci_probe,
+	.remove =       __devexit_p(happy_meal_pci_remove),
+};
 #endif
 
 static int __init happy_meal_probe(void)
 {
-	static int called = 0;
+	int ret = 0;
+#ifdef CONFIG_SBUS
 	int cards;
 
 	root_happy_dev = NULL;
 
-	if (called)
-		return -ENODEV;
-	called++;
-
 	cards = 0;
-#ifdef CONFIG_SBUS
 	cards += happy_meal_sbus_probe();
+	if (!cards)
+		ret = -ENODEV;
 #endif
 #ifdef CONFIG_PCI
-	cards += happy_meal_pci_probe();
+	ret = pci_module_init(&happy_meal_driver);
 #endif
-	if (!cards)
-		return -ENODEV;
-	return 0;
+
+	return ret;
 }
 
 
@@ -3352,7 +3373,6 @@ static void __exit happy_meal_cleanup_mo
 {
 #ifdef CONFIG_SBUS
 	struct quattro *last_seen_qfe = NULL;
-#endif
 
 	while (root_happy_dev) {
 		struct happy_meal *hp = root_happy_dev;
@@ -3364,7 +3384,6 @@ static void __exit happy_meal_cleanup_mo
 		 */
 		unregister_netdev(dev);
 
-#ifdef CONFIG_SBUS
 		if (!(hp->happy_flags & HFLAG_PCI)) {
 			if (hp->happy_flags & HFLAG_QUATTRO) {
 				if (hp->qfe_parent != last_seen_qfe) {
@@ -3383,24 +3402,12 @@ static void __exit happy_meal_cleanup_mo
 					     hp->happy_block,
 					     hp->hblock_dvma);
 		}
-#endif
-#ifdef CONFIG_PCI
-		if ((hp->happy_flags & HFLAG_PCI)) {
-			pci_free_consistent(hp->happy_dev,
-					    PAGE_SIZE,
-					    hp->happy_block,
-					    hp->hblock_dvma);
-			iounmap((void *)hp->gregs);
-			pci_release_regions(hp->happy_dev);
-		}
-#endif
 		free_netdev(dev);
 
 		root_happy_dev = next;
 	}
 
 	/* Now cleanup the quattro lists. */
-#ifdef CONFIG_SBUS
 	while (qfe_sbus_list) {
 		struct quattro *qfe = qfe_sbus_list;
 		struct quattro *next = qfe->next;
@@ -3419,6 +3426,7 @@ static void __exit happy_meal_cleanup_mo
 
 		qfe_pci_list = next;
 	}
+	pci_unregister_driver(&happy_meal_driver);
 #endif
 }
 



--===============70981646585071489==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70981646585071489==--
