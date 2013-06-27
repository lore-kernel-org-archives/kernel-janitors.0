From: Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 27 Jun 2013 14:45:54 +0000
Subject: Re: [patch] vfio/type1: fix a leak on error path
Message-Id: <1372344354.30572.629.camel@ul30vt.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130627070700.GA10544@elgon.mountain>
In-Reply-To: <20130627070700.GA10544@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2013-06-27 at 10:07 +0300, Dan Carpenter wrote:
> If vfio_unmap_unpin() returns an error then we leak "split".  I've moved
> the allocation later in the function to fix this.

Thanks for spotting this and for the patch.  The allocation is done
early because if we get an allocation failure later, we lose track of
iommu mappings, which leads to other leaks.  I think it's best to fix
the exit path, but we can improve the comment and fix an inconsistent
return value at the same time.  Thanks,

Alex


vfio/type1: Fix leak on error path
    
We also don't handle unpinning zero pages as an error on other exits
so we can fix that inconsistency by rolling in the next conditional
return.
    
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 98231d1..a9807de 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -436,6 +436,12 @@ static int vfio_remove_dma_overlap(struct vfio_iommu *iommu, dma_addr_t start,
 	}
 
 	/* Split existing */
+
+	/*
+	 * Allocate our tracking structure early even though it may not
+	 * be used.  An Allocation failure later loses track of pages and
+	 * is more difficult to unwind.
+	 */
 	split = kzalloc(sizeof(*split), GFP_KERNEL);
 	if (!split)
 		return -ENOMEM;
@@ -443,12 +449,9 @@ static int vfio_remove_dma_overlap(struct vfio_iommu *iommu, dma_addr_t start,
 	offset = start - dma->iova;
 
 	ret = vfio_unmap_unpin(iommu, dma, start, size);
-	if (ret)
-		return ret;
-
-	if (!*size) {
+	if (ret || !*size) {
 		kfree(split);
-		return -EINVAL;
+		return ret;
 	}
 
 	tmp = dma->size;


