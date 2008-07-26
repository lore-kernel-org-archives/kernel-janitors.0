From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:44:53 +0000
Subject: [PATCH 5/14] drivers/isdn/hisax/sedlbauer.c: fix warning
Message-Id: <1217101493.6107.131.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warnings:

drivers/isdn/hisax/sedlbauer.c: In function ‘setup_sedlbauer_pci’:
drivers/isdn/hisax/sedlbauer.c:612: warning: ‘pci_find_device’ is
deprecated (declared at include/linux/pci.h:535)


Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/sedlbauer.c
b/drivers/isdn/hisax/sedlbauer.c
index a10dfa8..9d8bca6 100644
--- a/drivers/isdn/hisax/sedlbauer.c
+++ b/drivers/isdn/hisax/sedlbauer.c
@@ -609,7 +609,7 @@ setup_sedlbauer_pci(struct IsdnCard *card)
 	struct IsdnCardState *cs = card->cs;
 	u16 sub_vendor_id, sub_id;
 
-	if ((dev_sedl = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+	if ((dev_sedl = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 			PCI_DEVICE_ID_TIGERJET_100, dev_sedl))) {
 		if (pci_enable_device(dev_sedl))
 			return(0);


