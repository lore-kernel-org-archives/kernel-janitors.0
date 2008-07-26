From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:44:59 +0000
Subject: [PATCH 7/14] drivers/isdn/hisax/nj_u.c: fix warning
Message-Id: <1217101499.6107.133.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warning:

drivers/isdn/hisax/nj_u.c: In function ‘setup_netjet_u’:
drivers/isdn/hisax/nj_u.c:243: warning: ‘pci_find_device’ is deprecated
(declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/nj_u.c b/drivers/isdn/hisax/nj_u.c
index d306c94..eb84929 100644
--- a/drivers/isdn/hisax/nj_u.c
+++ b/drivers/isdn/hisax/nj_u.c
@@ -240,7 +240,7 @@ setup_netjet_u(struct IsdnCard *card)
 
 	for ( ;; )
 	{
-		if ((dev_netjet = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+		if ((dev_netjet = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 			PCI_DEVICE_ID_TIGERJET_300,  dev_netjet))) {
 			ret = nju_pci_probe(dev_netjet, cs);
 			if (!ret)


