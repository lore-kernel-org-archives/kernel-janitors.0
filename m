From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Nov 2020 09:03:30 +0000
Subject: [PATCH 2/2] net: pch_gbe: Use 'dma_free_coherent()' to undo 'dma_alloc_coherent()'
Message-Id: <20201121090330.1332543-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, kuba@kernel.org, kaixuxia@tencent.com, mhabets@solarflare.com, mst@redhat.com, luc.vanoostenryck@gmail.com, jesse.brandeburg@intel.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Memory allocation are done with 'dma_alloc_coherent()'. Be consistent
and use 'dma_free_coherent()' to free the corresponding memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 8e4255efe829..140cee7c459d 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -1816,7 +1816,8 @@ void pch_gbe_free_tx_resources(struct pch_gbe_adapter *adapter,
 	pch_gbe_clean_tx_ring(adapter, tx_ring);
 	vfree(tx_ring->buffer_info);
 	tx_ring->buffer_info = NULL;
-	pci_free_consistent(pdev, tx_ring->size, tx_ring->desc, tx_ring->dma);
+	dma_free_coherent(&pdev->dev, tx_ring->size, tx_ring->desc,
+			  tx_ring->dma);
 	tx_ring->desc = NULL;
 }
 
@@ -1833,7 +1834,8 @@ void pch_gbe_free_rx_resources(struct pch_gbe_adapter *adapter,
 	pch_gbe_clean_rx_ring(adapter, rx_ring);
 	vfree(rx_ring->buffer_info);
 	rx_ring->buffer_info = NULL;
-	pci_free_consistent(pdev, rx_ring->size, rx_ring->desc, rx_ring->dma);
+	dma_free_coherent(&pdev->dev, rx_ring->size, rx_ring->desc,
+			  rx_ring->dma);
 	rx_ring->desc = NULL;
 }
 
@@ -1954,8 +1956,8 @@ void pch_gbe_down(struct pch_gbe_adapter *adapter)
 	pch_gbe_clean_tx_ring(adapter, adapter->tx_ring);
 	pch_gbe_clean_rx_ring(adapter, adapter->rx_ring);
 
-	pci_free_consistent(adapter->pdev, rx_ring->rx_buff_pool_size,
-			    rx_ring->rx_buff_pool, rx_ring->rx_buff_pool_logic);
+	dma_free_coherent(&adapter->pdev->dev, rx_ring->rx_buff_pool_size,
+			  rx_ring->rx_buff_pool, rx_ring->rx_buff_pool_logic);
 	rx_ring->rx_buff_pool_logic = 0;
 	rx_ring->rx_buff_pool_size = 0;
 	rx_ring->rx_buff_pool = NULL;
-- 
2.27.0
