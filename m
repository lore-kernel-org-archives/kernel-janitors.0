From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:45:10 +0000
Subject: [PATCH 11/14] drivers/isdn/hisax/bkm_a8.c: fix warning
Message-Id: <1217101510.6107.137.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warning:

drivers/isdn/hisax/bkm_a8.c: In function ‘setup_sct_quadro’:
drivers/isdn/hisax/bkm_a8.c:304: warning: ‘pci_find_device’ is
deprecated (declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/bkm_a8.c b/drivers/isdn/hisax/bkm_a8.c
index e1ff471..b5ff766 100644
--- a/drivers/isdn/hisax/bkm_a8.c
+++ b/drivers/isdn/hisax/bkm_a8.c
@@ -301,7 +301,7 @@ setup_sct_quadro(struct IsdnCard *card)
 		(sub_vendor_id != PCI_VENDOR_ID_BERKOM)))
 		return (0);
 	if (cs->subtyp = SCT_1) {
-		while ((dev_a8 = pci_find_device(PCI_VENDOR_ID_PLX,
+		while ((dev_a8 = pci_get_device(PCI_VENDOR_ID_PLX,
 			PCI_DEVICE_ID_PLX_9050, dev_a8))) {
 			
 			sub_vendor_id = dev_a8->subsystem_vendor;


