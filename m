From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 08:46:17 +0000
Subject: [KJ] [PATCH] drivers/isdn/hardware/eicon/*: convert to
Message-Id: <20050208084617.GI31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DXTueXWT3Da08pik"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--DXTueXWT3Da08pik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--DXTueXWT3Da08pik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_isdn_hardware_eicon.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/isdn/hardware/eicon/divasmain.c linux-2.6.11-rc3/drivers/isdn/hardware/eicon/divasmain.c
--- linux-2.6.11-rc3-vanilla/drivers/isdn/hardware/eicon/divasmain.c	2005-02-03 17:03:46.000000000 +0100
+++ linux-2.6.11-rc3/drivers/isdn/hardware/eicon/divasmain.c	2005-02-07 09:39:27.000000000 +0100
@@ -823,7 +823,7 @@ static int DIVA_INIT_FUNCTION divas_init
 		goto out;
 	}
 
-	if ((ret = pci_module_init(&diva_pci_driver))) {
+	if ((ret = pci_register_driver(&diva_pci_driver))) {
 #ifdef MODULE
 		remove_divas_proc();
 		divas_unregister_chrdev();

--DXTueXWT3Da08pik
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--DXTueXWT3Da08pik--
