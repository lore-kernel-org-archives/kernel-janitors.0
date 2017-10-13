From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Oct 2017 11:05:01 +0000
Subject: [PATCH] vfio/type1: silence integer overflow warning
Message-Id: <20171013110500.6apnjjw67lnvhlrk@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

I get a static checker warning about the potential integer overflow if
we add "unmap->iova + unmap->size".  The integer overflow isn't really
harmful, but we may as well fix it.  Also unmap->size gets truncated to
size_t when we pass it to vfio_find_dma() so we could check for too high
values of that as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 92155cce926d..89d50aeafd71 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -767,6 +767,9 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
 		return -EINVAL;
 	if (!unmap->size || unmap->size & mask)
 		return -EINVAL;
+	if (unmap->iova + unmap->size < unmap->iova ||
+	    unmap->size > SIZE_MAX)
+		return -EINVAL;
 
 	WARN_ON(mask & PAGE_MASK);
 again:
