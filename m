From: Henne <henne@nachtwindheim.de>
Date: Thu, 29 Jun 2006 22:31:00 +0000
Subject: [KJ] [PATCH] pci_module_init() -> pci_register_driver() in
Message-Id: <44A454A4.5010802@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Conversion from pci_module_init() to pci_register_driver() in the net-drivers.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -ruN linux-2.6.17-git15/drivers/net/3c59x.c linux/drivers/net/3c59x.c
--- linux-2.6.17-git15/drivers/net/3c59x.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/3c59x.c	2006-06-30 00:15:38.000000000 +0200
@@ -38,7 +38,7 @@
       vortex_start_xmit() and vortex_interrupt which was identified
       by Bogdan Costescu.
     - Merged back support for six new cards from various sources
-    - Set vortex_have_pci if pci_module_init returns zero (fixes cardbus
+    - Set vortex_have_pci if pci_register_driver returns zero (fixes cardbus
       insertion oops)
     - Tell it that 3c905C has NWAY for 100bT autoneg
     - Fix handling of SetStatusEnd in 'Too much work..' code, as
@@ -3336,7 +3336,7 @@
 {
 	int pci_rc, eisa_rc;

-	pci_rc = pci_module_init(&vortex_driver);
+	pci_rc = pci_register_driver(&vortex_driver);
 	eisa_rc = vortex_eisa_init();

 	if (pci_rc = 0)
diff -ruN linux-2.6.17-git15/drivers/net/8139cp.c linux/drivers/net/8139cp.c
--- linux-2.6.17-git15/drivers/net/8139cp.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/8139cp.c	2006-06-30 00:14:41.000000000 +0200
@@ -2096,7 +2096,7 @@
 #ifdef MODULE
 	printk("%s", version);
 #endif
-	return pci_module_init (&cp_driver);
+	return pci_register_driver(&cp_driver);
 }

 static void __exit cp_exit (void)
diff -ruN linux-2.6.17-git15/drivers/net/8139too.c linux/drivers/net/8139too.c
--- linux-2.6.17-git15/drivers/net/8139too.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/8139too.c	2006-06-30 00:14:57.000000000 +0200
@@ -2627,7 +2627,7 @@
 	printk (KERN_INFO RTL8139_DRIVER_NAME "\n");
 #endif

-	return pci_module_init (&rtl8139_pci_driver);
+	return pci_register_driver(&rtl8139_pci_driver);
 }


diff -ruN linux-2.6.17-git15/drivers/net/acenic.c linux/drivers/net/acenic.c
--- linux-2.6.17-git15/drivers/net/acenic.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/acenic.c	2006-06-30 00:14:25.000000000 +0200
@@ -726,7 +726,7 @@

 static int __init acenic_init(void)
 {
-	return pci_module_init(&acenic_pci_driver);
+	return pci_register_driver(&acenic_pci_driver);
 }

 static void __exit acenic_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/amd8111e.c linux/drivers/net/amd8111e.c
--- linux-2.6.17-git15/drivers/net/amd8111e.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/amd8111e.c	2006-06-30 00:14:07.000000000 +0200
@@ -2159,7 +2159,7 @@

 static int __init amd8111e_init(void)
 {
-	return pci_module_init(&amd8111e_driver);
+	return pci_register_driver(&amd8111e_driver);
 }

 static void __exit amd8111e_cleanup(void)
diff -ruN linux-2.6.17-git15/drivers/net/arcnet/com20020-pci.c linux/drivers/net/arcnet/com20020-pci.c
--- linux-2.6.17-git15/drivers/net/arcnet/com20020-pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/arcnet/com20020-pci.c	2006-06-30 00:16:16.000000000 +0200
@@ -177,7 +177,7 @@
 static int __init com20020pci_init(void)
 {
 	BUGLVL(D_NORMAL) printk(VERSION);
-	return pci_module_init(&com20020pci_driver);
+	return pci_register_driver(&com20020pci_driver);
 }

 static void __exit com20020pci_cleanup(void)
diff -ruN linux-2.6.17-git15/drivers/net/b44.c linux/drivers/net/b44.c
--- linux-2.6.17-git15/drivers/net/b44.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/b44.c	2006-06-30 00:13:52.000000000 +0200
@@ -2357,7 +2357,7 @@
 	dma_desc_align_mask = ~(dma_desc_align_size - 1);
 	dma_desc_sync_size = max_t(unsigned int, dma_desc_align_size, sizeof(struct dma_desc));

-	return pci_module_init(&b44_driver);
+	return pci_register_driver(&b44_driver);
 }

 static void __exit b44_cleanup(void)
