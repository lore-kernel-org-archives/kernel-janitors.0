From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:28 +0000
Subject: [KJ] [PATCH][15/26] drivers/scsi/sym53c8xx_2/* - compile warning
Message-Id: <420BEF84.18293.5874C6@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66916743907275644=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66916743907275644==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - stop compilation of unused 
structure member unless proper symbol is defined

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/scsi/sym53c8xx_2/sym_glue.c linux-2.6.11-rc3-mm/drivers/scsi/sym53c8xx_2/sym_glue.c
--- linux-2.6.11-rc3-mm-original/drivers/scsi/sym53c8xx_2/sym_glue.c	2005-02-03 03:57:04.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/scsi/sym53c8xx_2/sym_glue.c	2005-02-07 15:55:40.000000000 +0200
@@ -1817,7 +1817,9 @@ static int __devinit sym_check_supported
 	struct pci_dev *pdev = device->pdev;
 	u_char revision;
 	unsigned long io_port = device->s.io_port;
+#ifndef SYM_CONF_IOMAPPED
 	unsigned long base = device->s.base;
+#endif
 	int i;
 
 	/*




--===============66916743907275644==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66916743907275644==--
