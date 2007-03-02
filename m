From: Surya <surya.prabhakar@wipro.com>
Date: Fri, 02 Mar 2007 11:05:49 +0000
Subject: [KJ] Patch5:replace pci_find_device in elsa.c
Message-Id: <1172832829.4511.15.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi ,
  Cleanup of pci_find_device to pci_get_device.Applies and complies clean.Not tested!!

thanks.


diff --git a/drivers/isdn/hisax/elsa.c b/drivers/isdn/hisax/elsa.c
index fab3e4e..a7dfb07 100644
--- a/drivers/isdn/hisax/elsa.c
+++ b/drivers/isdn/hisax/elsa.c
@@ -832,8 +832,7 @@ probe_elsa(struct IsdnCardState *cs)
 	return (CARD_portlist[i]);
 }
 
-static 	struct pci_dev *dev_qs1000 __devinitdata = NULL;
-static 	struct pci_dev *dev_qs3000 __devinitdata = NULL;
+static 	struct pci_dev *dev_qsx __devinitdata = NULL;
 
 #ifdef __ISAPNP__
 static struct isapnp_device_id elsa_ids[] __devinitdata = {
@@ -1021,34 +1020,34 @@ setup_elsa(struct IsdnCard *card)
 	} else if (cs->typ = ISDN_CTYPE_ELSA_PCI) {
 #ifdef CONFIG_PCI
 		cs->subtyp = 0;
-		if ((dev_qs1000 = pci_find_device(PCI_VENDOR_ID_ELSA,
-			PCI_DEVICE_ID_ELSA_MICROLINK, dev_qs1000))) {
-			if (pci_enable_device(dev_qs1000))
-				return(0);
-			cs->subtyp = ELSA_QS1000PCI;
-			cs->irq = dev_qs1000->irq;
-			cs->hw.elsa.cfg = pci_resource_start(dev_qs1000, 1);
-			cs->hw.elsa.base = pci_resource_start(dev_qs1000, 3);
-		} else if ((dev_qs3000 = pci_find_device(PCI_VENDOR_ID_ELSA,
-			PCI_DEVICE_ID_ELSA_QS3000, dev_qs3000))) {
-			if (pci_enable_device(dev_qs3000))
-				return(0);
+		if ((dev_qsx = pci_get_device(PCI_VENDOR_ID_ELSA,
+			PCI_DEVICE_ID_ELSA_MICROLINK, dev_qsx))) {
+				if (pci_enable_device(dev_qsx))
+					goto dev_qsx_cleanup;
+				cs->subtyp = ELSA_QS1000PCI;
+			cs->irq = dev_qsx->irq;
+			cs->hw.elsa.cfg = pci_resource_start(dev_qsx, 1);
+			cs->hw.elsa.base = pci_resource_start(dev_qsx, 3);
+		} else if ((dev_qsx = pci_get_device(PCI_VENDOR_ID_ELSA,
+			PCI_DEVICE_ID_ELSA_QS3000, dev_qsx))) {
+				if (pci_enable_device(dev_qsx))
+					goto dev_qsx_cleanup;
 			cs->subtyp = ELSA_QS3000PCI;
-			cs->irq = dev_qs3000->irq;
-			cs->hw.elsa.cfg = pci_resource_start(dev_qs3000, 1);
-			cs->hw.elsa.base = pci_resource_start(dev_qs3000, 3);
+			cs->irq = dev_qsx->irq;
+			cs->hw.elsa.cfg = pci_resource_start(dev_qsx, 1);
+			cs->hw.elsa.base = pci_resource_start(dev_qsx, 3);
 		} else {
 			printk(KERN_WARNING "Elsa: No PCI card found\n");
 			return(0);
 		}
 		if (!cs->irq) {
 			printk(KERN_WARNING "Elsa: No IRQ for PCI card found\n");
-			return(0);
+			goto dev_qsx_cleanup;
 		}
 
 		if (!(cs->hw.elsa.base && cs->hw.elsa.cfg)) {
 			printk(KERN_WARNING "Elsa: No IO-Adr for PCI card found\n");
-			return(0);
+			goto dev_qsx_cleanup;
 		}
 		if ((cs->hw.elsa.cfg & 0xff) || (cs->hw.elsa.base & 0xf)) {
 			printk(KERN_WARNING "Elsa: You may have a wrong PCI bios\n");
@@ -1097,7 +1096,7 @@ setup_elsa(struct IsdnCard *card)
 		default:
 			printk(KERN_WARNING
 			       "Unknown ELSA subtype %d\n", cs->subtyp);
-			return (0);
+			goto dev_qsx_cleanup;
 	}
 	/* In case of the elsa pcmcia card, this region is in use,
 	   reserved for us by the card manager. So we do not check it
@@ -1108,7 +1107,7 @@ setup_elsa(struct IsdnCard *card)
 		       CardType[card->typ],
 		       cs->hw.elsa.base,
 		       cs->hw.elsa.base + bytecnt);
-		return (0);
+			goto dev_qsx_cleanup;
 	}
 	if ((cs->subtyp = ELSA_QS1000PCI) || (cs->subtyp = ELSA_QS3000PCI)) {
 		if (!request_region(cs->hw.elsa.cfg, 0x80, "elsa isdn pci")) {
@@ -1118,7 +1117,7 @@ setup_elsa(struct IsdnCard *card)
 				cs->hw.elsa.cfg,
 				cs->hw.elsa.cfg + 0x80);
 			release_region(cs->hw.elsa.base, bytecnt);
-			return (0);
+			goto dev_qsx_cleanup;
 		}
 	}
 #if ARCOFI_USE
@@ -1138,14 +1137,14 @@ setup_elsa(struct IsdnCard *card)
 				printk(KERN_WARNING
 				       "Elsa: timer do not start\n");
 				release_io_elsa(cs);
-				return (0);
+				goto dev_qsx_cleanup;
 			}
 		}
 		HZDELAY((HZ/100) + 1);	/* wait > ms */
 		if (TimerRun(cs)) {
 			printk(KERN_WARNING "Elsa: timer do not run down\n");
 			release_io_elsa(cs);
-			return (0);
+			goto dev_qsx_cleanup;
 		}
 		printk(KERN_INFO "Elsa: timer OK; resetting card\n");
 	}
@@ -1172,7 +1171,7 @@ setup_elsa(struct IsdnCard *card)
 			printk(KERN_WARNING
 				"Elsa: wrong HSCX versions check IO address\n");
 			release_io_elsa(cs);
-			return (0);
+			goto dev_qsx_cleanup;
 		}
 	}
 	if (cs->subtyp = ELSA_PC) {
@@ -1184,5 +1183,10 @@ setup_elsa(struct IsdnCard *card)
 		writeitac(cs, ITAC_SCIE, 0);
 		writeitac(cs, ITAC_STIE, 0);
 	}
+	pci_dev_put(dev_qsx);
 	return (1);
+
+dev_qsx_cleanup:
+		pci_dev_put(dev_qsx);
+		return (0);
 }

-- 
surya.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