diff -ruN linux-2.6.17-git15/drivers/net/bnx2.c linux/drivers/net/bnx2.c
--- linux-2.6.17-git15/drivers/net/bnx2.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/bnx2.c	2006-06-30 00:13:37.000000000 +0200
@@ -6006,7 +6006,7 @@

 static int __init bnx2_init(void)
 {
-	return pci_module_init(&bnx2_pci_driver);
+	return pci_register_driver(&bnx2_pci_driver);
 }

 static void __exit bnx2_cleanup(void)
diff -ruN linux-2.6.17-git15/drivers/net/cassini.c linux/drivers/net/cassini.c
--- linux-2.6.17-git15/drivers/net/cassini.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/cassini.c	2006-06-30 00:13:16.000000000 +0200
@@ -5251,7 +5251,7 @@
 	else
 		link_transition_timeout = 0;

-	return pci_module_init(&cas_driver);
+	return pci_register_driver(&cas_driver);
 }

 static void __exit cas_cleanup(void)
diff -ruN linux-2.6.17-git15/drivers/net/chelsio/cxgb2.c linux/drivers/net/chelsio/cxgb2.c
--- linux-2.6.17-git15/drivers/net/chelsio/cxgb2.c	2006-06-29 23:22:02.000000000 +0200
+++ linux/drivers/net/chelsio/cxgb2.c	2006-06-30 00:16:39.000000000 +0200
@@ -1244,7 +1244,7 @@

 static int __init t1_init_module(void)
 {
-	return pci_module_init(&driver);
+	return pci_register_driver(&driver);
 }

 static void __exit t1_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/defxx.c linux/drivers/net/defxx.c
--- linux-2.6.17-git15/drivers/net/defxx.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/defxx.c	2006-06-30 00:13:00.000000000 +0200
@@ -3444,7 +3444,7 @@
 {
 	int rc_pci, rc_eisa;

-	rc_pci = pci_module_init(&dfx_driver);
+	rc_pci = pci_register_driver(&dfx_driver);
 	if (rc_pci >= 0) dfx_have_pci = 1;
 	
 	rc_eisa = dfx_eisa_init();
diff -ruN linux-2.6.17-git15/drivers/net/dl2k.c linux/drivers/net/dl2k.c
--- linux-2.6.17-git15/drivers/net/dl2k.c	2006-06-29 23:22:02.000000000 +0200
+++ linux/drivers/net/dl2k.c	2006-06-30 00:12:17.000000000 +0200
@@ -1854,7 +1854,7 @@
 static int __init
 rio_init (void)
 {
-	return pci_module_init (&rio_driver);
+	return pci_register_driver(&rio_driver);
 }

 static void __exit
diff -ruN linux-2.6.17-git15/drivers/net/e1000/e1000_main.c linux/drivers/net/e1000/e1000_main.c
--- linux-2.6.17-git15/drivers/net/e1000/e1000_main.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/e1000/e1000_main.c	2006-06-30 00:11:50.000000000 +0200
@@ -239,7 +239,7 @@

 	printk(KERN_INFO "%s\n", e1000_copyright);

-	ret = pci_module_init(&e1000_driver);
+	ret = pci_register_driver(&e1000_driver);

 	return ret;
 }
diff -ruN linux-2.6.17-git15/drivers/net/e100.c linux/drivers/net/e100.c
--- linux-2.6.17-git15/drivers/net/e100.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/e100.c	2006-06-30 00:07:54.000000000 +0200
@@ -2874,7 +2874,7 @@
 		printk(KERN_INFO PFX "%s, %s\n", DRV_DESCRIPTION, DRV_VERSION);
 		printk(KERN_INFO PFX "%s\n", DRV_COPYRIGHT);
 	}
-	return pci_module_init(&e100_driver);
+	return pci_register_driver(&e100_driver);
 }

 static void __exit e100_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/eepro100.c linux/drivers/net/eepro100.c
--- linux-2.6.17-git15/drivers/net/eepro100.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/eepro100.c	2006-06-30 00:07:38.000000000 +0200
@@ -2386,7 +2386,7 @@
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init(&eepro100_driver);
+	return pci_register_driver(&eepro100_driver);
 }

 static void __exit eepro100_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/epic100.c linux/drivers/net/epic100.c
--- linux-2.6.17-git15/drivers/net/epic100.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/epic100.c	2006-06-30 00:07:20.000000000 +0200
@@ -1656,7 +1656,7 @@
 		version, version2, version3);
 #endif

-	return pci_module_init (&epic_driver);
+	return pci_register_driver(&epic_driver);
 }


