From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Feb 2005 15:03:21 +0000
Subject: [KJ] [PATCH 1/16] drivers/net/8139cp: Use the DMA_{64,
Message-Id: <20050214150321.GD15408@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19321750763619394=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============19321750763619394==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/net/8139cp.c	2005-02-13 17:13:02.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/8139cp.c	2005-02-13 17:29:58.000000000 +0100
@@ -1701,19 +1701,19 @@ static int cp_init_one (struct pci_dev *
 
 	/* Configure DMA attributes. */
 	if ((sizeof(dma_addr_t) > 4) &&
-	    !pci_set_consistent_dma_mask(pdev, 0xffffffffffffffffULL) &&
-	    !pci_set_dma_mask(pdev, 0xffffffffffffffffULL)) {
+	    !pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK) &&
+	    !pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
 		pci_using_dac = 1;
 	} else {
 		pci_using_dac = 0;
 
-		rc = pci_set_dma_mask(pdev, 0xffffffffULL);
+		rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR PFX "No usable DMA configuration, "
 			       "aborting.\n");
 			goto err_out_res;
 		}
-		rc = pci_set_consistent_dma_mask(pdev, 0xffffffffULL);
+		rc = pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR PFX "No usable consistent DMA configuration, "
 			       "aborting.\n");

--===============19321750763619394==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19321750763619394==--
