From: Surya <surya.prabhakar@wipro.com>
Date: Thu, 22 Feb 2007 08:23:11 +0000
Subject: [KJ] Patch2:replace pci_find_device in bkm_a4t.c
Message-Id: <1172131871.4577.4.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
  Another replacement of pci_find_device in bkm_a4t.c (isdn drivers)

thanks..

Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 

diff --git a/drivers/isdn/hisax/bkm_a4t.c b/drivers/isdn/hisax/bkm_a4t.c
index 871310d..7b3b849 100644
--- a/drivers/isdn/hisax/bkm_a4t.c
+++ b/drivers/isdn/hisax/bkm_a4t.c
@@ -275,7 +275,7 @@ setup_bkm_a4t(struct IsdnCard *card)
 		return (0);
 
 #ifdef CONFIG_PCI
-	while ((dev_a4t = pci_find_device(PCI_VENDOR_ID_ZORAN,
+	while ((dev_a4t = pci_get_device(PCI_VENDOR_ID_ZORAN,
 		PCI_DEVICE_ID_ZORAN_36120, dev_a4t))) {
 		u16 sub_sys;
 		u16 sub_vendor;
@@ -284,7 +284,7 @@ setup_bkm_a4t(struct IsdnCard *card)
 		sub_sys = dev_a4t->subsystem_device;
 		if ((sub_sys = PCI_DEVICE_ID_BERKOM_A4T) && (sub_vendor = PCI_VENDOR_ID_BERKOM)) {
 			if (pci_enable_device(dev_a4t))
-				return(0);
+				goto dev_a4t_cleanup;
 			found = 1;
 			pci_memaddr = pci_resource_start(dev_a4t, 0);
 			cs->irq = dev_a4t->irq;
@@ -297,11 +297,11 @@ setup_bkm_a4t(struct IsdnCard *card)
 	}
 	if (!cs->irq) {		/* IRQ range check ?? */
 		printk(KERN_WARNING "HiSax: %s: No IRQ\n", CardType[card->typ]);
-		return (0);
+		goto dev_a4t_cleanup;
 	}
 	if (!pci_memaddr) {
 		printk(KERN_WARNING "HiSax: %s: No Memory base address\n", CardType[card->typ]);
-		return (0);
+		goto dev_a4t_cleanup;
 	}
 	cs->hw.ax.base = (long) ioremap(pci_memaddr, 4096);
 	/* Check suspecious address */
@@ -311,7 +311,7 @@ setup_bkm_a4t(struct IsdnCard *card)
 		       CardType[card->typ], cs->hw.ax.base, cs->hw.ax.base + 4096);
 		iounmap((void *) cs->hw.ax.base);
 		cs->hw.ax.base = 0;
-		return (0);
+		goto dev_a4t_cleanup;
 	}
 	cs->hw.ax.isac_adr = cs->hw.ax.base + PO_OFFSET;
 	cs->hw.ax.jade_adr = cs->hw.ax.base + PO_OFFSET;
@@ -339,5 +339,10 @@ setup_bkm_a4t(struct IsdnCard *card)
 	ISACVersion(cs, "Telekom A4T:");
 	/* Jade version */
 	JadeVersion(cs, "Telekom A4T:");
+	pci_dev_put(dev_a4t);
 	return (1);
+
+dev_a4t_cleanup:
+	pci_dev_put(dev_a4t);
+	return 0;
 }

-- 
surya.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
