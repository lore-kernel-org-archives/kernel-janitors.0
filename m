From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Jul 2020 06:43:36 +0000
Subject: [PATCH] rsxx: switch from 'pci_free_consistent()' to 'dma_free_coherent()'
Message-Id: <20200711064336.247502-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xx@mail.com
Cc: list@mail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script bellow.
It has been compile tested.

This also aligns code with what is in use in '/rsxx/dma.c'


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

For an example of code used in '/rsxx/dma.c', see:
   https://elixir.bootlin.com/linux/v5.7.8/source/drivers/block/rsxx/dma.c#L951
---
 drivers/block/rsxx/core.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
index 9230f453bb8b..e631749e14ca 100644
--- a/drivers/block/rsxx/core.c
+++ b/drivers/block/rsxx/core.c
@@ -562,13 +562,15 @@ static int rsxx_eeh_frozen(struct pci_dev *dev)
 
 	for (i = 0; i < card->n_targets; i++) {
 		if (card->ctrl[i].status.buf)
-			pci_free_consistent(card->dev, STATUS_BUFFER_SIZE8,
-					    card->ctrl[i].status.buf,
-					    card->ctrl[i].status.dma_addr);
+			dma_free_coherent(&card->dev->dev,
+					  STATUS_BUFFER_SIZE8,
+					  card->ctrl[i].status.buf,
+					  card->ctrl[i].status.dma_addr);
 		if (card->ctrl[i].cmd.buf)
-			pci_free_consistent(card->dev, COMMAND_BUFFER_SIZE8,
-					    card->ctrl[i].cmd.buf,
-					    card->ctrl[i].cmd.dma_addr);
+			dma_free_coherent(&card->dev->dev,
+					  COMMAND_BUFFER_SIZE8,
+					  card->ctrl[i].cmd.buf,
+					  card->ctrl[i].cmd.dma_addr);
 	}
 
 	return 0;
@@ -711,15 +713,15 @@ static pci_ers_result_t rsxx_slot_reset(struct pci_dev *dev)
 failed_hw_buffers_init:
 	for (i = 0; i < card->n_targets; i++) {
 		if (card->ctrl[i].status.buf)
-			pci_free_consistent(card->dev,
-					STATUS_BUFFER_SIZE8,
-					card->ctrl[i].status.buf,
-					card->ctrl[i].status.dma_addr);
+			dma_free_coherent(&card->dev->dev,
+					  STATUS_BUFFER_SIZE8,
+					  card->ctrl[i].status.buf,
+					  card->ctrl[i].status.dma_addr);
 		if (card->ctrl[i].cmd.buf)
-			pci_free_consistent(card->dev,
-					COMMAND_BUFFER_SIZE8,
-					card->ctrl[i].cmd.buf,
-					card->ctrl[i].cmd.dma_addr);
+			dma_free_coherent(&card->dev->dev,
+					  COMMAND_BUFFER_SIZE8,
+					  card->ctrl[i].cmd.buf,
+					  card->ctrl[i].cmd.dma_addr);
 	}
 failed_hw_setup:
 	rsxx_eeh_failure(dev);
-- 
2.25.1
