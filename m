From: Christophe Lucas <c.lucas@ifrance.com>
Date: Wed, 09 Feb 2005 09:09:47 +0000
Subject: [KJ] [PATCH] drivers/parport/*: convert to pci_register_driver
Message-Id: <20050209090947.GE4049@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="WYTEVAkct0FjGQmd"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050208163054.GV31996@rhum.iomeda.fr>
In-Reply-To: <20050208163054.GV31996@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_pci_pcie.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/pci/pcie/portdrv_pci.c linux-2.6.11-rc3/drivers/pci/pcie/portdrv_pci.c
--- linux-2.6.11-rc3-vanilla/drivers/pci/pcie/portdrv_pci.c	2005-02-03 17:03:53.000000000 +0100
+++ linux-2.6.11-rc3/drivers/pci/pcie/portdrv_pci.c	2005-02-07 09:41:08.000000000 +0100
@@ -122,7 +122,7 @@ static int __init pcie_portdrv_init(void
 	int retval = 0;
 
 	pcie_port_bus_register();
-	retval = pci_module_init(&pcie_portdrv);
+	retval = pci_register_driver(&pcie_portdrv);
 	if (retval)
 		pcie_port_bus_unregister();
 	return retval;

--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--WYTEVAkct0FjGQmd--
