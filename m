From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Mar 2005 13:17:30 +0000
Subject: [KJ] [UPDATE PATCH 16/19] drivers/scsi/nsp32: Use the
Message-Id: <20050320131730.GP3491@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6682448331485964=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6682448331485964==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/scsi/nsp32.c	2005-03-02 12:50:38.000000000 +0100
+++ linux-2.6.11/drivers/scsi/nsp32.c	2005-03-20 13:27:54.000000000 +0100
@@ -38,6 +38,7 @@
 #include <linux/pci.h>
 #include <linux/delay.h>
 #include <linux/ctype.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/dma.h>
 #include <asm/system.h>
@@ -2779,7 +2780,7 @@ static int nsp32_detect(Scsi_Host_Templa
 	/*
 	 * setup DMA 
 	 */
-	if (pci_set_dma_mask(PCIDEV, 0xffffffffUL) != 0) {
+	if (pci_set_dma_mask(PCIDEV, DMA_32BIT_MASK) != 0) {
 		nsp32_msg (KERN_ERR, "failed to set PCI DMA mask");
 		goto scsi_unregister;
 	}

--===============6682448331485964==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6682448331485964==--
