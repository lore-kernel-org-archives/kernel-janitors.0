From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Mar 2005 12:37:47 +0000
Subject: [KJ] [UPDATE PATCH 04/19] drivers/scsi/ahci: Use the DMA_{64,
Message-Id: <20050320123747.GD3491@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52436290825630882=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050220165530.GD14375@helium.tklauser.home>
In-Reply-To: <20050220165530.GD14375@helium.tklauser.home>
To: kernel-janitors@lists.osdl.org
Cc: jgarzik@pobox.com, linux-ide@vger.kernel.org

--===============52436290825630882==
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

--- linux-2.6.11.orig/drivers/scsi/ahci.c	2005-03-02 12:50:38.000000000 +0100
+++ linux-2.6.11/drivers/scsi/ahci.c	2005-03-20 13:27:54.000000000 +0100
@@ -32,6 +32,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/sched.h>
+#include <linux/dma-mapping.h>
 #include "scsi.h"
 #include <scsi/scsi_host.h>
 #include <linux/libata.h>
@@ -766,10 +767,10 @@ static int ahci_host_init(struct ata_pro
 
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
@@ -779,13 +780,13 @@ static int ahci_host_init(struct ata_pro
 
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

--===============52436290825630882==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52436290825630882==--
