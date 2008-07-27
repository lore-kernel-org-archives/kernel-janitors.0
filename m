From: Michael Borisov <niro@tut.by>
Date: Sun, 27 Jul 2008 16:37:45 +0000
Subject: Re: [PATCH 1/14 v2] drivers/isdn/hisax/telespci.c: fix warning
Message-Id: <1217176665.7323.10.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1217145098.6042.2.camel@inlin>
In-Reply-To: <1217145098.6042.2.camel@inlin>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/telespci.c
b/drivers/isdn/hisax/telespci.c
index 28b08de..2ebcbc9 100644
--- a/drivers/isdn/hisax/telespci.c
+++ b/drivers/isdn/hisax/telespci.c
@@ -300,7 +300,9 @@ setup_telespci(struct IsdnCard *card)
 	if (cs->typ != ISDN_CTYPE_TELESPCI)
 		return (0);
 
-	if ((dev_tel = pci_find_device (PCI_VENDOR_ID_ZORAN,
PCI_DEVICE_ID_ZORAN_36120, dev_tel))) {
+	dev_tel = pci_get_device (PCI_VENDOR_ID_ZORAN,
PCI_DEVICE_ID_ZORAN_36120, dev_tel);
+	if (dev_tel) {
+		pci_dev_put(dev_tel);
 		if (pci_enable_device(dev_tel))
 			return(0);
 		cs->irq = dev_tel->irq;


