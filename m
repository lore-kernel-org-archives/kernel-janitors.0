From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 01 Dec 2020 21:01:47 +0000
Subject: [PATCH] misc: genwqe: Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201201210147.7917-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: haver@linux.ibm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/genwqe/card_base.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/misc/genwqe/card_base.c b/drivers/misc/genwqe/card_base.c
index c9b886618071..2e1befbd1ad9 100644
--- a/drivers/misc/genwqe/card_base.c
+++ b/drivers/misc/genwqe/card_base.c
@@ -1089,24 +1089,9 @@ static int genwqe_pci_setup(struct genwqe_dev *cd)
 	}
 
 	/* check for 64-bit DMA address supported (DAC) */
-	if (!pci_set_dma_mask(pci_dev, DMA_BIT_MASK(64))) {
-		err = pci_set_consistent_dma_mask(pci_dev, DMA_BIT_MASK(64));
-		if (err) {
-			dev_err(&pci_dev->dev,
-				"err: DMA64 consistent mask error\n");
-			err = -EIO;
-			goto out_release_resources;
-		}
 	/* check for 32-bit DMA address supported (SAC) */
-	} else if (!pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32))) {
-		err = pci_set_consistent_dma_mask(pci_dev, DMA_BIT_MASK(32));
-		if (err) {
-			dev_err(&pci_dev->dev,
-				"err: DMA32 consistent mask error\n");
-			err = -EIO;
-			goto out_release_resources;
-		}
-	} else {
+	if (dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(64)) ||
+	    dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(32))) {
 		dev_err(&pci_dev->dev,
 			"err: neither DMA32 nor DMA64 supported\n");
 		err = -EIO;
-- 
2.27.0
