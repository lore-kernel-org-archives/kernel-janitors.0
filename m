From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 11:05:44 +0000
Subject: [patch] iommu/amd: Missing error code in amd_iommu_init_device()
Message-Id: <20161124110544.GE17225@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We should set "ret" to -EINVAL if iommu_group_get() fails.

Fixes: 55c99a4dc50f ("iommu/amd: Use iommu_attach_group()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iommu/amd_iommu_v2.c b/drivers/iommu/amd_iommu_v2.c
index 594849a..f8ed8c9 100644
--- a/drivers/iommu/amd_iommu_v2.c
+++ b/drivers/iommu/amd_iommu_v2.c
@@ -805,8 +805,10 @@ int amd_iommu_init_device(struct pci_dev *pdev, int pasids)
 		goto out_free_domain;
 
 	group = iommu_group_get(&pdev->dev);
-	if (!group)
+	if (!group) {
+		ret = -EINVAL;
 		goto out_free_domain;
+	}
 
 	ret = iommu_attach_group(dev_state->domain, group);
 	if (ret != 0)
