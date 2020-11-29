From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 29 Nov 2020 12:54:34 +0000
Subject: [PATCH] vdpa: ifcvf: Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201129125434.1462638-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mst@redhat.com, jasowang@redhat.com, lingshan.zhu@intel.com, eli@mellanox.com, parav@mellanox.com
Cc: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

While at it, fix a typo (s/confiugration/configuration)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/vdpa/ifcvf/ifcvf_main.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
index 8b4028556cb6..fa1af301cf55 100644
--- a/drivers/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
@@ -417,16 +417,9 @@ static int ifcvf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return ret;
 	}
 
-	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
 	if (ret) {
-		IFCVF_ERR(pdev, "No usable DMA confiugration\n");
-		return ret;
-	}
-
-	ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
-	if (ret) {
-		IFCVF_ERR(pdev,
-			  "No usable coherent DMA confiugration\n");
+		IFCVF_ERR(pdev, "No usable DMA configuration\n");
 		return ret;
 	}
 
-- 
2.27.0
