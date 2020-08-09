From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Sun, 09 Aug 2020 07:43:09 +0000
Subject: [PATCH 2/4] IB/mthca: Remove pci-dma-compat wrapper APIs
Message-Id: <4998646a4cc2bf4abef6f8e63634944994f72dde.1596957073.git.usuraj35@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1596957073.git.usuraj35@gmail.com>
In-Reply-To: <cover.1596957073.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dledford@redhat.com, jgg@ziepe.ca
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
 drivers/infiniband/hw/mthca/mthca_eq.c      | 21 ++++++++++---------
 drivers/infiniband/hw/mthca/mthca_main.c    |  8 +++----
 drivers/infiniband/hw/mthca/mthca_memfree.c | 23 ++++++++++++---------
 3 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/infiniband/hw/mthca/mthca_eq.c b/drivers/infiniband/hw/mthca/mthca_eq.c
index 2cdf686203c1..9f311bd22f72 100644
--- a/drivers/infiniband/hw/mthca/mthca_eq.c
+++ b/drivers/infiniband/hw/mthca/mthca_eq.c
@@ -617,9 +617,9 @@ static void mthca_free_eq(struct mthca_dev *dev,
 
 	mthca_free_mr(dev, &eq->mr);
 	for (i = 0; i < npages; ++i)
-		pci_free_consistent(dev->pdev, PAGE_SIZE,
-				    eq->page_list[i].buf,
-				    dma_unmap_addr(&eq->page_list[i], mapping));
+		dma_free_coherent(&dev->pdev->dev, PAGE_SIZE,
+				  eq->page_list[i].buf,
+				  dma_unmap_addr(&eq->page_list[i], mapping));
 
 	kfree(eq->page_list);
 	mthca_free_mailbox(dev, mailbox);
@@ -739,17 +739,18 @@ int mthca_map_eq_icm(struct mthca_dev *dev, u64 icm_virt)
 	dev->eq_table.icm_page = alloc_page(GFP_HIGHUSER);
 	if (!dev->eq_table.icm_page)
 		return -ENOMEM;
-	dev->eq_table.icm_dma  = pci_map_page(dev->pdev, dev->eq_table.icm_page, 0,
-					      PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
-	if (pci_dma_mapping_error(dev->pdev, dev->eq_table.icm_dma)) {
+	dev->eq_table.icm_dma  = dma_map_page(&dev->pdev->dev,
+					      dev->eq_table.icm_page, 0,
+					      PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (dma_mapping_error(&dev->pdev->dev, dev->eq_table.icm_dma)) {
 		__free_page(dev->eq_table.icm_page);
 		return -ENOMEM;
 	}
 
 	ret = mthca_MAP_ICM_page(dev, dev->eq_table.icm_dma, icm_virt);
 	if (ret) {
-		pci_unmap_page(dev->pdev, dev->eq_table.icm_dma, PAGE_SIZE,
-			       PCI_DMA_BIDIRECTIONAL);
+		dma_unmap_page(&dev->pdev->dev, dev->eq_table.icm_dma,
+			       PAGE_SIZE, DMA_BIDIRECTIONAL);
 		__free_page(dev->eq_table.icm_page);
 	}
 
@@ -759,8 +760,8 @@ int mthca_map_eq_icm(struct mthca_dev *dev, u64 icm_virt)
 void mthca_unmap_eq_icm(struct mthca_dev *dev)
 {
 	mthca_UNMAP_ICM(dev, dev->eq_table.icm_virt, 1);
-	pci_unmap_page(dev->pdev, dev->eq_table.icm_dma, PAGE_SIZE,
-		       PCI_DMA_BIDIRECTIONAL);
+	dma_unmap_page(&dev->pdev->dev, dev->eq_table.icm_dma, PAGE_SIZE,
+		       DMA_BIDIRECTIONAL);
 	__free_page(dev->eq_table.icm_page);
 }
 
diff --git a/drivers/infiniband/hw/mthca/mthca_main.c b/drivers/infiniband/hw/mthca/mthca_main.c
index fe9654a7af71..d6465ae897b1 100644
--- a/drivers/infiniband/hw/mthca/mthca_main.c
+++ b/drivers/infiniband/hw/mthca/mthca_main.c
@@ -937,20 +937,20 @@ static int __mthca_init_one(struct pci_dev *pdev, int hca_type)
 
 	pci_set_master(pdev);
 
-	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
+	err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
 	if (err) {
 		dev_warn(&pdev->dev, "Warning: couldn't set 64-bit PCI DMA mask.\n");
-		err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+		err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 		if (err) {
 			dev_err(&pdev->dev, "Can't set PCI DMA mask, aborting.\n");
 			goto err_free_res;
 		}
 	}
-	err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
+	err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
 	if (err) {
 		dev_warn(&pdev->dev, "Warning: couldn't set 64-bit "
 			 "consistent PCI DMA mask.\n");
-		err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
+		err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 		if (err) {
 			dev_err(&pdev->dev, "Can't set consistent PCI DMA mask, "
 				"aborting.\n");
diff --git a/drivers/infiniband/hw/mthca/mthca_memfree.c b/drivers/infiniband/hw/mthca/mthca_memfree.c
index fa808582b08b..215a01b24258 100644
--- a/drivers/infiniband/hw/mthca/mthca_memfree.c
+++ b/drivers/infiniband/hw/mthca/mthca_memfree.c
@@ -66,8 +66,8 @@ static void mthca_free_icm_pages(struct mthca_dev *dev, struct mthca_icm_chunk *
 	int i;
 
 	if (chunk->nsg > 0)
-		pci_unmap_sg(dev->pdev, chunk->mem, chunk->npages,
-			     PCI_DMA_BIDIRECTIONAL);
+		dma_unmap_sg(&dev->pdev->dev, chunk->mem, chunk->npages,
+		             DMA_BIDIRECTIONAL);
 
 	for (i = 0; i < chunk->npages; ++i)
 		__free_pages(sg_page(&chunk->mem[i]),
@@ -184,9 +184,10 @@ struct mthca_icm *mthca_alloc_icm(struct mthca_dev *dev, int npages,
 			if (coherent)
 				++chunk->nsg;
 			else if (chunk->npages = MTHCA_ICM_CHUNK_LEN) {
-				chunk->nsg = pci_map_sg(dev->pdev, chunk->mem,
+				chunk->nsg = dma_map_sg(&dev->pdev->dev,
+							chunk->mem,
 							chunk->npages,
-							PCI_DMA_BIDIRECTIONAL);
+							DMA_BIDIRECTIONAL);
 
 				if (chunk->nsg <= 0)
 					goto fail;
@@ -204,9 +205,8 @@ struct mthca_icm *mthca_alloc_icm(struct mthca_dev *dev, int npages,
 	}
 
 	if (!coherent && chunk) {
-		chunk->nsg = pci_map_sg(dev->pdev, chunk->mem,
-					chunk->npages,
-					PCI_DMA_BIDIRECTIONAL);
+		chunk->nsg = dma_map_sg(&dev->pdev->dev, chunk->mem,
+					chunk->npages, DMA_BIDIRECTIONAL);
 
 		if (chunk->nsg <= 0)
 			goto fail;
@@ -480,7 +480,8 @@ int mthca_map_user_db(struct mthca_dev *dev, struct mthca_uar *uar,
 	sg_set_page(&db_tab->page[i].mem, pages[0], MTHCA_ICM_PAGE_SIZE,
 			uaddr & ~PAGE_MASK);
 
-	ret = pci_map_sg(dev->pdev, &db_tab->page[i].mem, 1, PCI_DMA_TODEVICE);
+	ret = dma_map_sg(&dev->pdev->dev, &db_tab->page[i].mem, 1,
+			 DMA_TO_DEVICE);
 	if (ret < 0) {
 		unpin_user_page(pages[0]);
 		goto out;
@@ -489,7 +490,8 @@ int mthca_map_user_db(struct mthca_dev *dev, struct mthca_uar *uar,
 	ret = mthca_MAP_ICM_page(dev, sg_dma_address(&db_tab->page[i].mem),
 				 mthca_uarc_virt(dev, uar, i));
 	if (ret) {
-		pci_unmap_sg(dev->pdev, &db_tab->page[i].mem, 1, PCI_DMA_TODEVICE);
+		dma_unmap_sg(&dev->pdev->dev, &db_tab->page[i].mem, 1,
+			     DMA_TO_DEVICE);
 		unpin_user_page(sg_page(&db_tab->page[i].mem));
 		goto out;
 	}
@@ -555,7 +557,8 @@ void mthca_cleanup_user_db_tab(struct mthca_dev *dev, struct mthca_uar *uar,
 	for (i = 0; i < dev->uar_table.uarc_size / MTHCA_ICM_PAGE_SIZE; ++i) {
 		if (db_tab->page[i].uvirt) {
 			mthca_UNMAP_ICM(dev, mthca_uarc_virt(dev, uar, i), 1);
-			pci_unmap_sg(dev->pdev, &db_tab->page[i].mem, 1, PCI_DMA_TODEVICE);
+			dma_unmap_sg(&dev->pdev->dev, &db_tab->page[i].mem, 1,
+				     DMA_TO_DEVICE);
 			unpin_user_page(sg_page(&db_tab->page[i].mem));
 		}
 	}
-- 
2.17.1
