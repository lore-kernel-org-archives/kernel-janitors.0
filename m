From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Mar 2005 12:35:30 +0000
Subject: [KJ] [UPDATE PATCH 03/19] drivers/scsi/aacraid/linit: Use the
Message-Id: <20050320123530.GC3491@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10429250378023891=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050220165420.GC14375@helium.tklauser.home>
In-Reply-To: <20050220165420.GC14375@helium.tklauser.home>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============10429250378023891==
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

--- linux-2.6.11.orig/drivers/scsi/aacraid/linit.c	2005-03-02 12:50:37.000000000 +0100
+++ linux-2.6.11/drivers/scsi/aacraid/linit.c	2005-03-20 13:27:54.000000000 +0100
@@ -45,6 +45,7 @@
 #include <linux/syscalls.h>
 #include <linux/ioctl32.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <asm/semaphore.h>
 
 #include <scsi/scsi.h>
@@ -545,8 +546,8 @@ static int __devinit aac_probe_one(struc
 	if (pci_enable_device(pdev))
 		goto out;
 
-	if (pci_set_dma_mask(pdev, 0xFFFFFFFFULL) || 
-			pci_set_consistent_dma_mask(pdev, 0xFFFFFFFFULL))
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK) || 
+			pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK))
 		goto out;
 	/*
 	 * If the quirk31 bit is set, the adapter needs adapter
@@ -589,7 +590,7 @@ static int __devinit aac_probe_one(struc
 	 * address space.
 	 */
 	if (aac_drivers[index].quirks & AAC_QUIRK_31BIT)
-		if (pci_set_dma_mask(pdev, 0xFFFFFFFFULL))
+		if (pci_set_dma_mask(pdev, DMA_32BIT_MASK))
 			goto out_free_fibs;
 
 	aac_get_adapter_info(aac);

--===============10429250378023891==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10429250378023891==--
