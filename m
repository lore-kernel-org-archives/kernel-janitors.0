From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 18 Mar 2005 17:06:37 +0000
Subject: [KJ] [UPDATE PATCH 3/3] drivers/block/umem.c: Use the DMA_{64,
Message-Id: <20050318170637.GC3356@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27749343802312199=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27749343802312199==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
These patches include dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/block/umem.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/block/umem.c	2005-03-18 15:54:40.000000000 +0100
@@ -49,6 +49,7 @@
 #include <linux/timer.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/dma-mapping.h>
 
 #include <linux/fcntl.h>        /* O_ACCMODE */
 #include <linux/hdreg.h>  /* HDIO_GETGEO */
@@ -895,8 +896,8 @@ static int __devinit mm_pci_probe(struct
 	printk(KERN_INFO "Micro Memory(tm) controller #%d found at %02x:%02x (PCI Mem Module (Battery Backup))\n",
 	       card->card_number, dev->bus->number, dev->devfn);
 
-	if (pci_set_dma_mask(dev, 0xffffffffffffffffLL) &&
-	    !pci_set_dma_mask(dev, 0xffffffffLL)) {
+	if (pci_set_dma_mask(dev, DMA_64BIT_MASK) &&
+	    !pci_set_dma_mask(dev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "MM%d: NO suitable DMA found\n",num_cards);
 		return  -ENOMEM;
 	}

--===============27749343802312199==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27749343802312199==--
