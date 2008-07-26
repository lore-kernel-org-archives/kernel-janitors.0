From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:45:18 +0000
Subject: [PATCH 14/14] drivers/isdn/hisax/enternow_pci.c: fix warning
Message-Id: <1217101518.6107.140.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warning:

drivers/isdn/hisax/enternow_pci.c: In function ‘setup_enternow_pci’:
drivers/isdn/hisax/enternow_pci.c:409: warning: ‘pci_find_device’ is
deprecated (declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/enternow_pci.c
b/drivers/isdn/hisax/enternow_pci.c
index 39f421e..367c32c 100644
--- a/drivers/isdn/hisax/enternow_pci.c
+++ b/drivers/isdn/hisax/enternow_pci.c
@@ -406,7 +406,7 @@ setup_enternow_pci(struct IsdnCard *card)
 
 	for ( ;; )
 	{
-		if ((dev_netjet = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+		if ((dev_netjet = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 			PCI_DEVICE_ID_TIGERJET_300,  dev_netjet))) {
 			ret = en_pci_probe(dev_netjet, cs);
 			if (!ret)


