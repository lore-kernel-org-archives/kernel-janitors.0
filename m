From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:44:40 +0000
Subject: [PATCH 2/14]  drivers/isdn/hisax/avm_pci.c: fix warning
Message-Id: <1217101480.6107.128.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warning:

drivers/isdn/hisax/avm_pci.c: In function ‘avm_pci_setup’:
drivers/isdn/hisax/avm_pci.c:838: warning: ‘pci_find_device’ is
deprecated (declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/avm_pci.c b/drivers/isdn/hisax/avm_pci.c
index 7cabc5a..21e4d32 100644
--- a/drivers/isdn/hisax/avm_pci.c
+++ b/drivers/isdn/hisax/avm_pci.c
@@ -835,7 +835,7 @@ static struct pci_dev *dev_avm __devinitdata = NULL;
 
 static int __devinit avm_pci_setup(struct IsdnCardState *cs)
 {
-	if ((dev_avm = pci_find_device(PCI_VENDOR_ID_AVM,
+	if ((dev_avm = pci_get_device(PCI_VENDOR_ID_AVM,
 		PCI_DEVICE_ID_AVM_A1, dev_avm))) {
 
 		if (pci_enable_device(dev_avm))


