From: trem <tremyfr@yahoo.fr>
Date: Tue, 16 May 2006 20:55:23 +0000
Subject: [KJ] [PATCH] ip2main.c : replace pci_find_device by pci_get_device
Message-Id: <446A3C3B.8020707@yahoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: trem <tremyfr at yahoo.fr <https://lists.osdl.org/mailman/listinfo/kernel-janitors>>

This patch simply change pci_find_device by pci_get_device, because
pci_find_device is deprecated.

Signed-Off-By: trem <tremyfr at yahoo.fr <https://lists.osdl.org/mailman/listinfo/kernel-janitors>>
---
diff --git a/drivers/char/ip2/ip2main.c b/drivers/char/ip2/ip2main.c
index 03db1cb..c4311b7 100644
--- a/drivers/char/ip2/ip2main.c
+++ b/drivers/char/ip2/ip2main.c
@@ -594,7 +594,7 @@ ip2_loadmain(int *iop, int *irqp, unsign
 #ifdef CONFIG_PCI
                        {
                                struct pci_dev *pci_dev_i = NULL;
-                               pci_dev_i = pci_find_device(PCI_VENDOR_ID_COMPUTONE,
+                               pci_dev_i = pci_get_device(PCI_VENDOR_ID_COMPUTONE,
                                                          PCI_DEVICE_ID_COMPUTONE_IP2EX, pci_dev_i);
                                if (pci_dev_i != NULL) {
                                        unsigned int addr;



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
