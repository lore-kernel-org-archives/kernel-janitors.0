From: Surya <surya.prabhakar@wipro.com>
Date: Mon, 12 Mar 2007 09:59:07 +0000
Subject: Re: [KJ] Patch9:replace pci_find_device in isdn/hisax/hfc_pci.c
Message-Id: <1173692827.14236.1.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1173692250.13915.3.camel@bluegenie>
In-Reply-To: <1173692250.13915.3.camel@bluegenie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
    Replacing pci_find_device in hfc_pci.c (isdn/hisax)
Applies and compiles clean on latest tree.

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 


diff --git a/drivers/isdn/hisax/hfc_pci.c b/drivers/isdn/hisax/hfc_pci.c
index 8a48a3c..b346419 100644
--- a/drivers/isdn/hisax/hfc_pci.c
+++ b/drivers/isdn/hisax/hfc_pci.c
@@ -1665,7 +1665,7 @@ setup_hfcpci(struct IsdnCard *card)
 	if (cs->typ = ISDN_CTYPE_HFC_PCI) {
 		i = 0;
 		while (id_list[i].vendor_id) {
-			tmp_hfcpci = pci_find_device(id_list[i].vendor_id,
+			tmp_hfcpci = pci_get_device(id_list[i].vendor_id,
 						     id_list[i].device_id,
 						     dev_hfcpci);
 			i++;
@@ -1687,7 +1687,7 @@ setup_hfcpci(struct IsdnCard *card)
 			cs->irq = dev_hfcpci->irq;
 			if (!cs->irq) {
 				printk(KERN_WARNING "HFC-PCI: No IRQ for PCI card found\n");
-				return (0);
+				goto tmp_hfcpci_cleanup;
 			}
 			cs->hw.hfcpci.pci_io = (char *)(unsigned long)dev_hfcpci->resource[1].start;
 			printk(KERN_INFO "HiSax: HFC-PCI card manufacturer: %s card name: %s\n", id_list[i].vendor_name, id_list[i].card_name);
@@ -1697,14 +1697,14 @@ setup_hfcpci(struct IsdnCard *card)
 		}
 		if (!cs->hw.hfcpci.pci_io) {
 			printk(KERN_WARNING "HFC-PCI: No IO-Mem for PCI card found\n");
-			return (0);
+			goto tmp_hfcpci_cleanup;
 		}
 		/* Allocate memory for FIFOS */
 		/* Because the HFC-PCI needs a 32K physical alignment, we */
 		/* need to allocate the double mem and align the address */
 		if (!(cs->hw.hfcpci.share_start = kmalloc(65536, GFP_KERNEL))) {
 			printk(KERN_WARNING "HFC-PCI: Error allocating memory for FIFO!\n");
-			return 0;
+			goto tmp_hfcpci_cleanup;
 		}
 		cs->hw.hfcpci.fifos = (void *)
 		    (((ulong) cs->hw.hfcpci.share_start) & ~0x7FFF) + 0x8000;
@@ -1741,9 +1741,15 @@ setup_hfcpci(struct IsdnCard *card)
 		cs->cardmsg = &hfcpci_card_msg;
 		cs->auxcmd = &hfcpci_auxcmd;
 		spin_unlock_irqrestore(&cs->lock, flags);
+
+		pci_dev_put(tmp_hfcpci);
 		return (1);
 	} else
 		return (0);	/* no valid card type */
+
+tmp_hfcpci_cleanup:
+		pci_dev_put(tmp_hfcpci);
+		return 0;
 #else
 	printk(KERN_WARNING "HFC-PCI: NO_PCI_BIOS\n");
 	return (0);

-- 
surya.
12/03/2007
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
