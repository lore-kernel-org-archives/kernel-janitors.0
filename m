From: Christophe Lucas <c.lucas@ifrance.com>
Date: Thu, 10 Feb 2005 10:04:02 +0000
Subject: [KJ] [PATCH] drivers/video/aty/*: convert to pci_register_driver
Message-Id: <20050210100402.GC16373@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0vzXIDBeUiKkjNJl"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_video_aty.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/aty/aty128fb.c linux-2.6.11-rc3/drivers/video/aty/aty128fb.c
--- linux-2.6.11-rc3-vanilla/drivers/video/aty/aty128fb.c	2005-02-03 17:04:04.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/aty/aty128fb.c	2005-02-07 09:39:30.000000000 +0100
@@ -2413,7 +2413,7 @@ int __init aty128fb_init(void)
 	aty128fb_setup(option);
 #endif
 
-	return pci_module_init(&aty128fb_driver);
+	return pci_register_driver(&aty128fb_driver);
 }
 
 static void __exit aty128fb_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/aty/atyfb_base.c linux-2.6.11-rc3/drivers/video/aty/atyfb_base.c
--- linux-2.6.11-rc3-vanilla/drivers/video/aty/atyfb_base.c	2005-02-03 17:04:04.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/aty/atyfb_base.c	2005-02-07 09:39:30.000000000 +0100
@@ -3661,7 +3661,7 @@ int __init atyfb_init(void)
 #endif
 
 #ifdef CONFIG_PCI
-    pci_module_init(&atyfb_driver);
+    pci_register_driver(&atyfb_driver);
 #endif
 #ifdef CONFIG_ATARI
     atyfb_atari_probe();
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/aty/radeon_base.c linux-2.6.11-rc3/drivers/video/aty/radeon_base.c
--- linux-2.6.11-rc3-vanilla/drivers/video/aty/radeon_base.c	2005-02-03 17:04:04.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/aty/radeon_base.c	2005-02-07 09:39:30.000000000 +0100
@@ -2389,7 +2389,7 @@ int __init radeonfb_init (void)
 		return -ENODEV;
 	radeonfb_setup(option);
 #endif
-	return pci_module_init (&radeonfb_driver);
+	return pci_register_driver (&radeonfb_driver);
 }
 
 

--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--0vzXIDBeUiKkjNJl--
