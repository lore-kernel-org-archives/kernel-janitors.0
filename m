From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 08:06:52 +0000
Subject: [KJ] [PATCH] drivers/eisa/*: convert to pci_register_driver
Message-Id: <20050208080652.GA31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="SUOF0GtieIMvvwua"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_eisa.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/eisa/pci_eisa.c linux-2.6.11-rc3/drivers/eisa/pci_eisa.c
--- linux-2.6.11-rc3-vanilla/drivers/eisa/pci_eisa.c	2004-12-24 22:34:01.000000000 +0100
+++ linux-2.6.11-rc3/drivers/eisa/pci_eisa.c	2005-02-07 09:39:27.000000000 +0100
@@ -59,7 +59,7 @@ static struct pci_driver pci_eisa_driver
 
 static int __init pci_eisa_init_module (void)
 {
-	return pci_module_init (&pci_eisa_driver);
+	return pci_register_driver (&pci_eisa_driver);
 }
 
 device_initcall(pci_eisa_init_module);

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--SUOF0GtieIMvvwua--
