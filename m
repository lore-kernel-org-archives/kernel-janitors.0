From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:44:56 +0000
Subject: [PATCH 6/14] drivers/isdn/hisax/nj_s.c: fix warning
Message-Id: <1217101496.6107.132.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warnings:

drivers/isdn/hisax/nj_s.c: In function ‘setup_netjet_s’:
drivers/isdn/hisax/nj_s.c:279: warning: ‘pci_find_device’ is deprecated
(declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/nj_s.c b/drivers/isdn/hisax/nj_s.c
index 8d36ccc..f8f379f 100644
--- a/drivers/isdn/hisax/nj_s.c
+++ b/drivers/isdn/hisax/nj_s.c
@@ -276,7 +276,7 @@ setup_netjet_s(struct IsdnCard *card)
 
 	for ( ;; )
 	{
-		if ((dev_netjet = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+		if ((dev_netjet = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 			PCI_DEVICE_ID_TIGERJET_300,  dev_netjet))) {
 			ret = njs_pci_probe(dev_netjet, cs);
 			if (!ret)


