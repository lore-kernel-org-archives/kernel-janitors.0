From: Surya <surya.prabhakar@wipro.com>
Date: Mon, 12 Mar 2007 10:50:14 +0000
Subject: [KJ] Patch14:replace pci_find_device in isdn/hisax/telespci.c
Message-Id: <1173695894.14236.19.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
    Replacing pci_find_device in telespci.c (isdn/hisax)
Applies and compiles clean on latest tree.

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 


diff --git a/drivers/isdn/hisax/telespci.c b/drivers/isdn/hisax/telespci.c
index d09f6d0..5061517 100644
--- a/drivers/isdn/hisax/telespci.c
+++ b/drivers/isdn/hisax/telespci.c
@@ -300,13 +300,13 @@ setup_telespci(struct IsdnCard *card)
 	if (cs->typ != ISDN_CTYPE_TELESPCI)
 		return (0);
 #ifdef CONFIG_PCI
-	if ((dev_tel = pci_find_device (PCI_VENDOR_ID_ZORAN, PCI_DEVICE_ID_ZORAN_36120, dev_tel))) {
+	if ((dev_tel = pci_get_device (PCI_VENDOR_ID_ZORAN, PCI_DEVICE_ID_ZORAN_36120, dev_tel))) {
 		if (pci_enable_device(dev_tel))
-			return(0);
+			goto dev_tel_cleanup;
 		cs->irq = dev_tel->irq;
 		if (!cs->irq) {
 			printk(KERN_WARNING "Teles: No IRQ for PCI card found\n");
-			return(0);
+			goto dev_tel_cleanup;
 		}
 		cs->hw.teles0.membase = ioremap(pci_resource_start(dev_tel, 0),
 			PAGE_SIZE);
@@ -353,7 +353,13 @@ setup_telespci(struct IsdnCard *card)
 		printk(KERN_WARNING
 		 "TelesPCI: wrong HSCX versions check IO/MEM addresses\n");
 		release_io_telespci(cs);
-		return (0);
+		goto dev_tel_cleanup;
 	}
+
+	pci_dev_put(dev_tel);
 	return (1);
+
+dev_tel_cleanup:
+	pci_dev_put(dev_tel);
+	return 0;
 }

-- 
surya.
12/03/2007
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
