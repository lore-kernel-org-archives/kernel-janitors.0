From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 13:08:31 +0000
Subject: [KJ] [PATCH] drivers/net/wireless/*: convert to pci_register_driver
Message-Id: <20050213130831.GK15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vvRocJ6whMXXNc9q"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--vvRocJ6whMXXNc9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>


--vvRocJ6whMXXNc9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net_wireless.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wireless/atmel_pci.c linux-2.6.11-rc3/drivers/net/wireless/atmel_pci.c
--- linux-2.6.11-rc3-vanilla/drivers/net/wireless/atmel_pci.c	2004-12-24 22:35:23.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/wireless/atmel_pci.c	2005-02-07 09:39:29.000000000 +0100
@@ -79,7 +79,7 @@ static void __devexit atmel_pci_remove(s
 
 static int __init atmel_init_module(void)
 {
-	return pci_module_init(&atmel_driver);
+	return pci_register_driver(&atmel_driver);
 }
 
 static void __exit atmel_cleanup_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wireless/orinoco_pci.c linux-2.6.11-rc3/drivers/net/wireless/orinoco_pci.c
--- linux-2.6.11-rc3-vanilla/drivers/net/wireless/orinoco_pci.c	2004-12-24 22:35:14.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/wireless/orinoco_pci.c	2005-02-07 09:39:29.000000000 +0100
@@ -393,7 +393,7 @@ MODULE_LICENSE("Dual MPL/GPL");
 static int __init orinoco_pci_init(void)
 {
 	printk(KERN_DEBUG "%s\n", version);
-	return pci_module_init(&orinoco_pci_driver);
+	return pci_register_driver(&orinoco_pci_driver);
 }
 
 static void __exit orinoco_pci_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wireless/orinoco_plx.c linux-2.6.11-rc3/drivers/net/wireless/orinoco_plx.c
--- linux-2.6.11-rc3-vanilla/drivers/net/wireless/orinoco_plx.c	2004-12-24 22:35:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/wireless/orinoco_plx.c	2005-02-07 09:39:29.000000000 +0100
@@ -346,7 +346,7 @@ MODULE_LICENSE("Dual MPL/GPL");
 static int __init orinoco_plx_init(void)
 {
 	printk(KERN_DEBUG "%s\n", version);
-	return pci_module_init(&orinoco_plx_driver);
+	return pci_register_driver(&orinoco_plx_driver);
 }
 
 static void __exit orinoco_plx_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wireless/orinoco_tmd.c linux-2.6.11-rc3/drivers/net/wireless/orinoco_tmd.c
--- linux-2.6.11-rc3-vanilla/drivers/net/wireless/orinoco_tmd.c	2004-12-24 22:34:01.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/wireless/orinoco_tmd.c	2005-02-07 09:39:29.000000000 +0100
@@ -212,7 +212,7 @@ MODULE_LICENSE("Dual MPL/GPL");
 static int __init orinoco_tmd_init(void)
 {
 	printk(KERN_DEBUG "%s\n", version);
-	return pci_module_init(&orinoco_tmd_driver);
+	return pci_register_driver(&orinoco_tmd_driver);
 }
 
 static void __exit orinoco_tmd_exit(void)

--vvRocJ6whMXXNc9q
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--vvRocJ6whMXXNc9q--
