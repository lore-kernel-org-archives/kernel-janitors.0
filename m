From: Christophe Lucas <c.lucas@ifrance.com>
Date: Thu, 10 Feb 2005 10:09:17 +0000
Subject: [KJ] [PATCH] drivers/video/intelfb/*: convert to pci_register_driver
Message-Id: <20050210100917.GE16373@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="GdbWtwDHkcXqP16f"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_video_intelfb.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/intelfb/intelfbdrv.c linux-2.6.11-rc3/drivers/video/intelfb/intelfbdrv.c
--- linux-2.6.11-rc3-vanilla/drivers/video/intelfb/intelfbdrv.c	2005-02-03 17:04:04.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/intelfb/intelfbdrv.c	2005-02-07 09:39:30.000000000 +0100
@@ -253,7 +253,7 @@ intelfb_init(void)
 	intelfb_setup(option);
 #endif
 
-	return pci_module_init(&intelfb_driver);
+	return pci_register_driver(&intelfb_driver);
 }
 
 static void __exit

--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--GdbWtwDHkcXqP16f--
