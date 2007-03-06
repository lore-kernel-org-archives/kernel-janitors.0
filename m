From: Surya <surya.prabhakar@wipro.com>
Date: Tue, 06 Mar 2007 10:13:27 +0000
Subject: [KJ] [kj]patch7:replace pci_find_device in sound/oss/trident.c
Message-Id: <1173175287.32705.5.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alan@redhat.com, mulix@mulix.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors <kernel-janitors@lists.osdl.org>

Hi,
 Cleanup of pci_find_device to pci_get_device in sound/oss/trident.c
Applies and compiles clean to latest Linus tree. Not tested!

thanks..


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 

diff --git a/sound/oss/trident.c b/sound/oss/trident.c
index 72a8a0e..882ab27 100644
--- a/sound/oss/trident.c
+++ b/sound/oss/trident.c
@@ -4450,8 +4450,8 @@ trident_probe(struct pci_dev *pci_dev, c
 
 		/* Add H/W Volume Control By Matt Wu Jul. 06, 2001 */
 		card->hwvolctl = 0;
-		pci_dev_m1533 = pci_find_device(PCI_VENDOR_ID_AL, 
-						PCI_DEVICE_ID_AL_M1533, 
+		pci_dev_m1533 = pci_get_device(PCI_VENDOR_ID_AL,
+						PCI_DEVICE_ID_AL_M1533,
 						pci_dev_m1533);
 		rc = -ENODEV;
 		if (pci_dev_m1533 = NULL)
@@ -4481,6 +4481,7 @@ trident_probe(struct pci_dev *pci_dev, c
 
 	/* claim our irq */
 	rc = -ENODEV;
+	pci_dev_put(pci_dev_m1533);
 	if (request_irq(card->irq, &trident_interrupt, IRQF_SHARED,
 			card_names[pci_id->driver_data], card)) {
 		printk(KERN_ERR "trident: unable to allocate irq %d\n", 

-- 
surya.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
