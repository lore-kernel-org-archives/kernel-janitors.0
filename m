From: Surya <surya.prabhakar@wipro.com>
Date: Mon, 12 Mar 2007 11:24:55 +0000
Subject: [KJ] Patch15:replace pci_find_device in isdn/hisax/w6692.c
Message-Id: <1173697975.14236.24.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
    Replacing pci_find_device in w6692.c (isdn/hisax)

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 


diff --git a/drivers/isdn/hisax/w6692.c b/drivers/isdn/hisax/w6692.c
index 3aeceaf..2ad414b 100644
--- a/drivers/isdn/hisax/w6692.c
+++ b/drivers/isdn/hisax/w6692.c
@@ -1011,7 +1011,7 @@ setup_w6692(struct IsdnCard *card)
 		return (0);
 #ifdef CONFIG_PCI
 	while (id_list[id_idx].vendor_id) {
-		dev_w6692 = pci_find_device(id_list[id_idx].vendor_id,
+		dev_w6692 = pci_get_device(id_list[id_idx].vendor_id,
 					    id_list[id_idx].device_id,
 					    dev_w6692);
 		if (dev_w6692) {
@@ -1043,11 +1043,11 @@ setup_w6692(struct IsdnCard *card)
 	cs->irq = pci_irq;
 	if (!cs->irq) {
 		printk(KERN_WARNING "W6692: No IRQ for PCI card found\n");
-		return (0);
+		goto dev_w6692_cleanup;
 	}
 	if (!pci_ioaddr) {
 		printk(KERN_WARNING "W6692: NO I/O Base Address found\n");
-		return (0);
+		goto dev_w6692_cleanup;
 	}
 	cs->hw.w6692.iobase = pci_ioaddr;
 	printk(KERN_INFO "Found: %s %s, I/O base: 0x%x, irq: %d\n",
@@ -1059,7 +1059,7 @@ setup_w6692(struct IsdnCard *card)
 		       id_list[cs->subtyp].card_name,
 		       cs->hw.w6692.iobase,
 		       cs->hw.w6692.iobase + 255);
-		return (0);
+		goto dev_w6692_cleanup;
 	}
 #else
 	printk(KERN_WARNING "HiSax: W6692 and NO_PCI_BIOS\n");
@@ -1089,5 +1089,11 @@ setup_w6692(struct IsdnCard *card)
 	printk(KERN_INFO "W6692 D_EXIR=0x%X\n", ReadW6692(cs, W_D_EXIR));
 	printk(KERN_INFO "W6692 D_EXIM=0x%X\n", ReadW6692(cs, W_D_EXIM));
 	printk(KERN_INFO "W6692 D_RSTA=0x%X\n", ReadW6692(cs, W_D_RSTA));
+
+	pci_dev_put(dev_w6692);
 	return (1);
+
+dev_w6692_cleanup:
+		pci_dev_put(dev_w6692);
+	return (0);
 }

-- 
surya.
12/03/2007
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
