From: Christophe Lucas <c.lucas@ifrance.com>
Date: Fri, 11 Feb 2005 11:10:29 +0000
Subject: [KJ] [PATCH] drivers/parisc/*: convert to pci_register_driver
Message-Id: <20050211111029.GT28942@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jITzwD3HDGXid3BE"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--jITzwD3HDGXid3BE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

--jITzwD3HDGXid3BE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_parisc.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/parisc/superio.c linux-2.6.11-rc3/drivers/parisc/superio.c
--- linux-2.6.11-rc3-vanilla/drivers/parisc/superio.c	2005-02-03 17:03:53.000000000 +0100
+++ linux-2.6.11-rc3/drivers/parisc/superio.c	2005-02-07 09:39:29.000000000 +0100
@@ -495,7 +495,7 @@ static struct pci_driver superio_driver 
 
 static int __init superio_modinit(void)
 {
-	return pci_module_init(&superio_driver);
+	return pci_register_driver(&superio_driver);
 }
 
 static void __exit superio_exit(void)

--jITzwD3HDGXid3BE
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--jITzwD3HDGXid3BE--
