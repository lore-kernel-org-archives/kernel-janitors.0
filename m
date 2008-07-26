From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:45:08 +0000
Subject: [PATCH 10/14] drivers/isdn/hisax/bkm_a4t.c: fix warning
Message-Id: <1217101508.6107.136.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warning:

drivers/isdn/hisax/bkm_a4t.c: In function ‘setup_bkm_a4t’:
drivers/isdn/hisax/bkm_a4t.c:343: warning: ‘pci_find_device’ is
deprecated (declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/bkm_a4t.c b/drivers/isdn/hisax/bkm_a4t.c
index 9ca2ee5..fca0acb 100644
--- a/drivers/isdn/hisax/bkm_a4t.c
+++ b/drivers/isdn/hisax/bkm_a4t.c
@@ -340,7 +340,7 @@ setup_bkm_a4t(struct IsdnCard *card)
 	} else
 		return (0);
 
-	while ((dev_a4t = pci_find_device(PCI_VENDOR_ID_ZORAN,
+	while ((dev_a4t = pci_get_device(PCI_VENDOR_ID_ZORAN,
 		PCI_DEVICE_ID_ZORAN_36120, dev_a4t))) {
 		ret = a4t_pci_probe(dev_a4t, cs, &found, &pci_memaddr);
 		if (!ret)


