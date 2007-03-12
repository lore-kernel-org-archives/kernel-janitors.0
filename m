From: Surya <surya.prabhakar@wipro.com>
Date: Mon, 12 Mar 2007 09:49:30 +0000
Subject: [KJ] Patch9:replace pci_find_device in isdn/gazel.c
Message-Id: <1173692250.13915.3.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
    Replacing pci_find_device in gazel.c (isdn/hisax)
Applies and compiles clean on latest tree.

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 


diff --git a/drivers/isdn/hisax/gazel.c b/drivers/isdn/hisax/gazel.c
index 3efa719..a8a36cb 100644
--- a/drivers/isdn/hisax/gazel.c
+++ b/drivers/isdn/hisax/gazel.c
@@ -546,10 +546,10 @@ setup_gazelpci(struct IsdnCardState *cs)
 	found = 0;
 	seekcard = PCI_DEVICE_ID_PLX_R685;
 	for (nbseek = 0; nbseek < 4; nbseek++) {
-		if ((dev_tel = pci_find_device(PCI_VENDOR_ID_PLX,
+		if ((dev_tel = pci_get_device(PCI_VENDOR_ID_PLX,
 					seekcard, dev_tel))) {
-			if (pci_enable_device(dev_tel))
-				return 1;
+				if (pci_enable_device(dev_tel))
+					goto dev_tel_cleanup;
 			pci_irq = dev_tel->irq;
 			pci_ioaddr0 = pci_resource_start(dev_tel, 1);
 			pci_ioaddr1 = pci_resource_start(dev_tel, 2);
@@ -577,7 +577,7 @@ setup_gazelpci(struct IsdnCardState *cs)
 	}
 	if (!pci_irq) {
 		printk(KERN_WARNING "Gazel: No IRQ for PCI card found\n");
-		return 1;
+		goto dev_tel_cleanup;
 	}
 	cs->hw.gazel.pciaddr[0] = pci_ioaddr0;
 	cs->hw.gazel.pciaddr[1] = pci_ioaddr1;
@@ -618,7 +618,12 @@ setup_gazelpci(struct IsdnCardState *cs)
 			break;
 	}
 
+	pci_dev_put(dev_tel);
 	return (0);
+
+dev_tel_cleanup:
+	pci_dev_put(dev_tel);
+	return 1;
 }
 
 int __devinit

-- 
surya.
12/03/2007
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
