From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 01 Apr 2005 08:39:34 +0000
Subject: [KJ] [PATCH] drivers/block/cciss : Use the DMA_{32|64}_MASK constant
Message-Id: <20050401083934.GG5445@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mojUlQ0s9EVzWg2t"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
macros.
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc1_drivers_block_cciss.c.patch"

diff -urpN -X dontdiff a/drivers/block/cciss.c b/drivers/block/cciss.c
--- a/drivers/block/cciss.c	2005-03-18 02:34:36.000000000 +0100
+++ b/drivers/block/cciss.c	2005-03-31 17:49:54.382458576 +0200
@@ -38,6 +38,7 @@
 #include <linux/hdreg.h>
 #include <linux/spinlock.h>
 #include <linux/compat.h>
+#include <linux/dma-mapping.h>
 #include <asm/uaccess.h>
 #include <asm/io.h>
 
@@ -125,9 +126,6 @@ static struct board_type products[] = {
 /* Originally cciss driver only supports 8 major numbers */
 #define MAX_CTLR_ORIG 	8
 
-
-#define CCISS_DMA_MASK	0xFFFFFFFF	/* 32 bit DMA */
-
 static ctlr_info_t *hba[MAX_CTLR];
 
 static void do_cciss_request(request_queue_t *q);
@@ -1542,9 +1540,6 @@ static int register_new_disk(ctlr_info_t
 
 	if( return_code == IO_OK)
 	{
-		
-		// printk("LUN Data\n--------------------------\n");
-
 		listlength |= (0xff & (unsigned int)(ld_buff->LUNListLength[0])) << 24;
 		listlength |= (0xff & (unsigned int)(ld_buff->LUNListLength[1])) << 16;
 		listlength |= (0xff & (unsigned int)(ld_buff->LUNListLength[2])) << 8;	
@@ -2393,7 +2388,7 @@ static int cciss_pci_init(ctlr_info_t *c
 		printk(KERN_ERR "cciss: Unable to Enable PCI device\n");
 		return( -1);
 	}
-	if (pci_set_dma_mask(pdev, CCISS_DMA_MASK ) != 0)
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK) != 0)
 	{
 		printk(KERN_ERR "cciss:  Unable to set DMA mask\n");
 		return(-1);
@@ -2747,9 +2742,9 @@ static int __devinit cciss_init_one(stru
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

--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--mojUlQ0s9EVzWg2t--