diff -ruN linux-2.6.17-git15/drivers/net/fealnx.c linux/drivers/net/fealnx.c
--- linux-2.6.17-git15/drivers/net/fealnx.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/fealnx.c	2006-06-30 00:07:05.000000000 +0200
@@ -1982,7 +1982,7 @@
 	printk(version);
 #endif

-	return pci_module_init(&fealnx_driver);
+	return pci_register_driver(&fealnx_driver);
 }

 static void __exit fealnx_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/forcedeth.c linux/drivers/net/forcedeth.c
--- linux-2.6.17-git15/drivers/net/forcedeth.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/forcedeth.c	2006-06-30 00:04:26.000000000 +0200
@@ -4513,7 +4513,7 @@
 static int __init init_nic(void)
 {
 	printk(KERN_INFO "forcedeth.c: Reverse Engineered nForce ethernet driver. Version %s.\n", FORCEDETH_VERSION);
-	return pci_module_init(&driver);
+	return pci_register_driver(&driver);
 }

 static void __exit exit_nic(void)
diff -ruN linux-2.6.17-git15/drivers/net/hp100.c linux/drivers/net/hp100.c
--- linux-2.6.17-git15/drivers/net/hp100.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/hp100.c	2006-06-30 00:04:14.000000000 +0200
@@ -3032,7 +3032,7 @@
 		goto out2;
 #endif
 #ifdef CONFIG_PCI
-	err = pci_module_init(&hp100_pci_driver);
+	err = pci_register_driver(&hp100_pci_driver);
 	if (err && err != -ENODEV)
 		goto out3;
 #endif
diff -ruN linux-2.6.17-git15/drivers/net/ixgb/ixgb_main.c linux/drivers/net/ixgb/ixgb_main.c
--- linux-2.6.17-git15/drivers/net/ixgb/ixgb_main.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/ixgb/ixgb_main.c	2006-06-30 00:26:55.000000000 +0200
@@ -162,7 +162,7 @@

 	printk(KERN_INFO "%s\n", ixgb_copyright);

-	return pci_module_init(&ixgb_driver);
+	return pci_register_driver(&ixgb_driver);
 }

 module_init(ixgb_init_module);
diff -ruN linux-2.6.17-git15/drivers/net/natsemi.c linux/drivers/net/natsemi.c
--- linux-2.6.17-git15/drivers/net/natsemi.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/natsemi.c	2006-06-30 00:03:55.000000000 +0200
@@ -3358,7 +3358,7 @@
 	printk(version);
 #endif

-	return pci_module_init (&natsemi_driver);
+	return pci_register_driver(&natsemi_driver);
 }

 static void __exit natsemi_exit_mod (void)
diff -ruN linux-2.6.17-git15/drivers/net/ne2k-pci.c linux/drivers/net/ne2k-pci.c
--- linux-2.6.17-git15/drivers/net/ne2k-pci.c	2006-06-29 23:22:02.000000000 +0200
+++ linux/drivers/net/ne2k-pci.c	2006-06-30 00:03:36.000000000 +0200
@@ -701,7 +701,7 @@
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init (&ne2k_driver);
+	return pci_register_driver(&ne2k_driver);
 }


diff -ruN linux-2.6.17-git15/drivers/net/ns83820.c linux/drivers/net/ns83820.c
--- linux-2.6.17-git15/drivers/net/ns83820.c	2006-06-29 23:22:02.000000000 +0200
+++ linux/drivers/net/ns83820.c	2006-06-30 00:03:15.000000000 +0200
@@ -2176,7 +2176,7 @@
 static int __init ns83820_init(void)
 {
 	printk(KERN_INFO "ns83820.c: National Semiconductor DP83820 10/100/1000 driver.\n");
-	return pci_module_init(&driver);
+	return pci_register_driver(&driver);
 }

 static void __exit ns83820_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/pci-skeleton.c linux/drivers/net/pci-skeleton.c
--- linux-2.6.17-git15/drivers/net/pci-skeleton.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/pci-skeleton.c	2006-06-30 00:03:00.000000000 +0200
@@ -1963,7 +1963,7 @@
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init (&netdrv_pci_driver);
+	return pci_register_driver(&netdrv_pci_driver);
 }


diff -ruN linux-2.6.17-git15/drivers/net/pcnet32.c linux/drivers/net/pcnet32.c
--- linux-2.6.17-git15/drivers/net/pcnet32.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/pcnet32.c	2006-06-30 00:02:09.000000000 +0200
@@ -2725,7 +2725,7 @@
 		tx_start = tx_start_pt;

 	/* find the PCI devices */
-	if (!pci_module_init(&pcnet32_driver))
+	if (!pci_register_driver(&pcnet32_driver))
 		pcnet32_have_pci = 1;

 	/* should we find any remaining VLbus devices ? */
