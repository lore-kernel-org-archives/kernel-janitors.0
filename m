From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 08:09:50 +0000
Subject: [KJ] [PATCH] drivers/char/ieee1394/*: convert to pci_register_driver
Message-Id: <20050208080950.GC31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="uCPdOCrL+PnN2Vxy"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_ieee1394.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/ieee1394/ohci1394.c linux-2.6.11-rc3/drivers/ieee1394/ohci1394.c
--- linux-2.6.11-rc3-vanilla/drivers/ieee1394/ohci1394.c	2004-12-24 22:35:25.000000000 +0100
+++ linux-2.6.11-rc3/drivers/ieee1394/ohci1394.c	2005-02-07 09:39:27.000000000 +0100
@@ -3676,7 +3676,7 @@ static void __exit ohci1394_cleanup (voi
 
 static int __init ohci1394_init(void)
 {
-	return pci_module_init(&ohci1394_pci_driver);
+	return pci_register_driver(&ohci1394_pci_driver);
 }
 
 module_init(ohci1394_init);
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/ieee1394/pcilynx.c linux-2.6.11-rc3/drivers/ieee1394/pcilynx.c
--- linux-2.6.11-rc3-vanilla/drivers/ieee1394/pcilynx.c	2005-02-03 17:03:44.000000000 +0100
+++ linux-2.6.11-rc3/drivers/ieee1394/pcilynx.c	2005-02-07 09:39:27.000000000 +0100
@@ -1938,7 +1938,7 @@ static int __init pcilynx_init(void)
         }
 #endif
 
-        ret = pci_module_init(&lynx_pci_driver);
+        ret = pci_register_driver(&lynx_pci_driver);
         if (ret < 0) {
                 PRINT_G(KERN_ERR, "PCI module init failed");
                 goto free_char_dev;

--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--uCPdOCrL+PnN2Vxy--
