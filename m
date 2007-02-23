From: Surya <surya.prabhakar@wipro.com>
Date: Fri, 23 Feb 2007 11:24:33 +0000
Subject: [KJ] Patch3:replace pci_find_device in bkm_a8.c
Message-Id: <1172229153.14057.5.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
    Replacing pci_find_device in bkm_a8.c (isdn/hisax)

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 

diff --git a/drivers/isdn/hisax/bkm_a8.c b/drivers/isdn/hisax/bkm_a8.c
index 3403106..c6c9ef7 100644
--- a/drivers/isdn/hisax/bkm_a8.c
+++ b/drivers/isdn/hisax/bkm_a8.c
@@ -310,15 +310,14 @@ setup_sct_quadro(struct IsdnCard *card)
 		(sub_vendor_id != PCI_VENDOR_ID_BERKOM)))
 		return (0);
 	if (cs->subtyp = SCT_1) {
-		while ((dev_a8 = pci_find_device(PCI_VENDOR_ID_PLX,
+		while ((dev_a8 = pci_get_device(PCI_VENDOR_ID_PLX,
 			PCI_DEVICE_ID_PLX_9050, dev_a8))) {
-			
 			sub_vendor_id = dev_a8->subsystem_vendor;
 			sub_sys_id = dev_a8->subsystem_device;
 			if ((sub_sys_id = PCI_DEVICE_ID_BERKOM_SCITEL_QUADRO) &&
 				(sub_vendor_id = PCI_VENDOR_ID_BERKOM)) {
 				if (pci_enable_device(dev_a8))
-					return(0);
+					goto dev_a8_cleanup;
 				pci_ioaddr1 = pci_resource_start(dev_a8, 1);
 				pci_irq = dev_a8->irq;
 				pci_bus = dev_a8->bus->number;
@@ -354,7 +353,7 @@ setup_sct_quadro(struct IsdnCard *card)
 		printk(KERN_WARNING "HiSax: %s (%s): No IRQ\n",
 		       CardType[card->typ],
 		       sct_quadro_subtypes[cs->subtyp]);
-		return (0);
+		goto dev_a8_cleanup;
 	}
 	pci_read_config_dword(dev_a8, PCI_BASE_ADDRESS_1, &pci_ioaddr1);
 	pci_read_config_dword(dev_a8, PCI_BASE_ADDRESS_2, &pci_ioaddr2);
@@ -365,7 +364,7 @@ setup_sct_quadro(struct IsdnCard *card)
 		printk(KERN_WARNING "HiSax: %s (%s): No IO base address(es)\n",
 		       CardType[card->typ],
 		       sct_quadro_subtypes[cs->subtyp]);
-		return (0);
+		goto dev_a8_cleanup;
 	}
 	pci_ioaddr1 &= PCI_BASE_ADDRESS_IO_MASK;
 	pci_ioaddr2 &= PCI_BASE_ADDRESS_IO_MASK;
@@ -386,9 +385,9 @@ setup_sct_quadro(struct IsdnCard *card)
 		case 1:
 			cs->hw.ax.base = pci_ioaddr5 + 0x00;
 			if (sct_alloc_io(pci_ioaddr1, 128))
-				return(0);
+				goto dev_a8_cleanup;
 			if (sct_alloc_io(pci_ioaddr5, 64))
-				return(0);
+				goto dev_a8_cleanup;
 			/* disable all IPAC */
 			writereg(pci_ioaddr5, pci_ioaddr5 + 4,
 				IPAC_MASK, 0xFF);
@@ -402,19 +401,19 @@ setup_sct_quadro(struct IsdnCard *card)
 		case 2:
 			cs->hw.ax.base = pci_ioaddr4 + 0x08;
 			if (sct_alloc_io(pci_ioaddr4, 64))
-				return(0);
+				goto dev_a8_cleanup;
 			break;
 		case 3:
 			cs->hw.ax.base = pci_ioaddr3 + 0x10;
 			if (sct_alloc_io(pci_ioaddr3, 64))
-				return(0);
+				goto dev_a8_cleanup;
 			break;
 		case 4:
 			cs->hw.ax.base = pci_ioaddr2 + 0x20;
 			if (sct_alloc_io(pci_ioaddr2, 64))
-				return(0);
+				goto dev_a8_cleanup;
 			break;
-	}	
+	}
 	/* For isac and hscx data path */
 	cs->hw.ax.data_adr = cs->hw.ax.base + 4;

@@ -443,8 +442,15 @@ setup_sct_quadro(struct IsdnCard *card)
 		CardType[card->typ],
 		sct_quadro_subtypes[cs->subtyp],
 		readreg(cs->hw.ax.base, cs->hw.ax.data_adr, IPAC_ID));
+
+	pci_dev_put(dev_a8);
 	return (1);
 #else
 	printk(KERN_ERR "HiSax: bkm_a8 only supported on PCI Systems\n");
+	return (1);
 #endif /* CONFIG_PCI */
+
+dev_a8_cleanup:
+	pci_dev_put(dev_a8);
+	return 0;
 }

-- 
surya.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
