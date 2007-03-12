From: Surya <surya.prabhakar@wipro.com>
Date: Mon, 12 Mar 2007 10:43:01 +0000
Subject: [KJ] Patch13:replace pci_find_device in isdn/hisax/sedlbauer.c
Message-Id: <1173695461.14236.16.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
    Replacing pci_find_device in sedlbauer.c (isdn/hisax)
Applies and compiles clean on latest tree.

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 


diff --git a/drivers/isdn/hisax/sedlbauer.c b/drivers/isdn/hisax/sedlbauer.c
index 030d162..0c3ed01 100644
--- a/drivers/isdn/hisax/sedlbauer.c
+++ b/drivers/isdn/hisax/sedlbauer.c
@@ -618,14 +618,14 @@ setup_sedlbauer(struct IsdnCard *card)
 #endif
 /* Probe for Sedlbauer speed pci */
 #ifdef CONFIG_PCI
-		if ((dev_sedl = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+		if ((dev_sedl = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 				PCI_DEVICE_ID_TIGERJET_100, dev_sedl))) {
 			if (pci_enable_device(dev_sedl))
-				return(0);
+				goto dev_sedl_cleanup;
 			cs->irq = dev_sedl->irq;
 			if (!cs->irq) {
 				printk(KERN_WARNING "Sedlbauer: No IRQ for PCI card found\n");
-				return(0);
+				goto dev_sedl_cleanup;
 			}
 			cs->hw.sedl.cfg_reg = pci_resource_start(dev_sedl, 0);
 		} else {
@@ -642,7 +642,7 @@ setup_sedlbauer(struct IsdnCard *card)
 			cs->hw.sedl.cfg_reg);
 		if (sub_id != PCI_SUB_ID_SEDLBAUER) {
 			printk(KERN_ERR "Sedlbauer: unknown sub id %#x\n", sub_id);
-			return(0);
+			goto dev_sedl_cleanup;
 		}
 		if (sub_vendor_id = PCI_SUBVENDOR_SPEEDFAX_PYRAMID) {
 			cs->hw.sedl.chip = SEDL_CHIP_ISAC_ISAR;
@@ -659,7 +659,7 @@ setup_sedlbauer(struct IsdnCard *card)
 		} else {
 			printk(KERN_ERR "Sedlbauer: unknown sub vendor id %#x\n",
 				sub_vendor_id);
-			return(0);
+			goto dev_sedl_cleanup;
 		}
 		bytecnt = 256;
 		cs->hw.sedl.reset_on = SEDL_ISAR_PCI_ISAR_RESET_ON;
@@ -676,10 +676,10 @@ setup_sedlbauer(struct IsdnCard *card)
 		printk(KERN_WARNING "Sedlbauer: NO_PCI_BIOS\n");
 		return (0);
 #endif /* CONFIG_PCI */
-	}	
+	}
 
 #ifdef __ISAPNP__
-ready:	
+ready:
 #endif
 
 	/* In case of the sedlbauer pcmcia card, this region is in use,
@@ -693,7 +693,7 @@ ready:
 			CardType[card->typ],
 			cs->hw.sedl.cfg_reg,
 			cs->hw.sedl.cfg_reg + bytecnt);
-			return (0);
+			goto dev_sedl_cleanup;
 	}
 
 	printk(KERN_INFO
@@ -804,7 +804,7 @@ ready:
 			}
 			if (!bytecnt) {
 				release_io_sedlbauer(cs);
-				return (0);
+				goto dev_sedl_cleanup;
 			}
 		} else {
 			if (cs->hw.sedl.bus = SEDL_BUS_PCMCIA) {
@@ -823,14 +823,19 @@ ready:
 			}
 			cs->irq_func = &sedlbauer_interrupt;
 			ISACVersion(cs, "Sedlbauer:");
-		
+
 			if (HscxVersion(cs, "Sedlbauer:")) {
 				printk(KERN_WARNING
 					"Sedlbauer: wrong HSCX versions check IO address\n");
 				release_io_sedlbauer(cs);
-				return (0);
+				goto dev_sedl_cleanup;
 			}
 		}
 	}
+	pci_dev_put(dev_sedl);
 	return (1);
+
+dev_sedl_cleanup:
+	pci_dev_put(dev_sedl);
+	return 0;
 }

-- 
surya.
12/03/2007
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
