From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 19 Feb 2004 16:16:10 +0000
Subject: [Kernel-janitors] [PATCH] - Fix missing __init in
Message-Id: <1077207370.5750.4.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi all,

 Trivial patch, the missing __init was found by reference_init26.pl.

diff -Nru linux-2.6.3/drivers/ide/pci/piix.c linux-2.6.3~/drivers/ide/pci/piix.c
--- linux-2.6.3/drivers/ide/pci/piix.c	2004-02-18 15:54:24.000000000 -0300
+++ linux-2.6.3~/drivers/ide/pci/piix.c	2004-02-19 11:03:26.000000000 -0300
@@ -808,7 +808,7 @@
 	.probe		= piix_init_one,
 };
 
-static int piix_ide_init(void)
+static int __init piix_ide_init(void)
 {
 	piix_check_450nx();
 	return ide_pci_register_driver(&driver);

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
