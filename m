From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:53 +0000
Subject: [KJ] [PATCH][RESUBMIT][13/ 21] drivers/scsi/sym53c8xx_2/* - compile
Message-Id: <42113C2D.1177.52C034@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39286333338172619=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39286333338172619==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - stop compilation of unused 
structure member unless proper symbol is defined

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/sym53c8xx_2/sym_glue.c linux-2.6.11-rc3-mm2/drivers/scsi/sym53c8xx_2/sym_glue.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/sym53c8xx_2/sym_glue.c	2005-02-12 12:06:25.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/sym53c8xx_2/sym_glue.c	2005-02-12 17:35:49.000000000 +0200
@@ -1817,7 +1817,9 @@ static int __devinit sym_check_supported
 	struct pci_dev *pdev = device->pdev;
 	u_char revision;
 	unsigned long io_port = device->s.io_port;
+#ifndef SYM_CONF_IOMAPPED
 	unsigned long base = device->s.base;
+#endif
 	int i;
 
 	/*




--===============39286333338172619==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39286333338172619==--
