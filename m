From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 16:30:54 +0000
Subject: [KJ] [PATCH] drivers/parport/*: convert to pci_register_driver
Message-Id: <20050208163054.GV31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="oNLI4EWr1RPQuPCf"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--oNLI4EWr1RPQuPCf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--oNLI4EWr1RPQuPCf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_parport.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/parport/parport_serial.c linux-2.6.11-rc3/drivers/parport/parport_serial.c
--- linux-2.6.11-rc3-vanilla/drivers/parport/parport_serial.c	2004-12-24 22:35:28.000000000 +0100
+++ linux-2.6.11-rc3/drivers/parport/parport_serial.c	2005-02-07 09:40:03.000000000 +0100
@@ -420,7 +420,7 @@ static struct pci_driver parport_serial_
 
 static int __init parport_serial_init (void)
 {
-	return pci_module_init (&parport_serial_pci_driver);
+	return pci_register_driver (&parport_serial_pci_driver);
 }
 
 static void __exit parport_serial_exit (void)

--oNLI4EWr1RPQuPCf
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--oNLI4EWr1RPQuPCf--