diff -ruN linux-2.6.17-git15/drivers/net/r8169.c linux/drivers/net/r8169.c
--- linux-2.6.17-git15/drivers/net/r8169.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/r8169.c	2006-06-30 00:01:48.000000000 +0200
@@ -2817,7 +2817,7 @@
 static int __init
 rtl8169_init_module(void)
 {
-	return pci_module_init(&rtl8169_pci_driver);
+	return pci_register_driver(&rtl8169_pci_driver);
 }

 static void __exit
diff -ruN linux-2.6.17-git15/drivers/net/rrunner.c linux/drivers/net/rrunner.c
--- linux-2.6.17-git15/drivers/net/rrunner.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/rrunner.c	2006-06-30 00:01:33.000000000 +0200
@@ -1737,7 +1737,7 @@

 static int __init rr_init_module(void)
 {
-	return pci_module_init(&rr_driver);
+	return pci_register_driver(&rr_driver);
 }

 static void __exit rr_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/s2io.c linux/drivers/net/s2io.c
--- linux-2.6.17-git15/drivers/net/s2io.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/s2io.c	2006-06-30 00:01:17.000000000 +0200
@@ -7272,7 +7272,7 @@

 int __init s2io_starter(void)
 {
-	return pci_module_init(&s2io_driver);
+	return pci_register_driver(&s2io_driver);
 }

 /**
diff -ruN linux-2.6.17-git15/drivers/net/saa9730.c linux/drivers/net/saa9730.c
--- linux-2.6.17-git15/drivers/net/saa9730.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/saa9730.c	2006-06-30 00:00:36.000000000 +0200
@@ -1131,7 +1131,7 @@

 static int __init saa9730_init(void)
 {
-	return pci_module_init(&saa9730_driver);
+	return pci_register_driver(&saa9730_driver);
 }

 static void __exit saa9730_cleanup(void)
diff -ruN linux-2.6.17-git15/drivers/net/sis190.c linux/drivers/net/sis190.c
--- linux-2.6.17-git15/drivers/net/sis190.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/sis190.c	2006-06-29 23:59:53.000000000 +0200
@@ -1871,7 +1871,7 @@

 static int __init sis190_init_module(void)
 {
-	return pci_module_init(&sis190_pci_driver);
+	return pci_register_driver(&sis190_pci_driver);
 }

 static void __exit sis190_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/sis900.c linux/drivers/net/sis900.c
--- linux-2.6.17-git15/drivers/net/sis900.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/sis900.c	2006-06-29 23:59:38.000000000 +0200
@@ -2495,7 +2495,7 @@
 	printk(version);
 #endif

-	return pci_module_init(&sis900_pci_driver);
+	return pci_register_driver(&sis900_pci_driver);
 }

 static void __exit sis900_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/sk98lin/skge.c linux/drivers/net/sk98lin/skge.c
--- linux-2.6.17-git15/drivers/net/sk98lin/skge.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/sk98lin/skge.c	2006-06-30 00:05:50.000000000 +0200
@@ -5133,7 +5133,7 @@

 static int __init skge_init(void)
 {
-	return pci_module_init(&skge_driver);
+	return pci_register_driver(&skge_driver);
 }

 static void __exit skge_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/skfp/skfddi.c linux/drivers/net/skfp/skfddi.c
--- linux-2.6.17-git15/drivers/net/skfp/skfddi.c	2006-06-29 23:22:03.000000000 +0200
+++ linux/drivers/net/skfp/skfddi.c	2006-06-30 00:05:18.000000000 +0200
@@ -2280,7 +2280,7 @@

 static int __init skfd_init(void)
 {
-	return pci_module_init(&skfddi_pci_driver);
+	return pci_register_driver(&skfddi_pci_driver);
 }

 static void __exit skfd_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/skge.c linux/drivers/net/skge.c
--- linux-2.6.17-git15/drivers/net/skge.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/skge.c	2006-06-29 23:59:18.000000000 +0200
@@ -3512,7 +3512,7 @@

 static int __init skge_init_module(void)
 {
-	return pci_module_init(&skge_driver);
+	return pci_register_driver(&skge_driver);
 }

 static void __exit skge_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/starfire.c linux/drivers/net/starfire.c
--- linux-2.6.17-git15/drivers/net/starfire.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/starfire.c	2006-06-29 23:58:58.000000000 +0200
@@ -2171,7 +2171,7 @@
 		return -ENODEV;
 	}

-	return pci_module_init (&starfire_driver);
+	return pci_register_driver(&starfire_driver);
 }


diff -ruN linux-2.6.17-git15/drivers/net/sundance.c linux/drivers/net/sundance.c
--- linux-2.6.17-git15/drivers/net/sundance.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/sundance.c	2006-06-29 23:58:40.000000000 +0200
@@ -1814,7 +1814,7 @@
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init(&sundance_driver);
+	return pci_register_driver(&sundance_driver);
 }

 static void __exit sundance_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/sungem.c linux/drivers/net/sungem.c
--- linux-2.6.17-git15/drivers/net/sungem.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/sungem.c	2006-06-29 23:58:24.000000000 +0200
@@ -3194,7 +3194,7 @@

 static int __init gem_init(void)
 {
-	return pci_module_init(&gem_driver);
+	return pci_register_driver(&gem_driver);
 }

 static void __exit gem_cleanup(void)
diff -ruN linux-2.6.17-git15/drivers/net/sunhme.c linux/drivers/net/sunhme.c
--- linux-2.6.17-git15/drivers/net/sunhme.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/sunhme.c	2006-06-29 23:58:08.000000000 +0200
@@ -3276,7 +3276,7 @@

 static int __init happy_meal_pci_init(void)
 {
-	return pci_module_init(&hme_pci_driver);
+	return pci_register_driver(&hme_pci_driver);
 }

 static void happy_meal_pci_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/tc35815.c linux/drivers/net/tc35815.c
--- linux-2.6.17-git15/drivers/net/tc35815.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/tc35815.c	2006-06-29 23:57:50.000000000 +0200
@@ -1725,7 +1725,7 @@

 static int __init tc35815_init_module(void)
 {
-	return pci_module_init(&tc35815_driver);
+	return pci_register_driver(&tc35815_driver);
 }

 static void __exit tc35815_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/tg3.c linux/drivers/net/tg3.c
--- linux-2.6.17-git15/drivers/net/tg3.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/tg3.c	2006-06-29 23:57:35.000000000 +0200
@@ -11653,7 +11653,7 @@

 static int __init tg3_init(void)
 {
-	return pci_module_init(&tg3_driver);
+	return pci_register_driver(&tg3_driver);
 }

 static void __exit tg3_cleanup(void)
diff -ruN linux-2.6.17-git15/drivers/net/tokenring/3c359.c linux/drivers/net/tokenring/3c359.c
--- linux-2.6.17-git15/drivers/net/tokenring/3c359.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/tokenring/3c359.c	2006-06-29 23:52:20.000000000 +0200
@@ -1816,7 +1816,7 @@

 static int __init xl_pci_init (void)
 {
-	return pci_module_init (&xl_3c359_driver);
+	return pci_register_driver(&xl_3c359_driver);
 }


diff -ruN linux-2.6.17-git15/drivers/net/tokenring/lanstreamer.c linux/drivers/net/tokenring/lanstreamer.c
--- linux-2.6.17-git15/drivers/net/tokenring/lanstreamer.c	2006-06-29 23:22:03.000000000 +0200
+++ linux/drivers/net/tokenring/lanstreamer.c	2006-06-29 23:51:58.000000000 +0200
@@ -1999,7 +1999,7 @@
 };

 static int __init streamer_init_module(void) {
-  return pci_module_init(&streamer_pci_driver);
+  return pci_register_driver(&streamer_pci_driver);
 }

 static void __exit streamer_cleanup_module(void) {
diff -ruN linux-2.6.17-git15/drivers/net/tokenring/olympic.c linux/drivers/net/tokenring/olympic.c
--- linux-2.6.17-git15/drivers/net/tokenring/olympic.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/tokenring/olympic.c	2006-06-29 23:51:42.000000000 +0200
@@ -1772,7 +1772,7 @@

 static int __init olympic_pci_init(void)
 {
-	return pci_module_init (&olympic_driver) ;
+	return pci_register_driver(&olympic_driver) ;
 }

 static void __exit olympic_pci_cleanup(void)
diff -ruN linux-2.6.17-git15/drivers/net/tulip/de2104x.c linux/drivers/net/tulip/de2104x.c
--- linux-2.6.17-git15/drivers/net/tulip/de2104x.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/tulip/de2104x.c	2006-06-29 23:51:06.000000000 +0200
@@ -2173,7 +2173,7 @@
 #ifdef MODULE
 	printk("%s", version);
 #endif
-	return pci_module_init (&de_driver);
+	return pci_register_driver(&de_driver);
 }

 static void __exit de_exit (void)
diff -ruN linux-2.6.17-git15/drivers/net/tulip/de4x5.c linux/drivers/net/tulip/de4x5.c
--- linux-2.6.17-git15/drivers/net/tulip/de4x5.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/tulip/de4x5.c	2006-06-29 23:50:47.000000000 +0200
@@ -5755,7 +5755,7 @@
 	int err = 0;

 #ifdef CONFIG_PCI
-	err = pci_module_init (&de4x5_pci_driver);
+	err = pci_register_driver(&de4x5_pci_driver);
 #endif
 #ifdef CONFIG_EISA
 	err |= eisa_driver_register (&de4x5_eisa_driver);
diff -ruN linux-2.6.17-git15/drivers/net/tulip/dmfe.c linux/drivers/net/tulip/dmfe.c
--- linux-2.6.17-git15/drivers/net/tulip/dmfe.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/tulip/dmfe.c	2006-06-29 23:50:28.000000000 +0200
@@ -2039,7 +2039,7 @@
 	if (HPNA_NoiseFloor > 15)
 		HPNA_NoiseFloor = 0;

-	rc = pci_module_init(&dmfe_driver);
+	rc = pci_register_driver(&dmfe_driver);
 	if (rc < 0)
 		return rc;

diff -ruN linux-2.6.17-git15/drivers/net/tulip/tulip_core.c linux/drivers/net/tulip/tulip_core.c
--- linux-2.6.17-git15/drivers/net/tulip/tulip_core.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/tulip/tulip_core.c	2006-06-29 23:50:10.000000000 +0200
@@ -1850,7 +1850,7 @@
 	tulip_max_interrupt_work = max_interrupt_work;

 	/* probe for and init boards */
