From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:44:34 +0000
Subject: [PATCH 1/14] drivers/isdn/hisax/telespci.c: fix warning
Message-Id: <1217101474.6107.127.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warning:

drivers/isdn/hisax/telespci.c: In function ‘setup_telespci’:
drivers/isdn/hisax/telespci.c:303: warning: ‘pci_find_device’ is
deprecated (declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/telespci.c
b/drivers/isdn/hisax/telespci.c
index 28b08de..9ed0862 100644
--- a/drivers/isdn/hisax/telespci.c
+++ b/drivers/isdn/hisax/telespci.c
@@ -300,7 +300,8 @@ setup_telespci(struct IsdnCard *card)
        if (cs->typ != ISDN_CTYPE_TELESPCI)
                return (0);
 
-       if ((dev_tel = pci_find_device (PCI_VENDOR_ID_ZORAN,
PCI_DEVICE_ID_ZORAN_36120, dev_tel))) {
+       if ((dev_tel = pci_get_device(PCI_VENDOR_ID_ZORAN,
+               PCI_DEVICE_ID_ZORAN_36120, dev_tel))) {
                if (pci_enable_device(dev_tel))
                        return(0);
                cs->irq = dev_tel->irq;



