From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Mar 2005 13:23:33 +0000
Subject: [KJ] [UPDATE PATCH 19/19] drivers/scsi/sata_vsc: Use the
Message-Id: <20050320132333.GS3491@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============010655429226063884=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050220171331.GT14375@helium.tklauser.home>
In-Reply-To: <20050220171331.GT14375@helium.tklauser.home>
To: kernel-janitors@lists.osdl.org
Cc: jgarzik@pobox.com, linux-ide@vger.kernel.org

--===============010655429226063884==
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

--- linux-2.6.11.orig/drivers/scsi/sata_vsc.c	2005-03-02 12:50:38.000000000 +0100
+++ linux-2.6.11/drivers/scsi/sata_vsc.c	2005-03-20 13:27:54.000000000 +0100
@@ -21,6 +21,7 @@
 #include <linux/blkdev.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/dma-mapping.h>
 #include "scsi.h"
 #include <scsi/scsi_host.h>
 #include <linux/libata.h>
@@ -285,10 +286,10 @@ static int __devinit vsc_sata_init_one (
 	/*
 	 * Use 32 bit DMA mask, because 64 bit address support is poor.
 	 */
-	rc = pci_set_dma_mask(pdev, 0xFFFFFFFFULL);
+	rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 	if (rc)
 		goto err_out_regions;
-	rc = pci_set_consistent_dma_mask(pdev, 0xFFFFFFFFULL);
+	rc = pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK);
 	if (rc)
 		goto err_out_regions;
 

--===============010655429226063884==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============010655429226063884==--
