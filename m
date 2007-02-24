From: Surya <surya.prabhakar@wipro.com>
Date: Sat, 24 Feb 2007 07:01:58 +0000
Subject: [KJ] Patch4:replace pci_find_device in isdn/hisax/diva.c
Message-Id: <1172299798.16371.20.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
   Replacing the pci_find_device in the isdn/hisax/diva.c and a bit of
cleanup.

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 

diff --git a/drivers/isdn/hisax/diva.c b/drivers/isdn/hisax/diva.c
index 6eebeb4..fe4d649 100644
--- a/drivers/isdn/hisax/diva.c
+++ b/drivers/isdn/hisax/diva.c
@@ -907,9 +907,6 @@ Diva_card_msg(struct IsdnCardState *cs,
 }
 
 static struct pci_dev *dev_diva __devinitdata = NULL;
-static struct pci_dev *dev_diva_u __devinitdata = NULL;
-static struct pci_dev *dev_diva201 __devinitdata = NULL;
-static struct pci_dev *dev_diva202 __devinitdata = NULL;
 
 #ifdef __ISAPNP__
 static struct isapnp_device_id diva_ids[] __devinitdata = {
@@ -1047,40 +1044,40 @@ setup_diva(struct IsdnCard *card)
 #endif
 #ifdef CONFIG_PCI
 		cs->subtyp = 0;
-		if ((dev_diva = pci_find_device(PCI_VENDOR_ID_EICON,
+		if ((dev_diva = pci_get_device(PCI_VENDOR_ID_EICON,
 			PCI_DEVICE_ID_EICON_DIVA20, dev_diva))) {
 			if (pci_enable_device(dev_diva))
-				return(0);
+				goto dev_diva_cleanup;
 			cs->subtyp = DIVA_PCI;
 			cs->irq = dev_diva->irq;
 			cs->hw.diva.cfg_reg = pci_resource_start(dev_diva, 2);
-		} else if ((dev_diva_u = pci_find_device(PCI_VENDOR_ID_EICON,
-			PCI_DEVICE_ID_EICON_DIVA20_U, dev_diva_u))) {
-			if (pci_enable_device(dev_diva_u))
-				return(0);
+		} else if ((dev_diva = pci_get_device(PCI_VENDOR_ID_EICON,
+			PCI_DEVICE_ID_EICON_DIVA20_U, dev_diva))) {
+			if (pci_enable_device(dev_diva))
+				goto dev_diva_cleanup;
 			cs->subtyp = DIVA_PCI;
-			cs->irq = dev_diva_u->irq;
-			cs->hw.diva.cfg_reg = pci_resource_start(dev_diva_u, 2);
-		} else if ((dev_diva201 = pci_find_device(PCI_VENDOR_ID_EICON,
-			PCI_DEVICE_ID_EICON_DIVA201, dev_diva201))) {
-			if (pci_enable_device(dev_diva201))
-				return(0);
+			cs->irq = dev_diva->irq;
+			cs->hw.diva.cfg_reg = pci_resource_start(dev_diva, 2);
+		} else if ((dev_diva = pci_get_device(PCI_VENDOR_ID_EICON,
+			PCI_DEVICE_ID_EICON_DIVA201, dev_diva))) {
+			if (pci_enable_device(dev_diva))
+				goto dev_diva_cleanup;
 			cs->subtyp = DIVA_IPAC_PCI;
-			cs->irq = dev_diva201->irq;
+			cs->irq = dev_diva->irq;
 			cs->hw.diva.pci_cfg -				(ulong) ioremap(pci_resource_start(dev_diva201, 0), 4096);
+				(ulong) ioremap(pci_resource_start(dev_diva, 0), 4096);
 			cs->hw.diva.cfg_reg -				(ulong) ioremap(pci_resource_start(dev_diva201, 1), 4096);
-		} else if ((dev_diva202 = pci_find_device(PCI_VENDOR_ID_EICON,
-			PCI_DEVICE_ID_EICON_DIVA202, dev_diva202))) {
-			if (pci_enable_device(dev_diva202))
-				return(0);
+				(ulong) ioremap(pci_resource_start(dev_diva, 1), 4096);
+		} else if ((dev_diva = pci_get_device(PCI_VENDOR_ID_EICON,
+			PCI_DEVICE_ID_EICON_DIVA202, dev_diva))) {
+			if (pci_enable_device(dev_diva))
+				goto dev_diva_cleanup;
 			cs->subtyp = DIVA_IPACX_PCI;
-			cs->irq = dev_diva202->irq;
+			cs->irq = dev_diva->irq;
 			cs->hw.diva.pci_cfg -				(ulong) ioremap(pci_resource_start(dev_diva202, 0), 4096);
+				(ulong) ioremap(pci_resource_start(dev_diva, 0), 4096);
 			cs->hw.diva.cfg_reg -				(ulong) ioremap(pci_resource_start(dev_diva202, 1), 4096);
+				(ulong) ioremap(pci_resource_start(dev_diva, 1), 4096);
 		} else {
 			printk(KERN_WARNING "Diva: No PCI card found\n");
 			return(0);
@@ -1089,13 +1086,13 @@ setup_diva(struct IsdnCard *card)
 		if (!cs->irq) {
 			printk(KERN_WARNING "Diva: No IRQ for PCI card found\n");
 			iounmap_diva(cs);
-			return(0);
+			goto dev_diva_cleanup;
 		}
 
 		if (!cs->hw.diva.cfg_reg) {
 			printk(KERN_WARNING "Diva: No IO-Adr for PCI card found\n");
 			iounmap_diva(cs);
-			return(0);
+			goto dev_diva_cleanup;
 		}
 		cs->irq_flags |= IRQF_SHARED;
 #else
@@ -1129,12 +1126,12 @@ ready:
 	printk(KERN_INFO
 		"Diva: %s card configured at %#lx IRQ %d\n",
 		(cs->subtyp = DIVA_PCI) ? "PCI" :
-		(cs->subtyp = DIVA_ISA) ? "ISA" : 
+		(cs->subtyp = DIVA_ISA) ? "ISA" :
 		(cs->subtyp = DIVA_IPAC_ISA) ? "IPAC ISA" :
 		(cs->subtyp = DIVA_IPAC_PCI) ? "IPAC PCI" : "IPACX PCI",
 		cs->hw.diva.cfg_reg, cs->irq);
-	if ((cs->subtyp = DIVA_IPAC_PCI)  || 
-	    (cs->subtyp = DIVA_IPACX_PCI) || 
+	if ((cs->subtyp = DIVA_IPAC_PCI)  ||
+	    (cs->subtyp = DIVA_IPACX_PCI) ||
 	    (cs->subtyp = DIVA_PCI)         )
 		printk(KERN_INFO "Diva: %s space at %#lx\n",
 			(cs->subtyp = DIVA_PCI) ? "PCI" :
@@ -1149,7 +1146,7 @@ ready:
 			       cs->hw.diva.cfg_reg,
 			       cs->hw.diva.cfg_reg + bytecnt);
 			iounmap_diva(cs);
-			return (0);
+			goto dev_diva_cleanup;
 		}
 	}
 	cs->BC_Read_Reg  = &ReadHSCX;
@@ -1185,7 +1182,7 @@ ready:
 		cs->BC_Write_Reg = &MemWriteHSCX_IPACX;
 		cs->BC_Send_Data = NULL; // function located in ipacx module
 		cs->irq_func = &diva_irq_ipacx_pci;
-		printk(KERN_INFO "Diva: IPACX Design Id: %x\n", 
+		printk(KERN_INFO "Diva: IPACX Design Id: %x\n",
 			MemReadISAC_IPACX(cs, IPACX_ID) &0x3F);
 	} else { /* DIVA 2.0 */
 		cs->hw.diva.tl.function = (void *) diva_led_handler;
@@ -1201,8 +1198,14 @@ ready:
 			printk(KERN_WARNING
 		       "Diva: wrong HSCX versions check IO address\n");
 			release_io_diva(cs);
-			return (0);
+			goto dev_diva_cleanup;
 		}
 	}
+
+	pci_dev_put(dev_diva);
 	return (1);
+
+dev_diva_cleanup:
+	pci_dev_put(dev_diva);
+	return 0;
 }


--surya.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
