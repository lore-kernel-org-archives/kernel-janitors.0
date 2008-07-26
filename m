From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:45:13 +0000
Subject: [PATCH 12/14] drivers/isdn/hisax/gazel.c: fix warning
Message-Id: <1217101513.6107.138.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warning:

drivers/isdn/hisax/gazel.c: In function ‘setup_gazelpci’:
drivers/isdn/hisax/gazel.c:549: warning: ‘pci_find_device’ is deprecated
(declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/gazel.c b/drivers/isdn/hisax/gazel.c
index 0ea3b46..16fe01c 100644
--- a/drivers/isdn/hisax/gazel.c
+++ b/drivers/isdn/hisax/gazel.c
@@ -546,7 +546,7 @@ setup_gazelpci(struct IsdnCardState *cs)
 	found = 0;
 	seekcard = PCI_DEVICE_ID_PLX_R685;
 	for (nbseek = 0; nbseek < 4; nbseek++) {
-		if ((dev_tel = pci_find_device(PCI_VENDOR_ID_PLX,
+		if ((dev_tel = pci_get_device(PCI_VENDOR_ID_PLX,
 					seekcard, dev_tel))) {
 			if (pci_enable_device(dev_tel))
 				return 1;