-	return pci_module_init (&tulip_driver);
+	return pci_register_driver(&tulip_driver);
 }


diff -ruN linux-2.6.17-git15/drivers/net/tulip/uli526x.c linux/drivers/net/tulip/uli526x.c
--- linux-2.6.17-git15/drivers/net/tulip/uli526x.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/tulip/uli526x.c	2006-06-29 23:49:51.000000000 +0200
@@ -1725,7 +1725,7 @@
 		break;
 	}

-	rc = pci_module_init(&uli526x_driver);
+	rc = pci_register_driver(&uli526x_driver);
 	if (rc < 0)
 		return rc;

diff -ruN linux-2.6.17-git15/drivers/net/tulip/winbond-840.c linux/drivers/net/tulip/winbond-840.c
--- linux-2.6.17-git15/drivers/net/tulip/winbond-840.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/tulip/winbond-840.c	2006-06-29 23:49:28.000000000 +0200
@@ -1692,7 +1692,7 @@
 static int __init w840_init(void)
 {
 	printk(version);
-	return pci_module_init(&w840_driver);
+	return pci_register_driver(&w840_driver);
 }

 static void __exit w840_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/tulip/xircom_tulip_cb.c linux/drivers/net/tulip/xircom_tulip_cb.c
--- linux-2.6.17-git15/drivers/net/tulip/xircom_tulip_cb.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/tulip/xircom_tulip_cb.c	2006-06-29 23:49:14.000000000 +0200
@@ -1727,7 +1727,7 @@
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init(&xircom_driver);
+	return pci_register_driver(&xircom_driver);
 }


