From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 12:45:49 +0000
Subject: [KJ] [PATCH] drivers/net/*: convert to pci_register_driver
Message-Id: <20050213124549.GA15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="TYecfFk8j8mZq+dy"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/3c59x.c linux-2.6.11-rc3/drivers/net/3c59x.c
--- linux-2.6.11-rc3-vanilla/drivers/net/3c59x.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/3c59x.c	2005-02-07 09:39:28.000000000 +0100
@@ -3308,7 +3308,7 @@ static int __init vortex_init (void)
 {
 	int pci_rc, eisa_rc;
 
-	pci_rc = pci_module_init(&vortex_driver);
+	pci_rc = pci_register_driver(&vortex_driver);
 	eisa_rc = vortex_eisa_init();
 
 	if (pci_rc == 0)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/8139cp.c linux-2.6.11-rc3/drivers/net/8139cp.c
--- linux-2.6.11-rc3-vanilla/drivers/net/8139cp.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/8139cp.c	2005-02-07 09:39:28.000000000 +0100
@@ -1892,7 +1892,7 @@ static int __init cp_init (void)
 #ifdef MODULE
 	printk("%s", version);
 #endif
-	return pci_module_init (&cp_driver);
+	return pci_register_driver (&cp_driver);
 }
 
 static void __exit cp_exit (void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/8139too.c linux-2.6.11-rc3/drivers/net/8139too.c
--- linux-2.6.11-rc3-vanilla/drivers/net/8139too.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/8139too.c	2005-02-07 09:39:28.000000000 +0100
@@ -2651,7 +2651,7 @@ static int __init rtl8139_init_module (v
 	printk (KERN_INFO RTL8139_DRIVER_NAME "\n");
 #endif
 
-	return pci_module_init (&rtl8139_pci_driver);
+	return pci_register_driver (&rtl8139_pci_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/acenic.c linux-2.6.11-rc3/drivers/net/acenic.c
--- linux-2.6.11-rc3-vanilla/drivers/net/acenic.c	2004-12-24 22:34:44.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/acenic.c	2005-02-07 09:39:28.000000000 +0100
@@ -729,7 +729,7 @@ static struct pci_driver acenic_pci_driv
 
 static int __init acenic_init(void)
 {
-	return pci_module_init(&acenic_pci_driver);
+	return pci_register_driver(&acenic_pci_driver);
 }
 
 static void __exit acenic_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/amd8111e.c linux-2.6.11-rc3/drivers/net/amd8111e.c
--- linux-2.6.11-rc3-vanilla/drivers/net/amd8111e.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/amd8111e.c	2005-02-07 09:39:28.000000000 +0100
@@ -2152,7 +2152,7 @@ static struct pci_driver amd8111e_driver
 
 static int __init amd8111e_init(void)
 {
-	return pci_module_init(&amd8111e_driver);
+	return pci_register_driver(&amd8111e_driver);
 }
 
 static void __exit amd8111e_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/b44.c linux-2.6.11-rc3/drivers/net/b44.c
--- linux-2.6.11-rc3-vanilla/drivers/net/b44.c	2004-12-24 22:34:32.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/b44.c	2005-02-07 09:39:28.000000000 +0100
@@ -1959,7 +1959,7 @@ static struct pci_driver b44_driver = {
 
 static int __init b44_init(void)
 {
-	return pci_module_init(&b44_driver);
+	return pci_register_driver(&b44_driver);
 }
 
 static void __exit b44_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/defxx.c linux-2.6.11-rc3/drivers/net/defxx.c
--- linux-2.6.11-rc3-vanilla/drivers/net/defxx.c	2004-12-24 22:33:47.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/defxx.c	2005-02-07 09:39:28.000000000 +0100
@@ -3430,7 +3430,7 @@ static int __init dfx_init(void)
 {
 	int rc_pci, rc_eisa;
 
-	rc_pci = pci_module_init(&dfx_driver);
+	rc_pci = pci_register_driver(&dfx_driver);
 	if (rc_pci >= 0) dfx_have_pci = 1;
 	
 	rc_eisa = dfx_eisa_init();
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/dl2k.c linux-2.6.11-rc3/drivers/net/dl2k.c
--- linux-2.6.11-rc3-vanilla/drivers/net/dl2k.c	2005-02-03 17:03:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/dl2k.c	2005-02-07 09:39:28.000000000 +0100
@@ -1848,7 +1848,7 @@ static struct pci_driver rio_driver = {
 static int __init
 rio_init (void)
 {
-	return pci_module_init (&rio_driver);
+	return pci_register_driver (&rio_driver);
 }
 
 static void __exit
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/e100.c linux-2.6.11-rc3/drivers/net/e100.c
--- linux-2.6.11-rc3-vanilla/drivers/net/e100.c	2005-02-03 17:03:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/e100.c	2005-02-07 09:39:28.000000000 +0100
@@ -2362,7 +2362,7 @@ static int __init e100_init_module(void)
 		printk(KERN_INFO PFX "%s, %s\n", DRV_DESCRIPTION, DRV_VERSION);
 		printk(KERN_INFO PFX "%s\n", DRV_COPYRIGHT);
 	}
-	return pci_module_init(&e100_driver);
+	return pci_register_driver(&e100_driver);
 }
 
 static void __exit e100_cleanup_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/eepro100.c linux-2.6.11-rc3/drivers/net/eepro100.c
--- linux-2.6.11-rc3-vanilla/drivers/net/eepro100.c	2005-02-03 17:03:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/eepro100.c	2005-02-07 09:39:28.000000000 +0100
@@ -2406,7 +2406,7 @@ static int __init eepro100_init_module(v
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init(&eepro100_driver);
+	return pci_register_driver(&eepro100_driver);
 }
 
 static void __exit eepro100_cleanup_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/epic100.c linux-2.6.11-rc3/drivers/net/epic100.c
--- linux-2.6.11-rc3-vanilla/drivers/net/epic100.c	2005-02-03 17:03:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/epic100.c	2005-02-07 09:39:28.000000000 +0100
@@ -1673,7 +1673,7 @@ static int __init epic_init (void)
 		version, version2, version3);
 #endif
 
-	return pci_module_init (&epic_driver);
+	return pci_register_driver (&epic_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/fealnx.c linux-2.6.11-rc3/drivers/net/fealnx.c
--- linux-2.6.11-rc3-vanilla/drivers/net/fealnx.c	2005-02-03 17:03:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/fealnx.c	2005-02-07 09:39:28.000000000 +0100
@@ -2010,7 +2010,7 @@ static int __init fealnx_init(void)
 	printk(version);
 #endif
 
-	return pci_module_init(&fealnx_driver);
+	return pci_register_driver(&fealnx_driver);
 }
 
 static void __exit fealnx_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/forcedeth.c linux-2.6.11-rc3/drivers/net/forcedeth.c
--- linux-2.6.11-rc3-vanilla/drivers/net/forcedeth.c	2005-02-03 17:03:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/forcedeth.c	2005-02-07 09:39:28.000000000 +0100
@@ -2211,7 +2211,7 @@ static struct pci_driver driver = {
 static int __init init_nic(void)
 {
 	printk(KERN_INFO "forcedeth.c: Reverse Engineered nForce ethernet driver. Version %s.\n", FORCEDETH_VERSION);
-	return pci_module_init(&driver);
+	return pci_register_driver(&driver);
 }
 
 static void __exit exit_nic(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/hp100.c linux-2.6.11-rc3/drivers/net/hp100.c
--- linux-2.6.11-rc3-vanilla/drivers/net/hp100.c	2005-02-03 17:03:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/hp100.c	2005-02-07 09:39:28.000000000 +0100
@@ -3075,7 +3075,7 @@ static int __init hp100_module_init(void
 		goto out2;
 #endif
 #ifdef CONFIG_PCI
-	err = pci_module_init(&hp100_pci_driver);
+	err = pci_register_driver(&hp100_pci_driver);
 	if (err && err != -ENODEV) 
 		goto out3;
 #endif
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/ioc3-eth.c linux-2.6.11-rc3/drivers/net/ioc3-eth.c
--- linux-2.6.11-rc3-vanilla/drivers/net/ioc3-eth.c	2004-12-24 22:33:51.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/ioc3-eth.c	2005-02-07 09:39:28.000000000 +0100
@@ -1299,7 +1299,7 @@ static struct pci_driver ioc3_driver = {
 
 static int __init ioc3_init_module(void)
 {
-	return pci_module_init(&ioc3_driver);
+	return pci_register_driver(&ioc3_driver);
 }
 
 static void __exit ioc3_cleanup_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/natsemi.c linux-2.6.11-rc3/drivers/net/natsemi.c
--- linux-2.6.11-rc3-vanilla/drivers/net/natsemi.c	2005-02-03 17:03:50.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/natsemi.c	2005-02-07 09:39:28.000000000 +0100
@@ -3258,7 +3258,7 @@ static int __init natsemi_init_mod (void
 	printk(version);
 #endif
 
-	return pci_module_init (&natsemi_driver);
+	return pci_register_driver (&natsemi_driver);
 }
 
 static void __exit natsemi_exit_mod (void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/ne2k-pci.c linux-2.6.11-rc3/drivers/net/ne2k-pci.c
--- linux-2.6.11-rc3-vanilla/drivers/net/ne2k-pci.c	2005-02-03 17:03:50.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/ne2k-pci.c	2005-02-07 09:39:28.000000000 +0100
@@ -699,7 +699,7 @@ static int __init ne2k_pci_init(void)
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init (&ne2k_driver);
+	return pci_register_driver (&ne2k_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/ns83820.c linux-2.6.11-rc3/drivers/net/ns83820.c
--- linux-2.6.11-rc3-vanilla/drivers/net/ns83820.c	2004-12-24 22:35:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/ns83820.c	2005-02-07 09:39:28.000000000 +0100
@@ -2196,7 +2196,7 @@ static struct pci_driver driver = {
 static int __init ns83820_init(void)
 {
 	printk(KERN_INFO "ns83820.c: National Semiconductor DP83820 10/100/1000 driver.\n");
-	return pci_module_init(&driver);
+	return pci_register_driver(&driver);
 }
 
 static void __exit ns83820_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/pci-skeleton.c linux-2.6.11-rc3/drivers/net/pci-skeleton.c
--- linux-2.6.11-rc3-vanilla/drivers/net/pci-skeleton.c	2005-02-03 17:03:51.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/pci-skeleton.c	2005-02-07 09:39:28.000000000 +0100
@@ -1963,7 +1963,7 @@ static int __init netdrv_init_module (vo
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init (&netdrv_pci_driver);
+	return pci_register_driver (&netdrv_pci_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/pcnet32.c linux-2.6.11-rc3/drivers/net/pcnet32.c
--- linux-2.6.11-rc3-vanilla/drivers/net/pcnet32.c	2004-12-24 22:34:29.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/pcnet32.c	2005-02-07 09:39:28.000000000 +0100
@@ -2304,7 +2304,7 @@ static int __init pcnet32_init_module(vo
 	tx_start = tx_start_pt;
 
     /* find the PCI devices */
