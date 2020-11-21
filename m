From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Nov 2020 07:13:59 +0000
Subject: [PATCH] crypto: qat - Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201121071359.1320167-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: giovanni.cabiddu@intel.com, herbert@gondor.apana.org.au, davem@davemloft.net, andriy.shevchenko@linux.intel.com, fiona.trahe@intel.com, wojciech.ziemba@intel.com, marco.chiappero@intel.com
Cc: qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

While at it, also remove some unless extra () in the 32 bits case.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Instead of returning -EFAULT, we could also propagate the error returned
by dma_set_mask_and_coherent()
---
 drivers/crypto/qat/qat_c3xxx/adf_drv.c      | 9 ++-------
 drivers/crypto/qat/qat_c3xxxvf/adf_drv.c    | 9 ++-------
 drivers/crypto/qat/qat_c62x/adf_drv.c       | 9 ++-------
 drivers/crypto/qat/qat_c62xvf/adf_drv.c     | 9 ++-------
 drivers/crypto/qat/qat_dh895xcc/adf_drv.c   | 9 ++-------
 drivers/crypto/qat/qat_dh895xccvf/adf_drv.c | 9 ++-------
 6 files changed, 12 insertions(+), 42 deletions(-)

diff --git a/drivers/crypto/qat/qat_c3xxx/adf_drv.c b/drivers/crypto/qat/qat_c3xxx/adf_drv.c
index 7fb3343ae8b0..b39e06820295 100644
--- a/drivers/crypto/qat/qat_c3xxx/adf_drv.c
+++ b/drivers/crypto/qat/qat_c3xxx/adf_drv.c
@@ -159,17 +159,12 @@ static int adf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	/* set dma identifier */
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
-		if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(32)))) {
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
+		if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32))) {
 			dev_err(&pdev->dev, "No usable DMA configuration\n");
 			ret = -EFAULT;
 			goto out_err_disable;
-		} else {
-			pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
 		}
-
-	} else {
-		pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
 	}
 
 	if (pci_request_regions(pdev, ADF_C3XXX_DEVICE_NAME)) {
diff --git a/drivers/crypto/qat/qat_c3xxxvf/adf_drv.c b/drivers/crypto/qat/qat_c3xxxvf/adf_drv.c
index 1d1532e8fb6d..b1d1d12694dc 100644
--- a/drivers/crypto/qat/qat_c3xxxvf/adf_drv.c
+++ b/drivers/crypto/qat/qat_c3xxxvf/adf_drv.c
@@ -141,17 +141,12 @@ static int adf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	/* set dma identifier */
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
-		if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(32)))) {
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
+		if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32))) {
 			dev_err(&pdev->dev, "No usable DMA configuration\n");
 			ret = -EFAULT;
 			goto out_err_disable;
-		} else {
-			pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
 		}
-
-	} else {
-		pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
 	}
 
 	if (pci_request_regions(pdev, ADF_C3XXXVF_DEVICE_NAME)) {
diff --git a/drivers/crypto/qat/qat_c62x/adf_drv.c b/drivers/crypto/qat/qat_c62x/adf_drv.c
index 1f5de442e1e6..99f6f3c7c6b0 100644
--- a/drivers/crypto/qat/qat_c62x/adf_drv.c
+++ b/drivers/crypto/qat/qat_c62x/adf_drv.c
@@ -159,17 +159,12 @@ static int adf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	/* set dma identifier */
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
-		if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(32)))) {
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
+		if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32))) {
 			dev_err(&pdev->dev, "No usable DMA configuration\n");
 			ret = -EFAULT;
 			goto out_err_disable;
-		} else {
-			pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
 		}
-
-	} else {
-		pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
 	}
 
 	if (pci_request_regions(pdev, ADF_C62X_DEVICE_NAME)) {
diff --git a/drivers/crypto/qat/qat_c62xvf/adf_drv.c b/drivers/crypto/qat/qat_c62xvf/adf_drv.c
index 04742a6d91ca..26c0b7d08636 100644
--- a/drivers/crypto/qat/qat_c62xvf/adf_drv.c
+++ b/drivers/crypto/qat/qat_c62xvf/adf_drv.c
@@ -141,17 +141,12 @@ static int adf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	/* set dma identifier */
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
-		if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(32)))) {
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
+		if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32))) {
 			dev_err(&pdev->dev, "No usable DMA configuration\n");
 			ret = -EFAULT;
 			goto out_err_disable;
-		} else {
-			pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
 		}
-
-	} else {
-		pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
 	}
 
 	if (pci_request_regions(pdev, ADF_C62XVF_DEVICE_NAME)) {
diff --git a/drivers/crypto/qat/qat_dh895xcc/adf_drv.c b/drivers/crypto/qat/qat_dh895xcc/adf_drv.c
index a9ec4357144c..78fdbaceda85 100644
--- a/drivers/crypto/qat/qat_dh895xcc/adf_drv.c
+++ b/drivers/crypto/qat/qat_dh895xcc/adf_drv.c
@@ -159,17 +159,12 @@ static int adf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	/* set dma identifier */
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
-		if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(32)))) {
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
+		if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32))) {
 			dev_err(&pdev->dev, "No usable DMA configuration\n");
 			ret = -EFAULT;
 			goto out_err_disable;
-		} else {
-			pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
 		}
-
-	} else {
-		pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
 	}
 
 	if (pci_request_regions(pdev, ADF_DH895XCC_DEVICE_NAME)) {
diff --git a/drivers/crypto/qat/qat_dh895xccvf/adf_drv.c b/drivers/crypto/qat/qat_dh895xccvf/adf_drv.c
index c972554a755e..9e03063c9901 100644
--- a/drivers/crypto/qat/qat_dh895xccvf/adf_drv.c
+++ b/drivers/crypto/qat/qat_dh895xccvf/adf_drv.c
@@ -141,17 +141,12 @@ static int adf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	/* set dma identifier */
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
-		if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(32)))) {
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
+		if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32))) {
 			dev_err(&pdev->dev, "No usable DMA configuration\n");
 			ret = -EFAULT;
 			goto out_err_disable;
-		} else {
-			pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
 		}
-
-	} else {
-		pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
 	}
 
 	if (pci_request_regions(pdev, ADF_DH895XCCVF_DEVICE_NAME)) {
-- 
2.27.0
