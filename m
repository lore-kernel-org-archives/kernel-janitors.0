From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Nov 2020 07:49:16 +0000
Subject: [PATCH] crypto: marvell/octeontx - Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201121074916.1322898-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au, davem@davemloft.net, lbartosik@marvell.com, akpm@linux-foundation.org, hannes@cmpxchg.org, longman@redhat.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/marvell/octeontx/otx_cptpf_main.c | 10 ++--------
 drivers/crypto/marvell/octeontx/otx_cptvf_main.c | 10 ++--------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/marvell/octeontx/otx_cptpf_main.c b/drivers/crypto/marvell/octeontx/otx_cptpf_main.c
index 34bb3063eb70..14a42559f81d 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptpf_main.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptpf_main.c
@@ -212,15 +212,9 @@ static int otx_cpt_probe(struct pci_dev *pdev,
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
-		dev_err(dev, "Unable to get 48-bit DMA for consistent allocations\n");
+		dev_err(dev, "Unable to get usable 48-bit DMA configuration\n");
 		goto err_release_regions;
 	}
 
diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_main.c b/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
index 228fe8e47e0e..c076d0b3ad5f 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
@@ -804,15 +804,9 @@ static int otx_cptvf_probe(struct pci_dev *pdev,
 		dev_err(dev, "PCI request regions failed 0x%x\n", err);
 		goto disable_device;
 	}
-	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(48));
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(48));
 	if (err) {
-		dev_err(dev, "Unable to get usable DMA configuration\n");
-		goto release_regions;
-	}
-
-	err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(48));
-	if (err) {
-		dev_err(dev, "Unable to get 48-bit DMA for consistent allocations\n");
+		dev_err(dev, "Unable to get usable 48-bit DMA configuration\n");
 		goto release_regions;
 	}
 
-- 
2.27.0
