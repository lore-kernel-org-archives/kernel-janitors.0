From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Feb 2005 16:55:30 +0000
Subject: [KJ] [PATCH 04/19] drivers/scsi/ahci: Use the DMA_{64,
Message-Id: <20050220165530.GD14375@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17724484437463195=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============17724484437463195==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/scsi/ahci.c	2005-02-13 17:13:07.000000000 +0100
+++ linux-2.6.11-rc4/drivers/scsi/ahci.c	2005-02-16 21:19:53.000000000 +0100
@@ -756,10 +756,10 @@ static int ahci_host_init(struct ata_pro
 
 	using_dac = hpriv->cap & HOST_CAP_64;
 	if (using_dac &&
-	    !pci_set_dma_mask(pdev, 0xffffffffffffffffULL)) {
-		rc = pci_set_consistent_dma_mask(pdev, 0xffffffffffffffffULL);
+	    !pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
+		rc = pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK);
 		if (rc) {
-			rc = pci_set_consistent_dma_mask(pdev, 0xffffffffULL);
+			rc = pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK);
 			if (rc) {
 				printk(KERN_ERR DRV_NAME "(%s): 64-bit DMA enable failed\n",
 					pci_name(pdev));
@@ -769,13 +769,13 @@ static int ahci_host_init(struct ata_pro
 
 		hpriv->flags |= HOST_CAP_64;
 	} else {
-		rc = pci_set_dma_mask(pdev, 0xffffffffULL);
+		rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR DRV_NAME "(%s): 32-bit DMA enable failed\n",
 				pci_name(pdev));
 			return rc;
 		}
-		rc = pci_set_consistent_dma_mask(pdev, 0xffffffffULL);
+		rc = pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR DRV_NAME "(%s): 32-bit consistent DMA enable failed\n",
 				pci_name(pdev));

--===============17724484437463195==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17724484437463195==--
