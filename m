From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 31 Mar 2005 09:51:12 +0000
Subject: [KJ] [PATCH] block/cpqarray: Use the DMA_32BIT_MASK constant
Message-Id: <20050331095112.GA3789@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76247740737087666=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76247740737087666==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
macros.
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.11.orig/drivers/block/cpqarray.c linux-2.6.11/drivers/block/cpqarray.c
--- linux-2.6.11.orig/drivers/block/cpqarray.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/block/cpqarray.c	2005-03-31 11:37:36.000000000 +0200
@@ -39,6 +39,7 @@
 #include <linux/spinlock.h>
 #include <linux/blkdev.h>
 #include <linux/genhd.h>
+#include <linux/dma-mapping.h>
 #include <asm/uaccess.h>
 #include <asm/io.h>
 
@@ -65,8 +66,6 @@ MODULE_LICENSE("GPL");
 #define MAX_CTLR	8
 #define CTLR_SHIFT	8
 
-#define CPQARRAY_DMA_MASK	0xFFFFFFFF	/* 32 bit DMA */
-
 static int nr_ctlr;
 static ctlr_info_t *hba[MAX_CTLR];
 
@@ -635,7 +634,7 @@ static int cpqarray_pci_init(ctlr_info_t
 	for(i=0; i<6; i++)
 		addr[i] = pci_resource_start(pdev, i);
 
-	if (pci_set_dma_mask(pdev, CPQARRAY_DMA_MASK) != 0)
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK) != 0)
 	{
 		printk(KERN_ERR "cpqarray: Unable to set DMA mask\n");
 		return -1;

--===============76247740737087666==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76247740737087666==--
