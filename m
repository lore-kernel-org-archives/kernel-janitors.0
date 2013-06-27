From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Jun 2013 07:07:00 +0000
Subject: [patch] vfio/type1: fix a leak on error path
Message-Id: <20130627070700.GA10544@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

If vfio_unmap_unpin() returns an error then we leak "split".  I've moved
the allocation later in the function to fix this.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 98231d1..657f6a8 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -367,7 +367,6 @@ static int vfio_remove_dma_overlap(struct vfio_iommu *iommu, dma_addr_t start,
 				   size_t *size, struct vfio_dma *dma)
 {
 	size_t offset, overlap, tmp;
-	struct vfio_dma *split;
 	int ret;
 
 	if (!*size)
@@ -435,21 +434,13 @@ static int vfio_remove_dma_overlap(struct vfio_iommu *iommu, dma_addr_t start,
 		return 0;
 	}
 
-	/* Split existing */
-	split = kzalloc(sizeof(*split), GFP_KERNEL);
-	if (!split)
-		return -ENOMEM;
-
 	offset = start - dma->iova;
 
 	ret = vfio_unmap_unpin(iommu, dma, start, size);
 	if (ret)
 		return ret;
-
-	if (!*size) {
-		kfree(split);
+	if (!*size)
 		return -EINVAL;
-	}
 
 	tmp = dma->size;
 
@@ -458,13 +449,19 @@ static int vfio_remove_dma_overlap(struct vfio_iommu *iommu, dma_addr_t start,
 
 	/* Insert new for remainder, assuming it didn't all get unmapped */
 	if (likely(offset + *size < tmp)) {
+		struct vfio_dma *split;
+
+		/* Split existing */
+		split = kzalloc(sizeof(*split), GFP_KERNEL);
+		if (!split)
+			return -ENOMEM;
+
 		split->size = tmp - offset - *size;
 		split->iova = dma->iova + offset + *size;
 		split->vaddr = dma->vaddr + offset + *size;
 		split->prot = dma->prot;
 		vfio_insert_dma(iommu, split);
-	} else
-		kfree(split);
+	}
 
 	return 0;
 }
