From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 08:15:26 +0000
Subject: [KJ] [PATCH] drivers/input/serio/*: convert to pci_register_driver
Message-Id: <20050208081526.GE31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="e5GLnnZ8mDMEwH4V"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--e5GLnnZ8mDMEwH4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--e5GLnnZ8mDMEwH4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_input_serio.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/input/serio/pcips2.c linux-2.6.11-rc3/drivers/input/serio/pcips2.c
--- linux-2.6.11-rc3-vanilla/drivers/input/serio/pcips2.c	2004-12-24 22:34:26.000000000 +0100
+++ linux-2.6.11-rc3/drivers/input/serio/pcips2.c	2005-02-07 09:39:27.000000000 +0100
@@ -217,7 +217,7 @@ static struct pci_driver pcips2_driver =
 
 static int __init pcips2_init(void)
 {
-	return pci_module_init(&pcips2_driver);
+	return pci_register_driver(&pcips2_driver);
 }
 
 static void __exit pcips2_exit(void)

--e5GLnnZ8mDMEwH4V
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--e5GLnnZ8mDMEwH4V--
