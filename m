From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 18 Mar 2005 17:02:43 +0000
Subject: [KJ] [UPDATE PATCH 1/3] drivers/block/cciss.c: Use the DMA_{64,
Message-Id: <20050318165924.GA3356@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============010559104769408911=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============010559104769408911==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
Thise patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/block/cciss.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/block/cciss.c	2005-03-18 15:51:25.000000000 +0100
@@ -38,6 +38,7 @@
 #include <linux/hdreg.h>
 #include <linux/spinlock.h>
 #include <linux/compat.h>
+#include <linux/dma-mapping.h>
 #include <asm/uaccess.h>
 #include <asm/io.h>
 
@@ -2692,9 +2693,9 @@ static int __devinit cciss_init_one(stru
 	hba[i]->pdev = pdev;
 
 	/* configure PCI DMA stuff */
-	if (!pci_set_dma_mask(pdev, 0xffffffffffffffffULL))
+	if (!pci_set_dma_mask(pdev, DMA_64BIT_MASK))
 		printk("cciss: using DAC cycles\n");
-	else if (!pci_set_dma_mask(pdev, 0xffffffff))
+	else if (!pci_set_dma_mask(pdev, DMA_32BIT_MASK))
 		printk("cciss: not using DAC cycles\n");
 	else {
 		printk("cciss: no suitable DMA available\n");

--===============010559104769408911==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============010559104769408911==--