-    if (!pci_module_init(&pcnet32_driver))
+    if (!pci_register_driver(&pcnet32_driver))
 	pcnet32_have_pci = 1;
 
     /* should we find any remaining VLbus devices ? */
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/r8169.c linux-2.6.11-rc3/drivers/net/r8169.c
--- linux-2.6.11-rc3-vanilla/drivers/net/r8169.c	2005-02-03 17:03:51.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/r8169.c	2005-02-07 09:39:28.000000000 +0100
@@ -2449,7 +2449,7 @@ static struct pci_driver rtl8169_pci_dri
 static int __init
 rtl8169_init_module(void)
 {
-	return pci_module_init(&rtl8169_pci_driver);
+	return pci_register_driver(&rtl8169_pci_driver);
 }
 
 static void __exit
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/rrunner.c linux-2.6.11-rc3/drivers/net/rrunner.c
--- linux-2.6.11-rc3-vanilla/drivers/net/rrunner.c	2004-12-24 22:34:26.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/rrunner.c	2005-02-07 09:39:28.000000000 +0100
@@ -1738,7 +1738,7 @@ static struct pci_driver rr_driver = {
 
 static int __init rr_init_module(void)
 {
-	return pci_module_init(&rr_driver);
+	return pci_register_driver(&rr_driver);
 }
 
 static void __exit rr_cleanup_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/s2io.c linux-2.6.11-rc3/drivers/net/s2io.c
--- linux-2.6.11-rc3-vanilla/drivers/net/s2io.c	2005-02-03 17:03:51.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/s2io.c	2005-02-07 09:39:28.000000000 +0100
@@ -4965,7 +4965,7 @@ static void __devexit s2io_rem_nic(struc
 
 int __init s2io_starter(void)
 {
-	return pci_module_init(&s2io_driver);
+	return pci_register_driver(&s2io_driver);
 }
 
 /**
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/saa9730.c linux-2.6.11-rc3/drivers/net/saa9730.c
--- linux-2.6.11-rc3-vanilla/drivers/net/saa9730.c	2004-12-24 22:34:58.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/saa9730.c	2005-02-07 09:39:28.000000000 +0100
@@ -1168,7 +1168,7 @@ static struct pci_driver saa9730_driver 
 
 static int __init saa9730_init(void)
 {
-        return pci_module_init(&saa9730_driver);
+        return pci_register_driver(&saa9730_driver);
 }
 
 static void __exit saa9730_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/sis900.c linux-2.6.11-rc3/drivers/net/sis900.c
--- linux-2.6.11-rc3-vanilla/drivers/net/sis900.c	2005-02-03 17:03:51.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/sis900.c	2005-02-07 09:39:28.000000000 +0100
@@ -2299,7 +2299,7 @@ static int __init sis900_init_module(voi
 	printk(version);
 #endif
 
-	return pci_module_init(&sis900_pci_driver);
+	return pci_register_driver(&sis900_pci_driver);
 }
 
 static void __exit sis900_cleanup_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/starfire.c linux-2.6.11-rc3/drivers/net/starfire.c
--- linux-2.6.11-rc3-vanilla/drivers/net/starfire.c	2005-02-03 17:03:51.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/starfire.c	2005-02-07 09:39:28.000000000 +0100
@@ -2196,7 +2196,7 @@ static int __init starfire_init (void)
 	/* unconditionally disable hw cksums if firmware is not present */
 	enable_hw_cksum = 0;
 #endif /* not HAS_FIRMWARE */
-	return pci_module_init (&starfire_driver);
+	return pci_register_driver (&starfire_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/sundance.c linux-2.6.11-rc3/drivers/net/sundance.c
--- linux-2.6.11-rc3-vanilla/drivers/net/sundance.c	2005-02-03 17:03:51.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/sundance.c	2005-02-07 09:39:28.000000000 +0100
@@ -1770,7 +1770,7 @@ static int __init sundance_init(void)
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init(&sundance_driver);
+	return pci_register_driver(&sundance_driver);
 }
 
 static void __exit sundance_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/sungem.c linux-2.6.11-rc3/drivers/net/sungem.c
--- linux-2.6.11-rc3-vanilla/drivers/net/sungem.c	2004-12-24 22:35:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/sungem.c	2005-02-07 09:39:28.000000000 +0100
@@ -3062,7 +3062,7 @@ static struct pci_driver gem_driver = {
 
 static int __init gem_init(void)
 {
-	return pci_module_init(&gem_driver);
+	return pci_register_driver(&gem_driver);
 }
 
 static void __exit gem_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tc35815.c linux-2.6.11-rc3/drivers/net/tc35815.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tc35815.c	2004-12-24 22:33:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tc35815.c	2005-02-07 09:39:28.000000000 +0100
@@ -1725,7 +1725,7 @@ static struct pci_driver tc35815_driver 
 
 static int __init tc35815_init_module(void)
 {
-	return pci_module_init(&tc35815_driver);
+	return pci_register_driver(&tc35815_driver);
 }
 
 static void __exit tc35815_cleanup_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tg3.c linux-2.6.11-rc3/drivers/net/tg3.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tg3.c	2005-02-03 17:03:51.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tg3.c	2005-02-07 09:39:28.000000000 +0100
@@ -9011,7 +9011,7 @@ static struct pci_driver tg3_driver = {
 
 static int __init tg3_init(void)
 {
-	return pci_module_init(&tg3_driver);
+	return pci_register_driver(&tg3_driver);
 }
 
 static void __exit tg3_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/typhoon.c linux-2.6.11-rc3/drivers/net/typhoon.c
--- linux-2.6.11-rc3-vanilla/drivers/net/typhoon.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/typhoon.c	2005-02-07 09:39:29.000000000 +0100
@@ -2580,7 +2580,7 @@ static struct pci_driver typhoon_driver 
 static int __init
 typhoon_init(void)
 {
-	return pci_module_init(&typhoon_driver);
+	return pci_register_driver(&typhoon_driver);
 }
 
 static void __exit
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/via-rhine.c linux-2.6.11-rc3/drivers/net/via-rhine.c
--- linux-2.6.11-rc3-vanilla/drivers/net/via-rhine.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/via-rhine.c	2005-02-07 09:39:29.000000000 +0100
@@ -2016,7 +2016,7 @@ static int __init rhine_init(void)
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init(&rhine_driver);
+	return pci_register_driver(&rhine_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/via-velocity.c linux-2.6.11-rc3/drivers/net/via-velocity.c
--- linux-2.6.11-rc3-vanilla/drivers/net/via-velocity.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/via-velocity.c	2005-02-07 09:39:29.000000000 +0100
@@ -2244,7 +2244,7 @@ static int __init velocity_init_module(v
 	int ret;
 
 	velocity_register_notifier();
-	ret = pci_module_init(&velocity_driver);
+	ret = pci_register_driver(&velocity_driver);
 	if (ret < 0)
 		velocity_unregister_notifier();
 	return ret;
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/yellowfin.c linux-2.6.11-rc3/drivers/net/yellowfin.c
--- linux-2.6.11-rc3-vanilla/drivers/net/yellowfin.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/yellowfin.c	2005-02-07 09:39:29.000000000 +0100
@@ -1474,7 +1474,7 @@ static int __init yellowfin_init (void)
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init (&yellowfin_driver);
+	return pci_register_driver (&yellowfin_driver);
 }
 
 

--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--TYecfFk8j8mZq+dy--
