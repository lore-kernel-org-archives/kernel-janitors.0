From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 07 Feb 2005 09:23:24 +0000
Subject: [KJ] [PATCH] drivers/block/*: convert to pci_register_driver
Message-Id: <20050207092324.GC21028@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="FkmkrVfFsRoUs1wW"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_block.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/block/cciss.c linux-2.6.11-rc3/drivers/block/cciss.c
--- linux-2.6.11-rc3-vanilla/drivers/block/cciss.c	2005-02-03 17:03:40.000000000 +0100
+++ linux-2.6.11-rc3/drivers/block/cciss.c	2005-02-07 09:39:27.000000000 +0100
@@ -2883,7 +2883,7 @@ int __init cciss_init(void)
 	printk(KERN_INFO DRIVER_NAME "\n");
 
 	/* Register for our PCI devices */
-	return pci_module_init(&cciss_pci_driver);
+	return pci_register_driver(&cciss_pci_driver);
 }
 
 static int __init init_cciss_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/block/DAC960.c linux-2.6.11-rc3/drivers/block/DAC960.c
--- linux-2.6.11-rc3-vanilla/drivers/block/DAC960.c	2005-02-03 17:03:40.000000000 +0100
+++ linux-2.6.11-rc3/drivers/block/DAC960.c	2005-02-07 09:39:27.000000000 +0100
@@ -7065,7 +7065,7 @@ static int DAC960_init_module(void)
 {
 	int ret;
 
-	ret =  pci_module_init(&DAC960_pci_driver);
+	ret =  pci_register_driver(&DAC960_pci_driver);
 #ifdef DAC960_GAM_MINOR
 	if (!ret)
 		DAC960_gam_init();
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/block/sx8.c linux-2.6.11-rc3/drivers/block/sx8.c
--- linux-2.6.11-rc3-vanilla/drivers/block/sx8.c	2005-02-03 17:03:41.000000000 +0100
+++ linux-2.6.11-rc3/drivers/block/sx8.c	2005-02-07 09:39:27.000000000 +0100
@@ -1749,7 +1749,7 @@ static void carm_remove_one (struct pci_
 
 static int __init carm_init(void)
 {
-	return pci_module_init(&carm_driver);
+	return pci_register_driver(&carm_driver);
 }
 
 static void __exit carm_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/block/umem.c linux-2.6.11-rc3/drivers/block/umem.c
--- linux-2.6.11-rc3-vanilla/drivers/block/umem.c	2004-12-24 22:35:40.000000000 +0100
+++ linux-2.6.11-rc3/drivers/block/umem.c	2005-02-07 09:39:27.000000000 +0100
@@ -1188,7 +1188,7 @@ int __init mm_init(void)
 
 	printk(KERN_INFO DRIVER_VERSION " : " DRIVER_DESC "\n");
 
-	retval = pci_module_init(&mm_pci_driver);
+	retval = pci_register_driver(&mm_pci_driver);
 	if (retval)
 		return -ENOMEM;
 

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--FkmkrVfFsRoUs1wW--
