From: Surya <surya.prabhakar@wipro.com>
Date: Mon, 12 Mar 2007 11:34:52 +0000
Subject: [KJ] Patch16:replace pci_find_device in isdn/hysdn/hysdn_init.c
Message-Id: <1173698572.14236.29.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
    Replacing pci_find_device in hysdn_init.c (isdn/hisax)

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
---


diff --git a/drivers/isdn/hysdn/hysdn_init.c b/drivers/isdn/hysdn/hysdn_init.c
index 9e01748..e6e4c46 100644
--- a/drivers/isdn/hysdn/hysdn_init.c
+++ b/drivers/isdn/hysdn/hysdn_init.c
@@ -76,13 +76,14 @@ search_cards(void)
 
 	card_root = NULL;
 	card_last = NULL;
-	while ((akt_pcidev = pci_find_device(PCI_VENDOR_ID_HYPERCOPE, PCI_DEVICE_ID_HYPERCOPE_PLX,
+	while ((akt_pcidev = pci_get_device(PCI_VENDOR_ID_HYPERCOPE, PCI_DEVICE_ID_HYPERCOPE_PLX,
 					     akt_pcidev)) != NULL) {
 		if (pci_enable_device(akt_pcidev))
 			continue;
 
 		if (!(card = kzalloc(sizeof(hysdn_card), GFP_KERNEL))) {
 			printk(KERN_ERR "HYSDN: unable to alloc device mem \n");
+			pci_dev_put(akt_pcidev);
 			return;
 		}
 		card->myid = cardmax;	/* set own id */
@@ -121,6 +122,7 @@ search_cards(void)
 			card_root = card;
 		card_last = card;	/* new chain end */
 	}			/* device found */
+	pci_dev_put(akt_pcidev);
 }				/* search_cards */
 
 /************************************************************************************/

-- 
surya.
12/03/2007
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
