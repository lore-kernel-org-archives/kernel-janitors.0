From: Christophe Lucas <c.lucas@ifrance.com>
Date: Fri, 28 Jan 2005 10:07:13 +0000
Subject: [KJ] [PATCH] pci_register_driver() for drivers/block
Message-Id: <20050128110438.GA8645@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+HP7ph2BbKc20aGI"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From : http://kerneljanitors.org/TODO
-  convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pci_register_drivers_block.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/block/cciss.c linux-2.6.11-rc2/drivers/block/cciss.c
--- linux-2.6.11-rc2-vanilla/drivers/block/cciss.c	2005-01-26 08:31:07.000000000 +0100
+++ linux-2.6.11-rc2/drivers/block/cciss.c	2005-01-26 09:48:07.000000000 +0100
@@ -2883,7 +2883,7 @@ int __init cciss_init(void)
 	printk(KERN_INFO DRIVER_NAME "\n");
 
 	/* Register for our PCI devices */
-	return pci_module_init(&cciss_pci_driver);
+	return pci_register_driver(&cciss_pci_driver);
 }
 
 static int __init init_cciss_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/block/DAC960.c linux-2.6.11-rc2/drivers/block/DAC960.c
--- linux-2.6.11-rc2-vanilla/drivers/block/DAC960.c	2005-01-26 08:31:07.000000000 +0100
+++ linux-2.6.11-rc2/drivers/block/DAC960.c	2005-01-26 09:47:20.000000000 +0100
@@ -7065,7 +7065,7 @@ static int DAC960_init_module(void)
 {
 	int ret;
 
-	ret =  pci_module_init(&DAC960_pci_driver);
+	ret =  pci_register_driver(&DAC960_pci_driver);
 #ifdef DAC960_GAM_MINOR
 	if (!ret)
 		DAC960_gam_init();
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/block/sx8.c linux-2.6.11-rc2/drivers/block/sx8.c
--- linux-2.6.11-rc2-vanilla/drivers/block/sx8.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/block/sx8.c	2005-01-26 09:48:16.000000000 +0100
@@ -1749,7 +1749,7 @@ static void carm_remove_one (struct pci_
 
 static int __init carm_init(void)
 {
-	return pci_module_init(&carm_driver);
+	return pci_register_driver(&carm_driver);
 }
 
 static void __exit carm_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/block/umem.c linux-2.6.11-rc2/drivers/block/umem.c
--- linux-2.6.11-rc2-vanilla/drivers/block/umem.c	2005-01-24 17:08:06.000000000 +0100
+++ linux-2.6.11-rc2/drivers/block/umem.c	2005-01-26 09:48:26.000000000 +0100
@@ -1188,7 +1188,7 @@ int __init mm_init(void)
 
 	printk(KERN_INFO DRIVER_VERSION " : " DRIVER_DESC "\n");
 
-	retval = pci_module_init(&mm_pci_driver);
+	retval = pci_register_driver(&mm_pci_driver);
 	if (retval)
 		return -ENOMEM;
 

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--+HP7ph2BbKc20aGI--
