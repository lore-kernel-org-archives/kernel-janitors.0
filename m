From: Christophe Lucas <c.lucas@ifrance.com>
Date: Thu, 10 Feb 2005 11:03:33 +0000
Subject: [KJ] [PATCH] drivers/video/sis/*: convert to pci_register_driver
Message-Id: <20050210110333.GI16373@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="pFej7zHSL6C5fFIz"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--pFej7zHSL6C5fFIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--pFej7zHSL6C5fFIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_video_sis.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/video/sis/sis_main.c linux-2.6.11-rc3/drivers/video/sis/sis_main.c
--- linux-2.6.11-rc3-vanilla/drivers/video/sis/sis_main.c	2005-02-03 17:04:05.000000000 +0100
+++ linux-2.6.11-rc3/drivers/video/sis/sis_main.c	2005-02-07 09:39:30.000000000 +0100
@@ -5693,7 +5693,7 @@ SISINITSTATIC int __init sisfb_init(void
 	sisfb_setup(options);
 #endif
 #endif
-	return(pci_module_init(&sisfb_driver));
+	return(pci_register_driver(&sisfb_driver));
 }
 
 #if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,8)

--pFej7zHSL6C5fFIz
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--pFej7zHSL6C5fFIz--
