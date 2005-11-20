From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 20 Nov 2005 07:34:43 +0000
Subject: [KJ] qla1280: slightly strange DMA mask
Message-Id: <20051120073443.GB17439@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============099654249112663518=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============099654249112663518==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The question is what to do with ~0LL.

--- linux-kj.orig/drivers/scsi/qla1280.c
+++ linux-kj/drivers/scsi/qla1280.c
@@ -348,6 +348,7 @@
 #include <linux/pci_ids.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/io.h>
 #include <asm/irq.h>
@@ -4571,7 +4572,7 @@ qla1280_probe_one(struct pci_dev *pdev, 
 
 #ifdef QLA_64BIT_PTR
 	if (pci_set_dma_mask(ha->pdev, (dma_addr_t) ~ 0ULL)) {
				       ^^^^^^^^^^^^^^^^^^^

-		if (pci_set_dma_mask(ha->pdev, 0xffffffff)) {
+		if (pci_set_dma_mask(ha->pdev, DMA_32BIT_MASK)) {
 			printk(KERN_WARNING "scsi(%li): Unable to set a "
 			       "suitable DMA mask - aborting\n", ha->host_no);
 			error = -ENODEV;
@@ -4581,7 +4582,7 @@ qla1280_probe_one(struct pci_dev *pdev, 
 		dprintk(2, "scsi(%li): 64 Bit PCI Addressing Enabled\n",
 			ha->host_no);
 #else
-	if (pci_set_dma_mask(ha->pdev, 0xffffffff)) {
+	if (pci_set_dma_mask(ha->pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "scsi(%li): Unable to set a "
 		       "suitable DMA mask - aborting\n", ha->host_no);
 		error = -ENODEV;


--===============099654249112663518==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============099654249112663518==--
