From: Christophe Lucas <c.lucas@ifrance.com>
Date: Fri, 11 Feb 2005 08:34:36 +0000
Subject: [KJ] [PATCH] drivers/scsi/sym53c8xx_2/*: convert to
Message-Id: <20050211083436.GG28942@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="s5/bjXLgkIwAv6Hi"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--s5/bjXLgkIwAv6Hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--s5/bjXLgkIwAv6Hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_scsi_sym53c8xx_2.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/sym53c8xx_2/sym_glue.c linux-2.6.11-rc3/drivers/scsi/sym53c8xx_2/sym_glue.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/sym53c8xx_2/sym_glue.c	2005-02-03 17:03:58.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/sym53c8xx_2/sym_glue.c	2005-02-07 09:39:30.000000000 +0100
@@ -2370,7 +2370,7 @@ static int __init sym2_init(void)
 	if (!sym2_transport_template)
 		return -ENODEV;
 
-	error = pci_module_init(&sym2_driver);
+	error = pci_register_driver(&sym2_driver);
 	if (error)
 		spi_release_transport(sym2_transport_template);
 	return error;

--s5/bjXLgkIwAv6Hi
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--s5/bjXLgkIwAv6Hi--
