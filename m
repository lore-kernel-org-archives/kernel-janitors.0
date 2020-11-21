From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Nov 2020 09:03:02 +0000
Subject: [PATCH 1/2] net: pch_gbe: Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201121090302.1332491-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, kuba@kernel.org, kaixuxia@tencent.com, mhabets@solarflare.com, mst@redhat.com, luc.vanoostenryck@gmail.com, jesse.brandeburg@intel.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index b9e32e4478a8..8e4255efe829 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -2502,17 +2502,11 @@ static int pch_gbe_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))
-		|| pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64))) {
-		ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 		if (ret) {
-			ret = pci_set_consistent_dma_mask(pdev,
-							  DMA_BIT_MASK(32));
-			if (ret) {
-				dev_err(&pdev->dev, "ERR: No usable DMA "
-					"configuration, aborting\n");
-				return ret;
-			}
+			dev_err(&pdev->dev, "ERR: No usable DMA configuration, aborting\n");
+			return ret;
 		}
 	}
 
-- 
2.27.0
