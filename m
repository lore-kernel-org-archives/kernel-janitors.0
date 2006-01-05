From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 05 Jan 2006 23:11:52 +0000
Subject: [KJ] [PATCH] use PCI_DMA_*BIT in ioc3-eth.c
Message-Id: <1136502712.9683.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67392647531557093=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67392647531557093==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes the 0xfff.. constants used for pci_set_dma* to
defines in the ioc3 driver.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>


--- linux-2.6.15-eric/drivers/net/ioc3-eth.c.orig	2006-01-06 00:02:54.000000000 +0100
+++ linux-2.6.15-eric/drivers/net/ioc3-eth.c	2006-01-06 00:07:14.000000000 +0100
@@ -1195,17 +1195,17 @@ static int ioc3_probe(struct pci_dev *pd
 	int err, pci_using_dac;
 
 	/* Configure DMA attributes. */
-	err = pci_set_dma_mask(pdev, 0xffffffffffffffffULL);
+	err = pci_set_dma_mask(pdev, PCI_DMA_64BIT);
 	if (!err) {
 		pci_using_dac = 1;
-		err = pci_set_consistent_dma_mask(pdev, 0xffffffffffffffffULL);
+		err = pci_set_consistent_dma_mask(pdev, PCI_DMA_64BIT);
 		if (err < 0) {
 			printk(KERN_ERR "%s: Unable to obtain 64 bit DMA "
 			       "for consistent allocations\n", pci_name(pdev));
 			goto out;
 		}
 	} else {
-		err = pci_set_dma_mask(pdev, 0xffffffffULL);
+		err = pci_set_dma_mask(pdev, PCI_DMA_32BIT);
 		if (err) {
 			printk(KERN_ERR "%s: No usable DMA configuration, "
 			       "aborting.\n", pci_name(pdev));



--===============67392647531557093==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67392647531557093==--
