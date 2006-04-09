From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 09 Apr 2006 17:23:10 +0000
Subject: [KJ] [PATCH 2.6.17-rc1-mm2] net: cleanup CONFIG_PCI from dgrs.c
Message-Id: <443942FE.6060400@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Richard Knutsson <ricknu-0@student.ltu.se>

Removed (I believe) unnecessary CONFIG_PCI and an ugly (previous patch 
of mine) empty struct if !CONFIG_PCI.

Compiled tested, with and without an "#undef CONFIG_PCI" in dgrs.c, with 
no warnings/errors.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---

 dgrs.c |    8 +-------
 1 files changed, 1 insertion(+), 7 deletions(-)

diff -Narup a/drivers/net/dgrs.c b/drivers/net/dgrs.c
--- a/drivers/net/dgrs.c	2006-04-09 15:47:43.000000000 +0200
+++ b/drivers/net/dgrs.c	2006-04-09 18:22:12.000000000 +0200
@@ -121,11 +121,11 @@ typedef unsigned int bool;
 #include "dgrs_asstruct.h"
 #include "dgrs_bcomm.h"
 
-#ifdef CONFIG_PCI
 static struct pci_device_id dgrs_pci_tbl[] = {
 	{ SE6_PCI_VENDOR_ID, SE6_PCI_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID, },
 	{ }			/* Terminating entry */
 };
+#ifdef CONFIG_PCI
 MODULE_DEVICE_TABLE(pci, dgrs_pci_tbl);
 #endif
 
@@ -1381,7 +1381,6 @@ static void __devexit dgrs_remove(struct
 	}
 }
 
-#ifdef CONFIG_PCI
 static int __init dgrs_pci_probe(struct pci_dev *pdev,
 				 const struct pci_device_id *ent)
 {
@@ -1458,9 +1457,6 @@ static struct pci_driver dgrs_pci_driver
 	.probe = dgrs_pci_probe,
 	.remove = __devexit_p(dgrs_pci_remove),
 };
-#else
-static struct pci_driver dgrs_pci_driver = {};
-#endif
 
 
 #ifdef CONFIG_EISA
@@ -1608,9 +1604,7 @@ static void __exit dgrs_cleanup_module (
 #ifdef CONFIG_EISA
 	eisa_driver_unregister (&dgrs_eisa_driver);
 #endif
-#ifdef CONFIG_PCI
 	pci_unregister_driver (&dgrs_pci_driver);
-#endif
 }
 
 module_init(dgrs_init_module);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
