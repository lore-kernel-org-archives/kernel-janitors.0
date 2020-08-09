From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Sun, 09 Aug 2020 07:41:27 +0000
Subject: [PATCH 1/4] IB/hfi1: Remove pci-dma-compat wrapper APIs
Message-Id: <1d74b57647f511de3d5ab96dbb4149fdbce58f64.1596957073.git.usuraj35@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1596957073.git.usuraj35@gmail.com>
In-Reply-To: <cover.1596957073.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dledford@redhat.com, jgg@ziepe.ca, mike.marciniszyn@intel.com, dennis.dalessandro@intel.com
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The legacy API wrappers in include/linux/pci-dma-compat.h
should go away as it creates unnecessary midlayering
for include/linux/dma-mapping.h APIs.

Instead use dma-mapping.h APIs directly.

The patch has been generated with the coccinelle script below
and compile-tested.

@@@@
- PCI_DMA_BIDIRECTIONAL
+ DMA_BIDIRECTIONAL

@@@@
- PCI_DMA_TODEVICE
+ DMA_TO_DEVICE

@@@@
- PCI_DMA_FROMDEVICE
+ DMA_FROM_DEVICE

@@@@
- PCI_DMA_NONE
+ DMA_NONE

@@ expression E1, E2, E3; @@
- pci_alloc_consistent(E1, E2, E3)
+ dma_alloc_coherent(&E1->dev, E2, E3, GFP_)

@@ expression E1, E2, E3; @@
- pci_zalloc_consistent(E1, E2, E3)
+ dma_alloc_coherent(&E1->dev, E2, E3, GFP_)

@@ expression E1, E2, E3, E4; @@
- pci_free_consistent(E1, E2, E3, E4)
+ dma_free_coherent(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_map_single(E1, E2, E3, E4)
+ dma_map_single(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_unmap_single(E1, E2, E3, E4)
+ dma_unmap_single(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4, E5; @@
- pci_map_page(E1, E2, E3, E4, E5)
+ dma_map_page(&E1->dev, E2, E3, E4, E5)

@@ expression E1, E2, E3, E4; @@
- pci_unmap_page(E1, E2, E3, E4)
+ dma_unmap_page(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_map_sg(E1, E2, E3, E4)
+ dma_map_sg(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_unmap_sg(E1, E2, E3, E4)
+ dma_unmap_sg(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_single_for_cpu(E1, E2, E3, E4)
+ dma_sync_single_for_cpu(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_single_for_device(E1, E2, E3, E4)
+ dma_sync_single_for_device(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_sg_for_cpu(E1, E2, E3, E4)
+ dma_sync_sg_for_cpu(&E1->dev, E2, E3, E4)

@@ expression E1, E2, E3, E4; @@
- pci_dma_sync_sg_for_device(E1, E2, E3, E4)
+ dma_sync_sg_for_device(&E1->dev, E2, E3, E4)

@@ expression E1, E2; @@
- pci_dma_mapping_error(E1, E2)
+ dma_mapping_error(&E1->dev, E2)

@@ expression E1, E2; @@
- pci_set_consistent_dma_mask(E1, E2)
+ dma_set_coherent_mask(&E1->dev, E2)

@@ expression E1, E2; @@
- pci_set_dma_mask(E1, E2)
+ dma_set_mask(&E1->dev, E2)

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/infiniband/hw/hfi1/pcie.c         |  8 ++++----
 drivers/infiniband/hw/hfi1/user_exp_rcv.c | 13 ++++++-------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/pcie.c b/drivers/infiniband/hw/hfi1/pcie.c
index 18d32f053d26..a2356bfa1485 100644
--- a/drivers/infiniband/hw/hfi1/pcie.c
+++ b/drivers/infiniband/hw/hfi1/pcie.c
@@ -92,21 +92,21 @@ int hfi1_pcie_init(struct hfi1_devdata *dd)
 		goto bail;
 	}
 
-	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
+	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
 	if (ret) {
 		/*
 		 * If the 64 bit setup fails, try 32 bit.  Some systems
 		 * do not setup 64 bit maps on systems with 2GB or less
 		 * memory installed.
 		 */
-		ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 		if (ret) {
 			dd_dev_err(dd, "Unable to set DMA mask: %d\n", ret);
 			goto bail;
 		}
-		ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
+		ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 	} else {
-		ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
+		ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
 	}
 	if (ret) {
 		dd_dev_err(dd, "Unable to set DMA consistent mask: %d\n", ret);
diff --git a/drivers/infiniband/hw/hfi1/user_exp_rcv.c b/drivers/infiniband/hw/hfi1/user_exp_rcv.c
index f81ca20f4b69..fe737da3d1dc 100644
--- a/drivers/infiniband/hw/hfi1/user_exp_rcv.c
+++ b/drivers/infiniband/hw/hfi1/user_exp_rcv.c
@@ -175,8 +175,8 @@ static void unpin_rcv_pages(struct hfi1_filedata *fd,
 	struct hfi1_devdata *dd = fd->uctxt->dd;
 
 	if (mapped) {
-		pci_unmap_single(dd->pcidev, node->dma_addr,
-				 node->npages * PAGE_SIZE, PCI_DMA_FROMDEVICE);
+		dma_unmap_single(&dd->pcidev->dev, node->dma_addr,
+				 node->npages * PAGE_SIZE, DMA_FROM_DEVICE);
 		pages = &node->pages[idx];
 	} else {
 		pages = &tidbuf->pages[idx];
@@ -735,9 +735,8 @@ static int set_rcvarray_entry(struct hfi1_filedata *fd,
 	if (!node)
 		return -ENOMEM;
 
-	phys = pci_map_single(dd->pcidev,
-			      __va(page_to_phys(pages[0])),
-			      npages * PAGE_SIZE, PCI_DMA_FROMDEVICE);
+	phys = dma_map_single(&dd->pcidev->dev, __va(page_to_phys(pages[0])),
+			      npages * PAGE_SIZE, DMA_FROM_DEVICE);
 	if (dma_mapping_error(&dd->pcidev->dev, phys)) {
 		dd_dev_err(dd, "Failed to DMA map Exp Rcv pages 0x%llx\n",
 			   phys);
@@ -779,8 +778,8 @@ static int set_rcvarray_entry(struct hfi1_filedata *fd,
 	hfi1_cdbg(TID, "Failed to insert RB node %u 0x%lx, 0x%lx %d",
 		  node->rcventry, node->notifier.interval_tree.start,
 		  node->phys, ret);
-	pci_unmap_single(dd->pcidev, phys, npages * PAGE_SIZE,
-			 PCI_DMA_FROMDEVICE);
+	dma_unmap_single(&dd->pcidev->dev, phys, npages * PAGE_SIZE,
+			 DMA_FROM_DEVICE);
 	kfree(node);
 	return -EFAULT;
 }
-- 
2.17.1
