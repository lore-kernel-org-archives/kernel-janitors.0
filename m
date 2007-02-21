From: Surya <surya.prabhakar@wipro.com>
Date: Wed, 21 Feb 2007 11:51:54 +0000
Subject: [KJ] replacing pci_find_device in isdn driver
Message-Id: <1172057994.8279.80.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
  replacing the pci_find_device with pci_get_device and its respective
cleanup function pci_dev_put. Applies and compiles clean on the latest
Linus tree. But not tested!!

thanks.

Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>

diff --git a/drivers/isdn/hisax/avm_pci.c b/drivers/isdn/hisax/avm_pci.c
index b04a178..2991780 100644
--- a/drivers/isdn/hisax/avm_pci.c
+++ b/drivers/isdn/hisax/avm_pci.c
@@ -789,19 +789,19 @@ setup_avm_pcipnp(struct IsdnCard *card)
 	}
 #endif
 #ifdef CONFIG_PCI
-	if ((dev_avm = pci_find_device(PCI_VENDOR_ID_AVM,
+	if ((dev_avm = pci_get_device(PCI_VENDOR_ID_AVM,
 		PCI_DEVICE_ID_AVM_A1,  dev_avm))) {
-		if (pci_enable_device(dev_avm))
-			return(0);
+			if (pci_enable_device(dev_avm)) 
+				goto dev_avm_cleanup;
 		cs->irq = dev_avm->irq;
 		if (!cs->irq) {
 			printk(KERN_ERR "FritzPCI: No IRQ for PCI card found\n");
-			return(0);
+			goto dev_avm_cleanup;
 		}
 		cs->hw.avm.cfg_reg = pci_resource_start(dev_avm, 1);
 		if (!cs->hw.avm.cfg_reg) {
 			printk(KERN_ERR "FritzPCI: No IO-Adr for PCI card found\n");
-			return(0);
+			goto dev_avm_cleanup;
 		}
 		cs->subtyp = AVM_FRITZ_PCI;
 	} else {
@@ -822,7 +822,7 @@ ready:
 		       CardType[card->typ],
 		       cs->hw.avm.cfg_reg,
 		       cs->hw.avm.cfg_reg + 31);
-		return (0);
+		goto dev_avm_cleanup;
 	}
 	switch (cs->subtyp) {
 	  case AVM_FRITZ_PCI:
@@ -842,7 +842,7 @@ ready:
 		break;
 	  default:
 	  	printk(KERN_WARNING "AVM unknown subtype %d\n", cs->subtyp);
-	  	return(0);
+		goto dev_avm_cleanup;
 	}
 	printk(KERN_INFO "HiSax: %s config irq:%d base:0x%X\n",
 		(cs->subtyp = AVM_FRITZ_PCI) ? "AVM Fritz!PCI" : "AVM Fritz!PnP",
@@ -858,5 +858,14 @@ ready:
 	cs->irq_func = &avm_pcipnp_interrupt;
 	cs->writeisac(cs, ISAC_MASK, 0xFF);
 	ISACVersion(cs, (cs->subtyp = AVM_FRITZ_PCI) ? "AVM PCI:" : "AVM PnP:");
+	
+	if (dev_avm) 
+		pci_dev_put(dev_avm);
+	
 	return (1);
+	
+dev_avm_cleanup:
+	if (dev_avm) 
+		pci_dev_put(dev_avm);
+	return 0;
 }

-- 
surya.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
