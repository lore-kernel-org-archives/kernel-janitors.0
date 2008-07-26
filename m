From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:44:46 +0000
Subject: [PATCH 3/14] drivers/isdn/hisax/elsa.c: fix warnings
Message-Id: <1217101486.6107.129.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warnings:

drivers/isdn/hisax/elsa.c: In function ‘setup_elsa_pci’:
drivers/isdn/hisax/elsa.c:1038: warning: ‘pci_find_device’ is deprecated
(declared at include/linux/pci.h:535)
drivers/isdn/hisax/elsa.c:1046: warning: ‘pci_find_device’ is deprecated
(declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/elsa.c b/drivers/isdn/hisax/elsa.c
index aa29d1c..be8b613 100644
--- a/drivers/isdn/hisax/elsa.c
+++ b/drivers/isdn/hisax/elsa.c
@@ -1035,7 +1035,7 @@ setup_elsa_pci(struct IsdnCard *card)
 	struct IsdnCardState *cs = card->cs;
 
 	cs->subtyp = 0;
-	if ((dev_qs1000 = pci_find_device(PCI_VENDOR_ID_ELSA,
+	if ((dev_qs1000 = pci_get_device(PCI_VENDOR_ID_ELSA,
 		PCI_DEVICE_ID_ELSA_MICROLINK, dev_qs1000))) {
 		if (pci_enable_device(dev_qs1000))
 			return(0);
@@ -1043,7 +1043,7 @@ setup_elsa_pci(struct IsdnCard *card)
 		cs->irq = dev_qs1000->irq;
 		cs->hw.elsa.cfg = pci_resource_start(dev_qs1000, 1);
 		cs->hw.elsa.base = pci_resource_start(dev_qs1000, 3);
-	} else if ((dev_qs3000 = pci_find_device(PCI_VENDOR_ID_ELSA,
+	} else if ((dev_qs3000 = pci_get_device(PCI_VENDOR_ID_ELSA,
 		PCI_DEVICE_ID_ELSA_QS3000, dev_qs3000))) {
 		if (pci_enable_device(dev_qs3000))
 			return(0);

