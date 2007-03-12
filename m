From: Surya <surya.prabhakar@wipro.com>
Date: Mon, 12 Mar 2007 10:23:06 +0000
Subject: [KJ] Patch11:replace pci_find_device in isdn/nj_s.c
Message-Id: <1173694266.14236.8.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1173693916.14236.4.camel@bluegenie>
In-Reply-To: <1173693916.14236.4.camel@bluegenie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
    Replacing pci_find_device in nj_s.c (isdn/hisax)
Applies and compiles clean on latest tree.

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 

diff --git a/drivers/isdn/hisax/nj_s.c b/drivers/isdn/hisax/nj_s.c
index c09ffb1..213e788 100644
--- a/drivers/isdn/hisax/nj_s.c
+++ b/drivers/isdn/hisax/nj_s.c
@@ -170,20 +170,20 @@ setup_netjet_s(struct IsdnCard *card)
 
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
 				printk(KERN_WARNING "NETjet-S: No IRQ for PCI card found\n");
-				return(0);
+				goto dev_netjet_cleanup;
 			}
 			cs->hw.njet.base = pci_resource_start(dev_netjet, 0);
 			if (!cs->hw.njet.base) {
 				printk(KERN_WARNING "NETjet-S: No IO-Adr for PCI card found\n");
-				return(0);
+				goto dev_netjet_cleanup;
 			}
 			/* the TJ300 and TJ320 must be detected, the IRQ handling is different
 			 * unfortunatly the chips use the same device ID, but the TJ320 has
@@ -199,7 +199,7 @@ setup_netjet_s(struct IsdnCard *card)
 				(dev_netjet->subsystem_device = 0x02)) {
 				printk(KERN_WARNING "Netjet: You tried to load this driver with an incompatible TigerJet-card\n");
 				printk(KERN_WARNING "Use typeA for Formula-n enter:now ISDN PCI and compatible\n");
-				return(0);
+				goto dev_netjet_cleanup;
 			}
 			/* end new code */
 		} else {
@@ -259,7 +259,7 @@ setup_netjet_s(struct IsdnCard *card)
 		       CardType[card->typ],
 		       cs->hw.njet.base,
 		       cs->hw.njet.base + bytecnt);
-		return (0);
+		goto dev_netjet_cleanup;
 	}
 	cs->readisac  = &NETjet_ReadIC;
 	cs->writeisac = &NETjet_WriteIC;
@@ -273,5 +273,10 @@ setup_netjet_s(struct IsdnCard *card)
 	cs->irq_func = &netjet_s_interrupt;
 	cs->irq_flags |= IRQF_SHARED;
 	ISACVersion(cs, "NETjet-S:");
+	pci_dev_put(dev_netjet);
 	return (1);
+
+dev_netjet_cleanup:
+		pci_dev_put(dev_netjet);
+	return (0);
 }

-- 
surya.
12/03/2007
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
