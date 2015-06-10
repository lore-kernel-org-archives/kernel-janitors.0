From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2015 10:59:27 +0000
Subject: [patch -next] iommu: checking for NULL instead of IS_ERR
Message-Id: <20150610105926.GA21772@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org

The iommu_group_alloc() and iommu_group_get_for_dev() functions return
error pointers, they never return NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index c520c0c..9c25e6be 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -788,15 +788,16 @@ static struct iommu_group *iommu_group_get_for_pci_dev(struct pci_dev *pdev)
 
 	/* No shared group found, allocate new */
 	group = iommu_group_alloc();
-	if (group) {
-		/*
-		 * Try to allocate a default domain - needs support from the
-		 * IOMMU driver.
-		 */
-		group->default_domain = __iommu_domain_alloc(pdev->dev.bus,
-							     IOMMU_DOMAIN_DMA);
-		group->domain = group->default_domain;
-	}
+	if (IS_ERR(group))
+		return NULL;
+
+	/*
+	 * Try to allocate a default domain - needs support from the
+	 * IOMMU driver.
+	 */
+	group->default_domain = __iommu_domain_alloc(pdev->dev.bus,
+						     IOMMU_DOMAIN_DMA);
+	group->domain = group->default_domain;
 
 	return group;
 }
@@ -1548,8 +1549,8 @@ int iommu_request_dm_for_dev(struct device *dev)
 
 	/* Device must already be in a group before calling this function */
 	group = iommu_group_get_for_dev(dev);
-	if (!group)
-		return -EINVAL;
+	if (IS_ERR(group))
+		return PTR_ERR(group);
 
 	mutex_lock(&group->mutex);
 
