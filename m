From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 08:58:05 +0000
Subject: [KJ] [PATCH] drivers/isdn/tpam/*: convert to pci_register_driver
Message-Id: <20050208085805.GJ31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="b1ERR0FXR0PvNIRE"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--b1ERR0FXR0PvNIRE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--b1ERR0FXR0PvNIRE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_isdn_tpam.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/isdn/tpam/tpam_main.c linux-2.6.11-rc3/drivers/isdn/tpam/tpam_main.c
--- linux-2.6.11-rc3-vanilla/drivers/isdn/tpam/tpam_main.c	2005-02-03 17:03:46.000000000 +0100
+++ linux-2.6.11-rc3/drivers/isdn/tpam/tpam_main.c	2005-02-07 09:39:27.000000000 +0100
@@ -278,7 +278,7 @@ static struct pci_driver tpam_driver = {
 static int __init tpam_init(void) {
 	int ret;
 	
-	ret = pci_module_init(&tpam_driver);
+	ret = pci_register_driver(&tpam_driver);
 	if (ret)
 		return ret;
 	printk(KERN_INFO "TurboPAM: %d card%s found, driver loaded.\n", 

--b1ERR0FXR0PvNIRE
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--b1ERR0FXR0PvNIRE--
