From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 15:10:45 +0000
Subject: [KJ] drivers/mtd/maps/*: convert to pci_register_driver
Message-Id: <20050208151045.GQ31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ceuyUbi+oA5bUa/n"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-mtd@lists.infradead.org


--ceuyUbi+oA5bUa/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--ceuyUbi+oA5bUa/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_mtd_maps.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/mtd/maps/amd76xrom.c linux-2.6.11-rc3/drivers/mtd/maps/amd76xrom.c
--- linux-2.6.11-rc3-vanilla/drivers/mtd/maps/amd76xrom.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/mtd/maps/amd76xrom.c	2005-02-07 09:39:28.000000000 +0100
@@ -314,7 +314,7 @@ static int __init init_amd76xrom(void)
 	}
 	return -ENXIO;
 #if 0
-	return pci_module_init(&amd76xrom_driver);
+	return pci_register_driver(&amd76xrom_driver);
 #endif
 }
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/mtd/maps/ich2rom.c linux-2.6.11-rc3/drivers/mtd/maps/ich2rom.c
--- linux-2.6.11-rc3-vanilla/drivers/mtd/maps/ich2rom.c	2004-12-24 22:35:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/mtd/maps/ich2rom.c	2005-02-07 09:39:28.000000000 +0100
@@ -299,7 +299,7 @@ int __init init_ich2rom(void)
 	}
 	return -ENXIO;
 #if 0
-	return pci_module_init(&ich2rom_driver);
+	return pci_register_driver(&ich2rom_driver);
 #endif
 }
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/mtd/maps/ichxrom.c linux-2.6.11-rc3/drivers/mtd/maps/ichxrom.c
--- linux-2.6.11-rc3-vanilla/drivers/mtd/maps/ichxrom.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/mtd/maps/ichxrom.c	2005-02-07 09:39:28.000000000 +0100
@@ -366,7 +366,7 @@ static int __init init_ichxrom(void)
 	}
 	return -ENXIO;
 #if 0
-	return pci_module_init(&ichxrom_driver);
+	return pci_register_driver(&ichxrom_driver);
 #endif
 }
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/mtd/maps/pci.c linux-2.6.11-rc3/drivers/mtd/maps/pci.c
--- linux-2.6.11-rc3-vanilla/drivers/mtd/maps/pci.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/mtd/maps/pci.c	2005-02-07 09:39:28.000000000 +0100
@@ -370,7 +370,7 @@ static struct pci_driver mtd_pci_driver 
 
 static int __init mtd_pci_maps_init(void)
 {
-	return pci_module_init(&mtd_pci_driver);
+	return pci_register_driver(&mtd_pci_driver);
 }
 
 static void __exit mtd_pci_maps_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/mtd/maps/scb2_flash.c linux-2.6.11-rc3/drivers/mtd/maps/scb2_flash.c
--- linux-2.6.11-rc3-vanilla/drivers/mtd/maps/scb2_flash.c	2005-02-03 17:03:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/mtd/maps/scb2_flash.c	2005-02-07 09:39:28.000000000 +0100
@@ -238,7 +238,7 @@ static struct pci_driver scb2_flash_driv
 static int __init
 scb2_flash_init(void)
 {
-	return pci_module_init(&scb2_flash_driver);
+	return pci_register_driver(&scb2_flash_driver);
 }
 
 static void __exit

--ceuyUbi+oA5bUa/n
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--ceuyUbi+oA5bUa/n--
