From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 16 Mar 2004 09:41:15 +0000
Subject: [Kernel-janitors] [patch] fix sysfs leak drivers/net/dgrs.c
Message-Id: <20040316094113.GA3260@mail.sternwelten.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

if the driver fails to load, leaves a dgrs dir in sysfs.

belows patch is far from beautifull,
but keeps logic of dgrs_init_module().

test compiled.

as follow up to:
http://marc.theaimsgroup.com/?l=linux-kernel&m7938809308387&w=2

when chasing eisa_driver_register returns,
i found a lot of unchecked pci_register_driver,
should i add this one to kj TODO?

regards
maks


diff -ruN -X dontdiff linux-2.6.4/drivers/net/dgrs.c linux-2.6.4-maks/drivers/net/dgrs.c
--- linux-2.6.4/drivers/net/dgrs.c	2004-03-16 08:47:06.000000000 +0100
+++ linux-2.6.4-maks/drivers/net/dgrs.c	2004-03-16 00:42:41.000000000 +0100
@@ -1586,11 +1586,15 @@
 	 */
 #ifdef CONFIG_EISA
 	eisacount = eisa_driver_register(&dgrs_eisa_driver);
+	if (eisacount <= 0)
+		eisa_driver_unregister(&dgrs_eisa_driver);
 	if (eisacount < 0)
 		return eisacount;
 #endif
 #ifdef CONFIG_PCI
 	pcicount = pci_register_driver(&dgrs_pci_driver);
+	if (pcicount <= 0)
+		pci_unregister_driver(&dgrs_pci_driver);
 	if (pcicount < 0)
 		return pcicount;
 #endif

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
