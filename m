From: Henne <henne@nachtwindheim.de>
Date: Thu, 29 Jun 2006 20:19:56 +0000
Subject: [KJ] [PATCH] pci_module_init() conversion
Message-Id: <44A435EC.5060709@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Changing form pci_module_init() to pci_register_driver() and make
use of PCI_DEVICE()-macro in the pci_device_id table.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

--- linux-2.6.17-git-15/drivers/scsi/tmscsim.c_orig	2006-06-29 21:43:24.000000000 +0200
+++ linux-2.6.17-git-15/drivers/scsi/tmscsim.c	2006-06-29 22:11:57.000000000 +0200
@@ -2646,8 +2646,7 @@
 }

 static struct pci_device_id tmscsim_pci_tbl[] = {
-	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD53C974,
-		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD53C974) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, tmscsim_pci_tbl);
@@ -2671,7 +2670,7 @@
 		printk (KERN_INFO "DC390: Using safe settings.\n");
 	}

-	return pci_module_init(&dc390_driver);
+	return pci_register_driver(&dc390_driver);
 }

 static void __exit dc390_module_exit(void)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
