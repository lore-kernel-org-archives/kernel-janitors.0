From: Surya <surya.prabhakar@wipro.com>
Date: Fri, 02 Mar 2007 11:25:27 +0000
Subject: [KJ] Patch6:replace pci_find_device in isdn/hisax/enternow_pci.c
Message-Id: <1172834007.13966.2.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
  Changing pci_find_device to pci_get_device.Not tested but applies and
compiles clean

thanks ..

diff --git a/drivers/isdn/hisax/enternow_pci.c b/drivers/isdn/hisax/enternow_pci.c
index b45de9d..aed0e52 100644
--- a/drivers/isdn/hisax/enternow_pci.c
+++ b/drivers/isdn/hisax/enternow_pci.c
@@ -323,26 +323,26 @@ setup_enternow_pci(struct IsdnCard *card
 
 	for ( ;; )
 	{
-		if ((dev_netjet = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+		if ((dev_netjet = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 			PCI_DEVICE_ID_TIGERJET_300,  dev_netjet))) {
-			if (pci_enable_device(dev_netjet))
-				return(0);
+				if (pci_enable_device(dev_netjet))
+					goto dev_netjet_cleanup;
 			cs->irq = dev_netjet->irq;
 			if (!cs->irq) {
 				printk(KERN_WARNING "enter:now PCI: No IRQ for PCI card found\n");
-				return(0);
+				goto dev_netjet_cleanup;
 			}
 			cs->hw.njet.base = pci_resource_start(dev_netjet, 0);
 			if (!cs->hw.njet.base) {
 				printk(KERN_WARNING "enter:now PCI: No IO-Adr for PCI card found\n");
-				return(0);
+				goto dev_netjet_cleanup;
 			}
                         /* checks Sub-Vendor ID because system crashes with Traverse-Card */
 			if ((dev_netjet->subsystem_vendor != 0x55) ||
 				(dev_netjet->subsystem_device != 0x02)) {
 				printk(KERN_WARNING "enter:now: You tried to load this driver with an incompatible TigerJet-card\n");
                                 printk(KERN_WARNING "Use type  for Traverse NetJet PCI Card.\n");
-                                return(0);
+				goto dev_netjet_cleanup;
                         }
 		} else {
                         printk(KERN_WARNING "enter:now PCI: No PCI card found\n");
@@ -390,7 +390,7 @@ setup_enternow_pci(struct IsdnCard *card
 			   CardType[card->typ],
 			   cs->hw.njet.base,
 			   cs->hw.njet.base + bytecnt);
-		return (0);
+		goto dev_netjet_cleanup;
 	}
 	setup_Amd7930(cs);
 	cs->hw.njet.last_is0 = 0;
@@ -406,6 +406,10 @@ setup_enternow_pci(struct IsdnCard *card
 	cs->cardmsg = &enpci_card_msg;
 	cs->irq_func = &enpci_interrupt;
 	cs->irq_flags |= IRQF_SHARED;
-
+	pci_dev_put(dev_netjet);
         return (1);
+
+dev_netjet_cleanup:
+		pci_dev_put(dev_netjet);
+		return (0);
 }

-- 
surya.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
