From: Christophe Lucas <c.lucas@ifrance.com>
Date: Wed, 09 Feb 2005 09:42:07 +0000
Subject: [KJ] [PATCH] drivers/serial/*: convert to pci_register_driver
Message-Id: <20050209094207.GF4049@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="u65IjBhB3TIa72Vp"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_serial.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/serial/8250_pci.c linux-2.6.11-rc3/drivers/serial/8250_pci.c
--- linux-2.6.11-rc3-vanilla/drivers/serial/8250_pci.c	2004-12-24 22:35:23.000000000 +0100
+++ linux-2.6.11-rc3/drivers/serial/8250_pci.c	2005-02-07 09:39:30.000000000 +0100
@@ -2241,7 +2241,7 @@ static struct pci_driver serial_pci_driv
 
 static int __init serial8250_pci_init(void)
 {
-	return pci_module_init(&serial_pci_driver);
+	return pci_register_driver(&serial_pci_driver);
 }
 
 static void __exit serial8250_pci_exit(void)

--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--u65IjBhB3TIa72Vp--
