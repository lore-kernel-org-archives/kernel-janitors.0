From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Feb 2005 17:12:00 +0000
Subject: [KJ] [PATCH 17/19] drivers/scsi/qla1280: Use the DMA_{64,
Message-Id: <20050220171200.GR14375@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97435712590311407=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============97435712590311407==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/scsi/qla1280.c	2005-02-13 17:13:07.000000000 +0100
+++ linux-2.6.11-rc4/drivers/scsi/qla1280.c	2005-02-16 21:16:19.000000000 +0100
@@ -4741,7 +4741,7 @@ qla1280_probe_one(struct pci_dev *pdev, 
 
 #ifdef QLA_64BIT_PTR
 	if (pci_set_dma_mask(ha->pdev, (dma_addr_t) ~ 0ULL)) {
-		if (pci_set_dma_mask(ha->pdev, 0xffffffff)) {
+		if (pci_set_dma_mask(ha->pdev, DMA_32BIT_MASK)) {
 			printk(KERN_WARNING "scsi(%li): Unable to set a "
 			       " suitable DMA mask - aboring\n", ha->host_no);
 			error = -ENODEV;
@@ -4751,7 +4751,7 @@ qla1280_probe_one(struct pci_dev *pdev, 
 		dprintk(2, "scsi(%li): 64 Bit PCI Addressing Enabled\n",
 			ha->host_no);
 #else
-	if (pci_set_dma_mask(ha->pdev, 0xffffffff)) {
+	if (pci_set_dma_mask(ha->pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "scsi(%li): Unable to set a "
 		       " suitable DMA mask - aboring\n", ha->host_no);
 		error = -ENODEV;

--===============97435712590311407==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97435712590311407==--
