From: Christophe Lucas <c.lucas@ifrance.com>
Date: Thu, 10 Feb 2005 09:17:19 +0000
Subject: [KJ] [PATCH] drivers/w1/*: convert to pci_register_driver
Message-Id: <20050210091719.GB16373@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cvVnyQ+4j833TQvp"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_w1.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/w1/matrox_w1.c linux-2.6.11-rc3/drivers/w1/matrox_w1.c
--- linux-2.6.11-rc3-vanilla/drivers/w1/matrox_w1.c	2004-12-24 22:35:01.000000000 +0100
+++ linux-2.6.11-rc3/drivers/w1/matrox_w1.c	2005-02-07 09:39:30.000000000 +0100
@@ -235,7 +235,7 @@ static void __devexit matrox_w1_remove(s
 
 static int __init matrox_w1_init(void)
 {
-	return pci_module_init(&matrox_w1_pci_driver);
+	return pci_register_driver(&matrox_w1_pci_driver);
 }
 
 static void __exit matrox_w1_fini(void)

--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--cvVnyQ+4j833TQvp--
