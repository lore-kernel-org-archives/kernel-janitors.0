From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 12:58:12 +0000
Subject: [KJ] [PATCH] drivers/net/skfp/*: convert to pci_register_driver
Message-Id: <20050213125812.GF15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="SdaPbLtAangIkrMZ"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--SdaPbLtAangIkrMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>



--SdaPbLtAangIkrMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net_skfp.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/skfp/skfddi.c linux-2.6.11-rc3/drivers/net/skfp/skfddi.c
--- linux-2.6.11-rc3-vanilla/drivers/net/skfp/skfddi.c	2005-02-03 17:03:51.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/skfp/skfddi.c	2005-02-07 09:39:28.000000000 +0100
@@ -2281,7 +2281,7 @@ static struct pci_driver skfddi_pci_driv
 
 static int __init skfd_init(void)
 {
-	return pci_module_init(&skfddi_pci_driver);
+	return pci_register_driver(&skfddi_pci_driver);
 }
 
 static void __exit skfd_exit(void)

--SdaPbLtAangIkrMZ
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--SdaPbLtAangIkrMZ--
