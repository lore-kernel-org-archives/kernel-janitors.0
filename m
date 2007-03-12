From: Surya <surya.prabhakar@wipro.com>
Date: Mon, 12 Mar 2007 10:31:11 +0000
Subject: [KJ] Patch12:replace pci_find_device in isdn/hisax/nj_u.c
Message-Id: <1173694751.14236.13.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
    Replacing pci_find_device in nj_u.c (isdn/hisax)
Applies and compiles clean on latest tree.

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 


diff --git a/drivers/isdn/hisax/nj_u.c b/drivers/isdn/hisax/nj_u.c
index 8202cf3..ab13fd4 100644
--- a/drivers/isdn/hisax/nj_u.c
+++ b/drivers/isdn/hisax/nj_u.c
@@ -151,20 +151,20 @@ setup_netjet_u(struct IsdnCard *card)
 
 	for ( ;; )
 	{
-		if ((dev_netjet = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+		if ((dev_netjet = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 			PCI_DEVICE_ID_TIGERJET_300,  dev_netjet))) {
 			if (pci_enable_device(dev_netjet))
-				return(0);
+				goto dev_netjet_cleanup;
 			pci_set_master(dev_netjet);
 			cs->irq = dev_netjet->irq;
 			if (!cs->irq) {
 				printk(KERN_WARNING "NETspider-U: No IRQ for PCI card found\n");
-				return(0);
+				goto dev_netjet_cleanup;
 			}
 			cs->hw.njet.base = pci_resource_start(dev_netjet, 0);
 			if (!cs->hw.njet.base) {
 				printk(KERN_WARNING "NETspider-U: No IO-Adr for PCI card found\n");
-				return(0);
+				goto dev_netjet_cleanup;
 			}
 		} else {
 			printk(KERN_WARNING "NETspider-U: No PCI card found\n");
@@ -202,7 +202,7 @@ setup_netjet_u(struct IsdnCard *card)
 
 			default :
 				printk( KERN_WARNING "NETspider-U: No PCI card found\n" );
-				return 0;
+				goto dev_netjet_cleanup;
                 }
                 break;
 	}
@@ -225,7 +225,7 @@ setup_netjet_u(struct IsdnCard *card)
 		       CardType[card->typ],
 		       cs->hw.njet.base,
 		       cs->hw.njet.base + bytecnt);
-		return (0);
+		goto dev_netjet_cleanup;
 	}
 	setup_icc(cs);
 	cs->readisac  = &NETjet_ReadIC;
@@ -239,5 +239,11 @@ setup_netjet_u(struct IsdnCard *card)
 	cs->irq_func = &netjet_u_interrupt;
 	cs->irq_flags |= IRQF_SHARED;
 	ICCVersion(cs, "NETspider-U:");
+
+	pci_dev_put(dev_netjet);
 	return (1);
+
+dev_netjet_cleanup:
+		pci_dev_put(dev_netjet);
+		return (0);
 }

-- 
surya.
12/03/2007
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
