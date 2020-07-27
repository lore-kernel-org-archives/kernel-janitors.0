From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 27 Jul 2020 12:45:27 +0000
Subject: [PATCH] media: b2c2: switch from 'pci_' to 'dma_' API
Message-Id: <20200727124527.52323-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below and has been
hand modified to replace GFP_ with a correct flag.
It has been compile tested.

When memory is allocated in 'flexcop_dma_allocate()', GFP_KERNEL can be
used because it is only called from the probe function (i.e.
'flexcop_pci_probe()') and no lock is taken.

The call chain is:
   flexcop_pci_probe
      --> flexcop_pci_dma_init
         --> flexcop_dma_allocate

@@
@@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@
@@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@
@@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
@@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3;
@@
-    pci_alloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3;
@@
-    pci_zalloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4, e5;
@@
-    pci_map_page(e1, e2, e3, e4, e5)
+    dma_map_page(&e1->dev, e2, e3, e4, e5)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_page(e1, e2, e3, e4)
+    dma_unmap_page(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_sg(e1, e2, e3, e4)
+    dma_map_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
+    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_device(e1, e2, e3, e4)
+    dma_sync_single_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
+    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
+    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m8745678307186&w=4
---
 drivers/media/pci/b2c2/flexcop-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/b2c2/flexcop-dma.c b/drivers/media/pci/b2c2/flexcop-dma.c
index ba45b378d739..ff8058568240 100644
--- a/drivers/media/pci/b2c2/flexcop-dma.c
+++ b/drivers/media/pci/b2c2/flexcop-dma.c
@@ -17,7 +17,7 @@ int flexcop_dma_allocate(struct pci_dev *pdev,
 		return -EINVAL;
 	}
 
-	tcpu = pci_alloc_consistent(pdev, size, &tdma);
+	tcpu = dma_alloc_coherent(&pdev->dev, size, &tdma, GFP_KERNEL);
 	if (tcpu != NULL) {
 		dma->pdev = pdev;
 		dma->cpu_addr0 = tcpu;
@@ -33,8 +33,8 @@ EXPORT_SYMBOL(flexcop_dma_allocate);
 
 void flexcop_dma_free(struct flexcop_dma *dma)
 {
-	pci_free_consistent(dma->pdev, dma->size*2,
-			dma->cpu_addr0, dma->dma_addr0);
+	dma_free_coherent(&dma->pdev->dev, dma->size * 2, dma->cpu_addr0,
+			  dma->dma_addr0);
 	memset(dma, 0, sizeof(struct flexcop_dma));
 }
 EXPORT_SYMBOL(flexcop_dma_free);
-- 
2.25.1
