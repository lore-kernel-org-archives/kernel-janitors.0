From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Mar 2005 13:10:31 +0000
Subject: [KJ] [UPDATE PATCH 13/19] drivers/scsi/ips: Use the DMA_{64,
Message-Id: <20050320131031.GM3491@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74248969048057156=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74248969048057156==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/scsi/ips.c	2005-03-02 12:50:37.000000000 +0100
+++ linux-2.6.11/drivers/scsi/ips.c	2005-03-20 13:27:54.000000000 +0100
@@ -176,6 +176,7 @@
 
 #include <linux/blkdev.h>
 #include <linux/types.h>
+#include <linux/dma-mapping.h>
 
 #include <scsi/sg.h>
 
@@ -7290,10 +7291,10 @@ ips_init_phase1(struct pci_dev *pci_dev,
 	 * are guaranteed to be < 4G.
 	 */
 	if (IPS_ENABLE_DMA64 && IPS_HAS_ENH_SGLIST(ha) &&
-	    !pci_set_dma_mask(ha->pcidev, 0xffffffffffffffffULL)) {
+	    !pci_set_dma_mask(ha->pcidev, DMA_64BIT_MASK)) {
 		(ha)->flags |= IPS_HA_ENH_SG;
 	} else {
-		if (pci_set_dma_mask(ha->pcidev, 0xffffffffULL) != 0) {
+		if (pci_set_dma_mask(ha->pcidev, DMA_32BIT_MASK) != 0) {
 			printk(KERN_WARNING "Unable to set DMA Mask\n");
 			return ips_abort_init(ha, index);
 		}

--===============74248969048057156==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74248969048057156==--
