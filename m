From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 08:08:18 +0000
Subject: [KJ] [PATCH] drivers/ide/*: convert to pci_register_driver
Message-Id: <20050208080818.GB31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="f0KYrhQ4vYSV2aJu"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_ide.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/ide/setup-pci.c linux-2.6.11-rc3/drivers/ide/setup-pci.c
--- linux-2.6.11-rc3-vanilla/drivers/ide/setup-pci.c	2005-02-03 17:03:44.000000000 +0100
+++ linux-2.6.11-rc3/drivers/ide/setup-pci.c	2005-02-07 09:39:27.000000000 +0100
@@ -803,7 +803,7 @@ static LIST_HEAD(ide_pci_drivers);
 int ide_pci_register_driver(struct pci_driver *driver)
 {
 	if(!pre_init)
-		return pci_module_init(driver);
+		return pci_register_driver(driver);
 	list_add_tail(&driver->node, &ide_pci_drivers);
 	return 0;
 }

--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--f0KYrhQ4vYSV2aJu--
