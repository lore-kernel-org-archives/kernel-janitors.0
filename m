From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 13:01:59 +0000
Subject: [KJ] [PATCH] drivers/net/tulip/*: convert to pci_register_driver
Message-Id: <20050213130159.GH15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="oOpJzULQ70+PGW7h"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--oOpJzULQ70+PGW7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>


--oOpJzULQ70+PGW7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net_tulip.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tulip/de2104x.c linux-2.6.11-rc3/drivers/net/tulip/de2104x.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tulip/de2104x.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tulip/de2104x.c	2005-02-07 09:39:29.000000000 +0100
@@ -2175,7 +2175,7 @@ static int __init de_init (void)
 #ifdef MODULE
 	printk("%s", version);
 #endif
-	return pci_module_init (&de_driver);
+	return pci_register_driver (&de_driver);
 }
 
 static void __exit de_exit (void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tulip/de4x5.c linux-2.6.11-rc3/drivers/net/tulip/de4x5.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tulip/de4x5.c	2004-12-24 22:33:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tulip/de4x5.c	2005-02-07 09:39:29.000000000 +0100
@@ -5754,7 +5754,7 @@ static int __init de4x5_module_init (voi
 	int err = 0;
 
 #ifdef CONFIG_PCI
-	err = pci_module_init (&de4x5_pci_driver);
+	err = pci_register_driver(&de4x5_pci_driver);
 #endif
 #ifdef CONFIG_EISA
 	err |= eisa_driver_register (&de4x5_eisa_driver);
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tulip/dmfe.c linux-2.6.11-rc3/drivers/net/tulip/dmfe.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tulip/dmfe.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tulip/dmfe.c	2005-02-07 09:39:29.000000000 +0100
@@ -2042,7 +2042,7 @@ static int __init dmfe_init_module(void)
 	if (HPNA_NoiseFloor > 15)
 		HPNA_NoiseFloor = 0;
 
-	rc = pci_module_init(&dmfe_driver);
+	rc = pci_register_driver(&dmfe_driver);
 	if (rc < 0)
 		return rc;
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tulip/tulip_core.c linux-2.6.11-rc3/drivers/net/tulip/tulip_core.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tulip/tulip_core.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tulip/tulip_core.c	2005-02-07 09:39:29.000000000 +0100
@@ -1844,7 +1844,7 @@ static int __init tulip_init (void)
 	tulip_max_interrupt_work = max_interrupt_work;
 
 	/* probe for and init boards */
-	return pci_module_init (&tulip_driver);
+	return pci_register_driver (&tulip_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tulip/winbond-840.c linux-2.6.11-rc3/drivers/net/tulip/winbond-840.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tulip/winbond-840.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tulip/winbond-840.c	2005-02-07 09:39:29.000000000 +0100
@@ -1704,7 +1704,7 @@ static struct pci_driver w840_driver = {
 static int __init w840_init(void)
 {
 	printk(version);
-	return pci_module_init(&w840_driver);
+	return pci_register_driver(&w840_driver);
 }
 
 static void __exit w840_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tulip/xircom_tulip_cb.c linux-2.6.11-rc3/drivers/net/tulip/xircom_tulip_cb.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tulip/xircom_tulip_cb.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tulip/xircom_tulip_cb.c	2005-02-07 09:39:29.000000000 +0100
@@ -1727,7 +1727,7 @@ static int __init xircom_init(void)
 #ifdef MODULE
 	printk(version);
 #endif
-	return pci_module_init(&xircom_driver);
+	return pci_register_driver(&xircom_driver);
 }
 
 

--oOpJzULQ70+PGW7h
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--oOpJzULQ70+PGW7h--
