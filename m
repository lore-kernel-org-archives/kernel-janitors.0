From: Christophe Lucas <c.lucas@ifrance.com>
Date: Thu, 10 Feb 2005 11:02:10 +0000
Subject: [KJ] drivers/video/*: convert to pci_register_driver
Message-Id: <20050210110210.GH16373@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="tKy6e3LXpfmanBFM"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--tKy6e3LXpfmanBFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--tKy6e3LXpfmanBFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_video.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/asiliantfb.c linux-2.6.11-rc3/drivers/video/asiliantfb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/asiliantfb.c	2004-12-24 22:35:28.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/asiliantfb.c	2005-02-07 09:39:30.000000000 +0100
@@ -609,7 +609,7 @@ int __init asiliantfb_init(void)
 	if (fb_get_options("asiliantfb", NULL))
 		return -ENODEV;
 
-	return pci_module_init(&asiliantfb_driver);
+	return pci_register_driver(&asiliantfb_driver);
 }
 
 module_init(asiliantfb_init);
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/chipsfb.c linux-2.6.11-rc3/drivers/video/chipsfb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/chipsfb.c	2004-12-24 22:34:44.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/chipsfb.c	2005-02-07 09:39:30.000000000 +0100
@@ -465,7 +465,7 @@ int __init chips_init(void)
 	if (fb_get_options("chipsfb", NULL))
 		return -ENODEV;
 
-	return pci_module_init(&chipsfb_driver);
+	return pci_register_driver(&chipsfb_driver);
 }
 
 module_init(chips_init);
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/cirrusfb.c linux-2.6.11-rc3/drivers/video/cirrusfb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/cirrusfb.c	2004-12-24 22:35:27.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/cirrusfb.c	2005-02-07 09:39:30.000000000 +0100
@@ -2621,7 +2621,7 @@ int __init cirrusfb_init(void)
 	error |= zorro_module_init(&cirrusfb_zorro_driver);
 #endif
 #ifdef CONFIG_PCI
-	error |= pci_module_init(&cirrusfb_pci_driver);
+	error |= pci_register_driver(&cirrusfb_pci_driver);
 #endif
 	return error;
 }
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/cyber2000fb.c linux-2.6.11-rc3/drivers/video/cyber2000fb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/cyber2000fb.c	2005-02-03 17:04:04.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/cyber2000fb.c	2005-02-07 09:39:30.000000000 +0100
@@ -1737,7 +1737,7 @@ int __init cyber2000fb_init(void)
 	}
 #endif
 #ifdef CONFIG_PCI
-	err = pci_module_init(&cyberpro_driver);
+	err = pci_register_driver(&cyberpro_driver);
 	if (!err)
 		ret = 0;
 #endif
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/imsttfb.c linux-2.6.11-rc3/drivers/video/imsttfb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/imsttfb.c	2004-12-24 22:34:45.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/imsttfb.c	2005-02-07 09:39:30.000000000 +0100
@@ -1611,7 +1611,7 @@ int __init imsttfb_init(void)
 
 	imsttfb_setup(option);
 #endif
-	return pci_module_init(&imsttfb_pci_driver);
+	return pci_register_driver(&imsttfb_pci_driver);
 }
  
 static void __exit imsttfb_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/pm2fb.c linux-2.6.11-rc3/drivers/video/pm2fb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/pm2fb.c	2005-02-03 17:04:04.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/pm2fb.c	2005-02-07 09:39:30.000000000 +0100
@@ -1259,7 +1259,7 @@ int __init pm2fb_init(void)
 	pm2fb_setup(option);
 #endif
 
-	return pci_module_init(&pm2fb_driver);
+	return pci_register_driver(&pm2fb_driver);
 }
 
 #ifdef MODULE
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/pvr2fb.c linux-2.6.11-rc3/drivers/video/pvr2fb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/pvr2fb.c	2004-12-24 22:33:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/pvr2fb.c	2005-02-07 09:39:30.000000000 +0100
@@ -966,7 +966,7 @@ static struct pci_driver pvr2fb_pci_driv
 
 static int __init pvr2fb_pci_init(void)
 {
-	return pci_module_init(&pvr2fb_pci_driver);
+	return pci_register_driver(&pvr2fb_pci_driver);
 }
 
 static void pvr2fb_pci_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/radeonfb.c linux-2.6.11-rc3/drivers/video/radeonfb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/radeonfb.c	2005-02-03 17:04:04.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/radeonfb.c	2005-02-07 09:39:30.000000000 +0100
@@ -3120,7 +3120,7 @@ int __init radeonfb_old_init (void)
 		return -ENODEV;
 	radeonfb_old_setup(option);
 #endif
-	return pci_module_init (&radeonfb_driver);
+	return pci_register_driver (&radeonfb_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/sstfb.c linux-2.6.11-rc3/drivers/video/sstfb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/sstfb.c	2005-02-03 17:04:05.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/sstfb.c	2005-02-07 09:39:30.000000000 +0100
@@ -1574,7 +1574,7 @@ int __devinit sstfb_init(void)
 		return -ENODEV;
 	sstfb_setup(option);
 #endif
-	return pci_module_init(&sstfb_driver);
+	return pci_register_driver(&sstfb_driver);
 }
 
 void __devexit sstfb_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/tdfxfb.c linux-2.6.11-rc3/drivers/video/tdfxfb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/tdfxfb.c	2005-02-03 17:04:05.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/tdfxfb.c	2005-02-07 09:39:30.000000000 +0100
@@ -1331,7 +1331,7 @@ int __init tdfxfb_init(void)
 
 	tdfxfb_setup(option);
 #endif
-        return pci_module_init(&tdfxfb_driver);
+        return pci_register_driver(&tdfxfb_driver);
 }
 
 static void __exit tdfxfb_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/tgafb.c linux-2.6.11-rc3/drivers/video/tgafb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/tgafb.c	2004-12-24 22:35:23.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/tgafb.c	2005-02-07 09:39:30.000000000 +0100
@@ -1540,7 +1540,7 @@ tgafb_init(void)
 		return -ENODEV;
 	tgafb_setup(option);
 #endif
-	return pci_module_init(&tgafb_driver);
+	return pci_register_driver(&tgafb_driver);
 }
 
 /*
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/tridentfb.c linux-2.6.11-rc3/drivers/video/tridentfb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/tridentfb.c	2005-02-03 17:04:06.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/tridentfb.c	2005-02-07 09:39:30.000000000 +0100
@@ -1228,7 +1228,7 @@ int __init tridentfb_init(void)
 	tridentfb_setup(option);
 #endif
 	output("Trident framebuffer %s initializing\n", VERSION);
-	return pci_module_init(&tridentfb_pci_driver);
+	return pci_register_driver(&tridentfb_pci_driver);
 }
 
 void __exit tridentfb_exit(void)

--tKy6e3LXpfmanBFM
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--tKy6e3LXpfmanBFM--
