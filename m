From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 08 Mar 2005 15:13:30 +0000
Subject: [KJ] [PATCH 3/3] drivers/block/umem.c: Use the DMA_{64,
Message-Id: <20050308151330.GI5311@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56337129647736295=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56337129647736295==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/block/umem.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/block/umem.c	2005-03-02 13:05:01.000000000 +0100
@@ -895,8 +895,8 @@ static int __devinit mm_pci_probe(struct
 	printk(KERN_INFO "Micro Memory(tm) controller #%d found at %02x:%02x (PCI Mem Module (Battery Backup))\n",
 	       card->card_number, dev->bus->number, dev->devfn);
 
-	if (pci_set_dma_mask(dev, 0xffffffffffffffffLL) &&
-	    !pci_set_dma_mask(dev, 0xffffffffLL)) {
+	if (pci_set_dma_mask(dev, DMA_64BIT_MASK) &&
+	    !pci_set_dma_mask(dev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "MM%d: NO suitable DMA found\n",num_cards);
 		return  -ENOMEM;
 	}

--===============56337129647736295==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56337129647736295==--
