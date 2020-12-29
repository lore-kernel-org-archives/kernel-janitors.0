From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 29 Dec 2020 11:12:19 +0000
Subject: [PATCH] habanalabs: Use 'dma_set_mask_and_coherent()' instead of hand-writing it
Message-Id: <20201229111219.200668-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ogabbay@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, obitton@habana.ai, lee.jones@linaro.org, ttayar@habana.ai, fkassabri@habana.ai
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Axe 'hl_pci_set_dma_mask()' and replace it with an equivalent
'dma_set_mask_and_coherent()' call.

This makes the code a bit less verbose.

It also removes an erroneous comment, because 'hl_pci_set_dma_mask()' does
not try to use a fall-back value.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/habanalabs/common/pci.c | 42 ++++------------------------
 1 file changed, 6 insertions(+), 36 deletions(-)

diff --git a/drivers/misc/habanalabs/common/pci.c b/drivers/misc/habanalabs/common/pci.c
index 923b2606e29f..eb8a784ba863 100644
--- a/drivers/misc/habanalabs/common/pci.c
+++ b/drivers/misc/habanalabs/common/pci.c
@@ -301,40 +301,6 @@ int hl_pci_set_outbound_region(struct hl_device *hdev,
 	return rc;
 }
 
-/**
- * hl_pci_set_dma_mask() - Set DMA masks for the device.
- * @hdev: Pointer to hl_device structure.
- *
- * This function sets the DMA masks (regular and consistent) for a specified
- * value. If it doesn't succeed, it tries to set it to a fall-back value
- *
- * Return: 0 on success, non-zero for failure.
- */
-static int hl_pci_set_dma_mask(struct hl_device *hdev)
-{
-	struct pci_dev *pdev = hdev->pdev;
-	int rc;
-
-	/* set DMA mask */
-	rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(hdev->dma_mask));
-	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to set pci dma mask to %d bits, error %d\n",
-			hdev->dma_mask, rc);
-		return rc;
-	}
-
-	rc = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(hdev->dma_mask));
-	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to set pci consistent dma mask to %d bits, error %d\n",
-			hdev->dma_mask, rc);
-		return rc;
-	}
-
-	return 0;
-}
-
 /**
  * hl_pci_init() - PCI initialization code.
  * @hdev: Pointer to hl_device structure.
@@ -371,9 +337,13 @@ int hl_pci_init(struct hl_device *hdev)
 		goto unmap_pci_bars;
 	}
 
-	rc = hl_pci_set_dma_mask(hdev);
-	if (rc)
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(hdev->dma_mask));
+	if (rc) {
+		dev_err(hdev->dev,
+			"Failed to set dma mask to %d bits, error %d\n",
+			hdev->dma_mask, rc);
 		goto unmap_pci_bars;
+	}
 
 	return 0;
 
-- 
2.27.0
