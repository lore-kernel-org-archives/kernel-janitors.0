From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 01 Apr 2005 13:30:18 +0000
Subject: [KJ] [PATCH] drivers/block/cciss : Use the DMA_{32,
Message-Id: <20050401133018.GB762@neon>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58882452196805835=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050401083934.GG5445@rhum.iomeda.fr>
In-Reply-To: <20050401083934.GG5445@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============58882452196805835==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 01, 2005 at 02:30:46PM +0200, Christophe Lucas wrote:
> Perhaps, could you update your patch about block/cciss.c to include the
> first part of the previous patch ?

Sure, Here it is. Christophe, you may want to add your "Signed-off-by"
line too.

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
macros.
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.11.orig/drivers/block/cciss.c linux-2.6.11/drivers/block/cciss.c
--- linux-2.6.11.orig/drivers/block/cciss.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/block/cciss.c	2005-03-30 15:09:36.000000000 +0200
@@ -38,6 +38,7 @@
 #include <linux/hdreg.h>
 #include <linux/spinlock.h>
 #include <linux/compat.h>
+#include <linux/dma-mapping.h>
 #include <asm/uaccess.h>
 #include <asm/io.h>
 
@@ -116,8 +117,6 @@ static struct board_type products[] = {
 #define NR_CMDS		 384 /* #commands that can be outstanding */
 #define MAX_CTLR 8
 
-#define CCISS_DMA_MASK	0xFFFFFFFF	/* 32 bit DMA */
-
 static ctlr_info_t *hba[MAX_CTLR];
 
 static void do_cciss_request(request_queue_t *q);
@@ -2339,7 +2338,7 @@ static int cciss_pci_init(ctlr_info_t *c
 		printk(KERN_ERR "cciss: Unable to Enable PCI device\n");
 		return( -1);
 	}
-	if (pci_set_dma_mask(pdev, CCISS_DMA_MASK ) != 0)
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK) != 0)
 	{
 		printk(KERN_ERR "cciss:  Unable to set DMA mask\n");
 		return(-1);
@@ -2692,9 +2691,9 @@ static int __devinit cciss_init_one(stru
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

--===============58882452196805835==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58882452196805835==--