diff -ruN linux-2.6.17-git15/drivers/net/typhoon.c linux/drivers/net/typhoon.c
--- linux-2.6.17-git15/drivers/net/typhoon.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/typhoon.c	2006-06-29 23:57:19.000000000 +0200
@@ -2660,7 +2660,7 @@
 static int __init
 typhoon_init(void)
 {
-	return pci_module_init(&typhoon_driver);
+	return pci_register_driver(&typhoon_driver);
 }

 static void __exit
diff -ruN linux-2.6.17-git15/drivers/net/via-rhine.c linux/drivers/net/via-rhine.c
--- linux-2.6.17-git15/drivers/net/via-rhine.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/via-rhine.c	2006-06-29 23:56:54.000000000 +0200
@@ -2046,7 +2046,7 @@
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init(&rhine_driver);
+	return pci_register_driver(&rhine_driver);
 }


diff -ruN linux-2.6.17-git15/drivers/net/via-velocity.c linux/drivers/net/via-velocity.c
--- linux-2.6.17-git15/drivers/net/via-velocity.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/via-velocity.c	2006-06-29 23:56:29.000000000 +0200
@@ -2254,7 +2254,7 @@
 	int ret;

 	velocity_register_notifier();
-	ret = pci_module_init(&velocity_driver);
+	ret = pci_register_driver(&velocity_driver);
 	if (ret < 0)
 		velocity_unregister_notifier();
 	return ret;
