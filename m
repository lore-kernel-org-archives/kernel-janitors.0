From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 07 Feb 2005 08:57:55 +0000
Subject: [KJ] [PATCH] drivers/atm/*: convert to pci_register_driver
Message-Id: <20050207085755.GB21028@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PEIAKu/WMn1b1Hv9"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_atm.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/atm/ambassador.c linux-2.6.11-rc3/drivers/atm/ambassador.c
--- linux-2.6.11-rc3-vanilla/drivers/atm/ambassador.c	2005-02-03 17:03:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/atm/ambassador.c	2005-02-07 09:39:27.000000000 +0100
@@ -2447,7 +2447,7 @@ static int __init amb_module_init (void)
   amb_check_args();
   
   // get the juice
-  return pci_module_init(&amb_driver);
+  return pci_register_driver(&amb_driver);
 }
 
 /********** module exit **********/
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/atm/firestream.c linux-2.6.11-rc3/drivers/atm/firestream.c
--- linux-2.6.11-rc3-vanilla/drivers/atm/firestream.c	2005-02-03 17:03:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/atm/firestream.c	2005-02-07 09:39:27.000000000 +0100
@@ -2034,7 +2034,7 @@ static int __init firestream_init_module
 	int error;
 
 	func_enter ();
-	error = pci_module_init(&firestream_driver);
+	error = pci_register_driver(&firestream_driver);
 	func_exit ();
 	return error;
 }
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/atm/he.c linux-2.6.11-rc3/drivers/atm/he.c
--- linux-2.6.11-rc3-vanilla/drivers/atm/he.c	2005-02-03 17:03:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/atm/he.c	2005-02-07 09:39:27.000000000 +0100
@@ -3079,7 +3079,7 @@ static struct pci_driver he_driver = {
 
 static int __init he_init(void)
 {
-	return pci_module_init(&he_driver);
+	return pci_register_driver(&he_driver);
 }
 
 static void __exit he_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/atm/horizon.c linux-2.6.11-rc3/drivers/atm/horizon.c
--- linux-2.6.11-rc3-vanilla/drivers/atm/horizon.c	2005-02-03 17:03:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/atm/horizon.c	2005-02-07 09:39:27.000000000 +0100
@@ -2939,7 +2939,7 @@ static int __init hrz_module_init (void)
   hrz_check_args();
   
   // get the juice
-  return pci_module_init(&hrz_driver);
+  return pci_register_driver(&hrz_driver);
 }
 
 /********** module exit **********/
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/atm/iphase.c linux-2.6.11-rc3/drivers/atm/iphase.c
--- linux-2.6.11-rc3-vanilla/drivers/atm/iphase.c	2005-02-03 17:03:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/atm/iphase.c	2005-02-07 09:39:27.000000000 +0100
@@ -3276,7 +3276,7 @@ static int __init ia_module_init(void)
 {
 	int ret;
 
-	ret = pci_module_init(&ia_driver);
+	ret = pci_register_driver(&ia_driver);
 	if (ret >= 0) {
 		ia_timer.expires = jiffies + 3*HZ;
 		add_timer(&ia_timer); 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/atm/lanai.c linux-2.6.11-rc3/drivers/atm/lanai.c
--- linux-2.6.11-rc3-vanilla/drivers/atm/lanai.c	2004-12-24 22:34:27.000000000 +0100
+++ linux-2.6.11-rc3/drivers/atm/lanai.c	2005-02-07 09:39:27.000000000 +0100
@@ -2746,7 +2746,7 @@ static int __init lanai_module_init(void
 {
 	int x;
 
-	x = pci_module_init(&lanai_driver);
+	x = pci_register_driver(&lanai_driver);
 	if (x != 0)
 		printk(KERN_ERR DEV_LABEL ": no adapter found\n");
 	return x;
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/atm/nicstar.c linux-2.6.11-rc3/drivers/atm/nicstar.c
--- linux-2.6.11-rc3-vanilla/drivers/atm/nicstar.c	2005-02-03 17:03:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/atm/nicstar.c	2005-02-07 09:39:27.000000000 +0100
@@ -381,7 +381,7 @@ static int __init nicstar_init(void)
 
    XPRINTK("nicstar: nicstar_init() called.\n");
 
-   error = pci_module_init(&nicstar_driver);
+   error = pci_register_driver(&nicstar_driver);
    
    TXPRINTK("nicstar: TX debug enabled.\n");
    RXPRINTK("nicstar: RX debug enabled.\n");
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/atm/zatm.c linux-2.6.11-rc3/drivers/atm/zatm.c
--- linux-2.6.11-rc3-vanilla/drivers/atm/zatm.c	2005-02-03 17:03:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/atm/zatm.c	2005-02-07 09:39:27.000000000 +0100
@@ -1648,7 +1648,7 @@ static struct pci_driver zatm_driver = {
 
 static int __init zatm_init_module(void)
 {
-	return pci_module_init(&zatm_driver);
+	return pci_register_driver(&zatm_driver);
 }
 
 module_init(zatm_init_module);

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--PEIAKu/WMn1b1Hv9--
