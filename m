From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Nov 2020 07:56:47 +0000
Subject: [PATCH] crypto: cavium - Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201121075647.1324006-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net, gcherian@marvell.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/cavium/cpt/cptpf_main.c | 10 ++--------
 drivers/crypto/cavium/cpt/cptvf_main.c | 10 ++--------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/cavium/cpt/cptpf_main.c b/drivers/crypto/cavium/cpt/cptpf_main.c
index 781949027451..24d63bdc5dd2 100644
--- a/drivers/crypto/cavium/cpt/cptpf_main.c
+++ b/drivers/crypto/cavium/cpt/cptpf_main.c
@@ -569,15 +569,9 @@ static int cpt_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto cpt_err_disable_device;
 	}
 
-	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(48));
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(48));
 	if (err) {
-		dev_err(dev, "Unable to get usable DMA configuration\n");
-		goto cpt_err_release_regions;
-	}
-
-	err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(48));
-	if (err) {
-		dev_err(dev, "Unable to get 48-bit DMA for consistent allocations\n");
+		dev_err(dev, "Unable to get usable 48-bit DMA configuration\n");
 		goto cpt_err_release_regions;
 	}
 
diff --git a/drivers/crypto/cavium/cpt/cptvf_main.c b/drivers/crypto/cavium/cpt/cptvf_main.c
index a15245992cf9..f016448e43bb 100644
--- a/drivers/crypto/cavium/cpt/cptvf_main.c
+++ b/drivers/crypto/cavium/cpt/cptvf_main.c
@@ -687,15 +687,9 @@ static int cptvf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 	/* Mark as VF driver */
 	cptvf->flags |= CPT_FLAG_VF_DRIVER;
-	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(48));
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(48));
 	if (err) {
-		dev_err(dev, "Unable to get usable DMA configuration\n");
-		goto cptvf_err_release_regions;
-	}
-
-	err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(48));
-	if (err) {
-		dev_err(dev, "Unable to get 48-bit DMA for consistent allocations\n");
+		dev_err(dev, "Unable to get usable 48-bit DMA configuration\n");
 		goto cptvf_err_release_regions;
 	}
 
-- 
2.27.0
