From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 04 Aug 2020 20:19:24 +0000
Subject: [PATCH] farsync: switch from 'pci_' to 'dma_' API
Message-Id: <20200804201924.717142-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kevin.curtis@farsite.co.uk, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below and has been
hand modified to replace GFP_ with a correct flag.
It has been compile tested.

When memory is allocated in 'fst_add_one()', GFP_KERNEL can be used
because it is a probe function and no lock is acquired.


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
 drivers/net/wan/farsync.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wan/farsync.c b/drivers/net/wan/farsync.c
index 5ff249b76525..b50cf11d197d 100644
--- a/drivers/net/wan/farsync.c
+++ b/drivers/net/wan/farsync.c
@@ -2553,16 +2553,16 @@ fst_add_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 		 * Allocate a dma buffer for transmit and receives
 		 */
 		card->rx_dma_handle_host -		    pci_alloc_consistent(card->device, FST_MAX_MTU,
-					 &card->rx_dma_handle_card);
+		    dma_alloc_coherent(&card->device->dev, FST_MAX_MTU,
+				       &card->rx_dma_handle_card, GFP_KERNEL);
 		if (card->rx_dma_handle_host = NULL) {
 			pr_err("Could not allocate rx dma buffer\n");
 			err = -ENOMEM;
 			goto rx_dma_fail;
 		}
 		card->tx_dma_handle_host -		    pci_alloc_consistent(card->device, FST_MAX_MTU,
-					 &card->tx_dma_handle_card);
+		    dma_alloc_coherent(&card->device->dev, FST_MAX_MTU,
+				       &card->tx_dma_handle_card, GFP_KERNEL);
 		if (card->tx_dma_handle_host = NULL) {
 			pr_err("Could not allocate tx dma buffer\n");
 			err = -ENOMEM;
@@ -2572,9 +2572,8 @@ fst_add_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return 0;		/* Success */
 
 tx_dma_fail:
-	pci_free_consistent(card->device, FST_MAX_MTU,
-			    card->rx_dma_handle_host,
-			    card->rx_dma_handle_card);
+	dma_free_coherent(&card->device->dev, FST_MAX_MTU,
+			  card->rx_dma_handle_host, card->rx_dma_handle_card);
 rx_dma_fail:
 	fst_disable_intr(card);
 	for (i = 0 ; i < card->nports ; i++)
@@ -2625,12 +2624,12 @@ fst_remove_one(struct pci_dev *pdev)
 		/*
 		 * Free dma buffers
 		 */
-		pci_free_consistent(card->device, FST_MAX_MTU,
-				    card->rx_dma_handle_host,
-				    card->rx_dma_handle_card);
-		pci_free_consistent(card->device, FST_MAX_MTU,
-				    card->tx_dma_handle_host,
-				    card->tx_dma_handle_card);
+		dma_free_coherent(&card->device->dev, FST_MAX_MTU,
+				  card->rx_dma_handle_host,
+				  card->rx_dma_handle_card);
+		dma_free_coherent(&card->device->dev, FST_MAX_MTU,
+				  card->tx_dma_handle_host,
+				  card->tx_dma_handle_card);
 	}
 	fst_card_array[card->card_no] = NULL;
 }
-- 
2.25.1
