From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:44:50 +0000
Subject: [PATCH 4/14] drivers/isdn/hisax/diva.c: fix warnings
Message-Id: <1217101490.6107.130.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warnings:

drivers/isdn/hisax/diva.c: In function ‘setup_diva_pci’:
drivers/isdn/hisax/diva.c:1162: warning: ‘pci_find_device’ is deprecated
(declared at include/linux/pci.h:535)
drivers/isdn/hisax/diva.c:1169: warning: ‘pci_find_device’ is deprecated
(declared at include/linux/pci.h:535)
drivers/isdn/hisax/diva.c:1176: warning: ‘pci_find_device’ is deprecated
(declared at include/linux/pci.h:535)
drivers/isdn/hisax/diva.c:1186: warning: ‘pci_find_device’ is deprecated
(declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/diva.c b/drivers/isdn/hisax/diva.c
index 018bd29..6fe012d 100644
--- a/drivers/isdn/hisax/diva.c
+++ b/drivers/isdn/hisax/diva.c
@@ -1159,21 +1159,21 @@ static int __devinit setup_diva_pci(struct
IsdnCard *card)
 	struct IsdnCardState *cs = card->cs;
 
 	cs->subtyp = 0;
-	if ((dev_diva = pci_find_device(PCI_VENDOR_ID_EICON,
+	if ((dev_diva = pci_get_device(PCI_VENDOR_ID_EICON,
 		PCI_DEVICE_ID_EICON_DIVA20, dev_diva))) {
 		if (pci_enable_device(dev_diva))
 			return(0);
 		cs->subtyp = DIVA_PCI;
 		cs->irq = dev_diva->irq;
 		cs->hw.diva.cfg_reg = pci_resource_start(dev_diva, 2);
-	} else if ((dev_diva_u = pci_find_device(PCI_VENDOR_ID_EICON,
+	} else if ((dev_diva_u = pci_get_device(PCI_VENDOR_ID_EICON,
 		PCI_DEVICE_ID_EICON_DIVA20_U, dev_diva_u))) {
 		if (pci_enable_device(dev_diva_u))
 			return(0);
 		cs->subtyp = DIVA_PCI;
 		cs->irq = dev_diva_u->irq;
 		cs->hw.diva.cfg_reg = pci_resource_start(dev_diva_u, 2);
-	} else if ((dev_diva201 = pci_find_device(PCI_VENDOR_ID_EICON,
+	} else if ((dev_diva201 = pci_get_device(PCI_VENDOR_ID_EICON,
 		PCI_DEVICE_ID_EICON_DIVA201, dev_diva201))) {
 		if (pci_enable_device(dev_diva201))
 			return(0);
@@ -1183,7 +1183,7 @@ static int __devinit setup_diva_pci(struct
IsdnCard *card)
 			(ulong) ioremap(pci_resource_start(dev_diva201, 0), 4096);
 		cs->hw.diva.cfg_reg  			(ulong) ioremap(pci_resource_start(dev_diva201, 1), 4096);
-	} else if ((dev_diva202 = pci_find_device(PCI_VENDOR_ID_EICON,
+	} else if ((dev_diva202 = pci_get_device(PCI_VENDOR_ID_EICON,
 		PCI_DEVICE_ID_EICON_DIVA202, dev_diva202))) {
 		if (pci_enable_device(dev_diva202))
 			return(0);


