From: Christophe Lucas <c.lucas@ifrance.com>
Date: Thu, 10 Feb 2005 10:13:01 +0000
Subject: [KJ] [PATCH] drivers/video/kyro/*: convert to pci_register_driver
Message-Id: <20050210101301.GF16373@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="o71xDhNo7p97+qVi"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--o71xDhNo7p97+qVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--o71xDhNo7p97+qVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_video_kyro.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/kyro/fbdev.c linux-2.6.11-rc3/drivers/video/kyro/fbdev.c
--- linux-2.6.11-rc3-vanilla/drivers/video/kyro/fbdev.c	2004-12-24 22:33:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/kyro/fbdev.c	2005-02-07 09:39:30.000000000 +0100
@@ -795,7 +795,7 @@ int __init kyrofb_init(void)
 		return -ENODEV;
 	kyrofb_setup(option);
 #endif
-	return pci_module_init(&kyrofb_pci_driver);
+	return pci_register_driver(&kyrofb_pci_driver);
 }
 
 static void __exit kyrofb_exit(void)

--o71xDhNo7p97+qVi
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--o71xDhNo7p97+qVi--
