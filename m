From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 08 Mar 2005 15:12:42 +0000
Subject: [KJ] [PATCH 2/3] drivers/block/sx8.c: Use the DMA_{64,
Message-Id: <20050308151242.GH5311@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65058203721032237=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65058203721032237==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/block/sx8.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/block/sx8.c	2005-03-02 13:06:21.000000000 +0100
@@ -1582,9 +1582,9 @@ static int carm_init_one (struct pci_dev
 		goto err_out;
 
 #if IF_64BIT_DMA_IS_POSSIBLE /* grrrr... */
-	rc = pci_set_dma_mask(pdev, 0xffffffffffffffffULL);
+	rc = pci_set_dma_mask(pdev, DMA_64BIT_MASK);
 	if (!rc) {
-		rc = pci_set_consistent_dma_mask(pdev, 0xffffffffffffffffULL);
+		rc = pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR DRV_NAME "(%s): consistent DMA mask failure\n",
 				pci_name(pdev));
@@ -1593,7 +1593,7 @@ static int carm_init_one (struct pci_dev
 		pci_dac = 1;
 	} else {
 #endif
-		rc = pci_set_dma_mask(pdev, 0xffffffffULL);
+		rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR DRV_NAME "(%s): DMA mask failure\n",
 				pci_name(pdev));

--===============65058203721032237==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65058203721032237==--
