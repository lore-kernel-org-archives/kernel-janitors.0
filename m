From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Jan 2021 13:39:29 +0000
Subject: [PATCH] rapidio/tsi721: Use dma_set_mask_and_coherent to simplify code
Message-Id: <20210117133929.563645-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mporter@kernel.crashing.org, alex.bou9@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/rapidio/devices/tsi721.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/rapidio/devices/tsi721.c b/drivers/rapidio/devices/tsi721.c
index 4dd31dd9feea..1e296b4d7bf2 100644
--- a/drivers/rapidio/devices/tsi721.c
+++ b/drivers/rapidio/devices/tsi721.c
@@ -2836,19 +2836,12 @@ static int tsi721_probe(struct pci_dev *pdev,
 	}
 
 	/* Configure DMA attributes. */
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
-		err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
+		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 		if (err) {
 			tsi_err(&pdev->dev, "Unable to set DMA mask");
 			goto err_unmap_bars;
 		}
-
-		if (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32)))
-			tsi_info(&pdev->dev, "Unable to set consistent DMA mask");
-	} else {
-		err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
-		if (err)
-			tsi_info(&pdev->dev, "Unable to set consistent DMA mask");
 	}
 
 	BUG_ON(!pci_is_pcie(pdev));
-- 
2.27.0
