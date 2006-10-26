From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 26 Oct 2006 19:04:35 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/scsi
Message-Id: <1161889475.7318.3.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

replace open coded kmemdup() to save some screen space,
and allow inlining/not inlining to be triggered by gcc.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.19-rc3-git1/drivers/scsi/megaraid.c.orig	2006-10-26 19:03:16.000000000 +0200
+++ linux-2.6.19-rc3-git1/drivers/scsi/megaraid.c	2006-10-26 19:04:30.000000000 +0200
@@ -2087,12 +2087,10 @@ megaraid_abort_and_reset(adapter_t *adap
 static inline int
 make_local_pdev(adapter_t *adapter, struct pci_dev **pdev)
 {
-	*pdev = kmalloc(sizeof(struct pci_dev), GFP_KERNEL);
+	*pdev = kmemdup(adapter->dev, sizeof(struct pci_dev), GFP_KERNEL);
 
 	if( *pdev = NULL ) return -1;
 
-	memcpy(*pdev, adapter->dev, sizeof(struct pci_dev));
-
 	if( pci_set_dma_mask(*pdev, DMA_32BIT_MASK) != 0 ) {
 		kfree(*pdev);
 		return -1;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