diff -ruN linux-2.6.17-git15/drivers/net/wan/dscc4.c linux/drivers/net/wan/dscc4.c
--- linux-2.6.17-git15/drivers/net/wan/dscc4.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/wan/dscc4.c	2006-06-29 23:47:46.000000000 +0200
@@ -2062,7 +2062,7 @@

 static int __init dscc4_init_module(void)
 {
-	return pci_module_init(&dscc4_driver);
+	return pci_register_driver(&dscc4_driver);
 }

 static void __exit dscc4_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/wan/farsync.c linux/drivers/net/wan/farsync.c
--- linux-2.6.17-git15/drivers/net/wan/farsync.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/wan/farsync.c	2006-06-29 23:47:29.000000000 +0200
@@ -2697,7 +2697,7 @@
 	for (i = 0; i < FST_MAX_CARDS; i++)
 		fst_card_array[i] = NULL;
 	spin_lock_init(&fst_work_q_lock);
-	return pci_module_init(&fst_driver);
+	return pci_register_driver(&fst_driver);
 }

 static void __exit
diff -ruN linux-2.6.17-git15/drivers/net/wan/lmc/lmc_main.c linux/drivers/net/wan/lmc/lmc_main.c
--- linux-2.6.17-git15/drivers/net/wan/lmc/lmc_main.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/wan/lmc/lmc_main.c	2006-06-29 23:48:17.000000000 +0200
@@ -1790,7 +1790,7 @@

 static int __init init_lmc(void)
 {
-    return pci_module_init(&lmc_driver);
+    return pci_register_driver(&lmc_driver);
 }

 static void __exit exit_lmc(void)
diff -ruN linux-2.6.17-git15/drivers/net/wan/pc300_drv.c linux/drivers/net/wan/pc300_drv.c
--- linux-2.6.17-git15/drivers/net/wan/pc300_drv.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/wan/pc300_drv.c	2006-06-29 23:47:11.000000000 +0200
@@ -3677,7 +3677,7 @@

 static int __init cpc_init(void)
 {
-	return pci_module_init(&cpc_driver);
+	return pci_register_driver(&cpc_driver);
 }

 static void __exit cpc_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/wan/pci200syn.c linux/drivers/net/wan/pci200syn.c
--- linux-2.6.17-git15/drivers/net/wan/pci200syn.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/wan/pci200syn.c	2006-06-29 23:46:49.000000000 +0200
@@ -476,7 +476,7 @@
 		printk(KERN_ERR "pci200syn: Invalid PCI clock frequency\n");
 		return -EINVAL;
 	}
-	return pci_module_init(&pci200_pci_driver);
+	return pci_register_driver(&pci200_pci_driver);
 }


diff -ruN linux-2.6.17-git15/drivers/net/wan/wanxl.c linux/drivers/net/wan/wanxl.c
--- linux-2.6.17-git15/drivers/net/wan/wanxl.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/wan/wanxl.c	2006-06-29 23:46:30.000000000 +0200
@@ -834,7 +834,7 @@
 #ifdef MODULE
 	printk(KERN_INFO "%s\n", version);
 #endif
-	return pci_module_init(&wanxl_pci_driver);
+	return pci_register_driver(&wanxl_pci_driver);
 }

 static void __exit wanxl_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/wireless/atmel_pci.c linux/drivers/net/wireless/atmel_pci.c
--- linux-2.6.17-git15/drivers/net/wireless/atmel_pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/wireless/atmel_pci.c	2006-06-29 23:44:48.000000000 +0200
@@ -77,7 +77,7 @@

 static int __init atmel_init_module(void)
 {
-	return pci_module_init(&atmel_driver);
+	return pci_register_driver(&atmel_driver);
 }

 static void __exit atmel_cleanup_module(void)
diff -ruN linux-2.6.17-git15/drivers/net/wireless/ipw2100.c linux/drivers/net/wireless/ipw2100.c
--- linux-2.6.17-git15/drivers/net/wireless/ipw2100.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/wireless/ipw2100.c	2006-06-29 23:44:08.000000000 +0200
@@ -6532,7 +6532,7 @@
 	printk(KERN_INFO DRV_NAME ": %s, %s\n", DRV_DESCRIPTION, DRV_VERSION);
 	printk(KERN_INFO DRV_NAME ": %s\n", DRV_COPYRIGHT);

-	ret = pci_module_init(&ipw2100_pci_driver);
+	ret = pci_register_driver(&ipw2100_pci_driver);

 #ifdef CONFIG_IPW2100_DEBUG
 	ipw2100_debug_level = debug;
