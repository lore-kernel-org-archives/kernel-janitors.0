From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 07 Jul 2005 20:54:21 +0000
Subject: [KJ] [PATCH] drivers/block/umem.c: Use DMA_{32,
Message-Id: <20050707205421.GA773@mail.nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67019249063489506=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67019249063489506==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Since nobody replied to Domen's request for clarification [1], here's a
patch to fix drivers/block/umem.c to correctly evaluate the return value
of pci_set_dma_mask() both times. The function returns non-null on
error, so this seems to be correct.

[1] http://lists.osdl.org/mailman/htdig/kernel-janitors/2005-May/004119.html

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.13-rc2/drivers/block/umem.c linux-2.6.13-rc2~dma_mask/drivers/block/umem.c
--- linux-2.6.13-rc2/drivers/block/umem.c	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~dma_mask/drivers/block/umem.c	2005-07-07 22:44:51.000000000 +0200
@@ -895,8 +895,8 @@ static int __devinit mm_pci_probe(struct
 	printk(KERN_INFO "Micro Memory(tm) controller #%d found at %02x:%02x (PCI Mem Module (Battery Backup))\n",
 	       card->card_number, dev->bus->number, dev->devfn);
 
-	if (pci_set_dma_mask(dev, 0xffffffffffffffffLL) &&
-	    !pci_set_dma_mask(dev, 0xffffffffLL)) {
+	if (pci_set_dma_mask(dev, DMA_64BIT_MASK) &&
+	    pci_set_dma_mask(dev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "MM%d: NO suitable DMA found\n",num_cards);
 		return  -ENOMEM;
 	}

--===============67019249063489506==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67019249063489506==--
