From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Nov 2020 07:31:31 +0000
Subject: [PATCH] crypto: cavium/zip - Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201121073131.1321343-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net, miaoqinglang@huawei.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/cavium/zip/zip_main.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/cavium/zip/zip_main.c b/drivers/crypto/cavium/zip/zip_main.c
index d35216e2f6cd..812b4ac9afd6 100644
--- a/drivers/crypto/cavium/zip/zip_main.c
+++ b/drivers/crypto/cavium/zip/zip_main.c
@@ -263,15 +263,9 @@ static int zip_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_disable_device;
 	}
 
-	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(48));
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(48));
 	if (err) {
-		dev_err(dev, "Unable to get usable DMA configuration\n");
-		goto err_release_regions;
-	}
-
-	err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(48));
-	if (err) {
-		dev_err(dev, "Unable to get 48-bit DMA for allocations\n");
+		dev_err(dev, "Unable to get usable 48-bit DMA configuration\n");
 		goto err_release_regions;
 	}
 
-- 
2.27.0