diff -ruN linux-2.6.17-git15/drivers/net/wireless/ipw2200.c linux/drivers/net/wireless/ipw2200.c
--- linux-2.6.17-git15/drivers/net/wireless/ipw2200.c	2006-06-29 23:22:48.000000000 +0200
+++ linux/drivers/net/wireless/ipw2200.c	2006-06-29 23:44:26.000000000 +0200
@@ -11774,7 +11774,7 @@
 	printk(KERN_INFO DRV_NAME ": " DRV_DESCRIPTION ", " DRV_VERSION "\n");
 	printk(KERN_INFO DRV_NAME ": " DRV_COPYRIGHT "\n");

-	ret = pci_module_init(&ipw_driver);
+	ret = pci_register_driver(&ipw_driver);
 	if (ret) {
 		IPW_ERROR("Unable to initialize PCI module\n");
 		return ret;
diff -ruN linux-2.6.17-git15/drivers/net/wireless/orinoco_nortel.c linux/drivers/net/wireless/orinoco_nortel.c
--- linux-2.6.17-git15/drivers/net/wireless/orinoco_nortel.c	2006-06-29 23:22:49.000000000 +0200
+++ linux/drivers/net/wireless/orinoco_nortel.c	2006-06-29 23:41:22.000000000 +0200
@@ -305,7 +305,7 @@
 static int __init orinoco_nortel_init(void)
 {
 	printk(KERN_DEBUG "%s\n", version);
-	return pci_module_init(&orinoco_nortel_driver);
+	return pci_register_driver(&orinoco_nortel_driver);
 }

 static void __exit orinoco_nortel_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/wireless/orinoco_pci.c linux/drivers/net/wireless/orinoco_pci.c
--- linux-2.6.17-git15/drivers/net/wireless/orinoco_pci.c	2006-06-29 23:22:49.000000000 +0200
+++ linux/drivers/net/wireless/orinoco_pci.c	2006-06-29 23:42:23.000000000 +0200
@@ -245,7 +245,7 @@
 static int __init orinoco_pci_init(void)
 {
 	printk(KERN_DEBUG "%s\n", version);
-	return pci_module_init(&orinoco_pci_driver);
+	return pci_register_driver(&orinoco_pci_driver);
 }

 static void __exit orinoco_pci_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/wireless/orinoco_plx.c linux/drivers/net/wireless/orinoco_plx.c
--- linux-2.6.17-git15/drivers/net/wireless/orinoco_plx.c	2006-06-29 23:22:49.000000000 +0200
+++ linux/drivers/net/wireless/orinoco_plx.c	2006-06-29 23:43:20.000000000 +0200
@@ -352,7 +352,7 @@
 static int __init orinoco_plx_init(void)
 {
 	printk(KERN_DEBUG "%s\n", version);
-	return pci_module_init(&orinoco_plx_driver);
+	return pci_register_driver(e&orinoco_plx_driver);
 }

 static void __exit orinoco_plx_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/wireless/orinoco_tmd.c linux/drivers/net/wireless/orinoco_tmd.c
--- linux-2.6.17-git15/drivers/net/wireless/orinoco_tmd.c	2006-06-29 23:22:49.000000000 +0200
+++ linux/drivers/net/wireless/orinoco_tmd.c	2006-06-29 23:43:39.000000000 +0200
@@ -229,7 +229,7 @@
 static int __init orinoco_tmd_init(void)
 {
 	printk(KERN_DEBUG "%s\n", version);
-	return pci_module_init(&orinoco_tmd_driver);
+	return pci_register_driver(&orinoco_tmd_driver);
 }

 static void __exit orinoco_tmd_exit(void)
diff -ruN linux-2.6.17-git15/drivers/net/wireless/prism54/islpci_hotplug.c linux/drivers/net/wireless/prism54/islpci_hotplug.c
--- linux-2.6.17-git15/drivers/net/wireless/prism54/islpci_hotplug.c	2006-06-29 23:22:03.000000000 +0200
+++ linux/drivers/net/wireless/prism54/islpci_hotplug.c	2006-06-29 23:40:07.000000000 +0200
@@ -313,7 +313,7 @@

 	__bug_on_wrong_struct_sizes ();

-	return pci_module_init(&prism54_driver);
+	return pci_register_driver(&prism54_driver);
 }

 /* by the time prism54_module_exit() terminates, as a postcondition
diff -ruN linux-2.6.17-git15/drivers/net/yellowfin.c linux/drivers/net/yellowfin.c
--- linux-2.6.17-git15/drivers/net/yellowfin.c	2006-06-29 23:22:49.000000000 +0200
+++ linux/drivers/net/yellowfin.c	2006-06-29 23:56:07.000000000 +0200
@@ -1457,7 +1457,7 @@
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init (&yellowfin_driver);
+	return pci_register_driver(&yellowfin_driver);
 }


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
