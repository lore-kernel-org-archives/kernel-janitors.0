From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jan 2016 09:36:06 +0000
Subject: [patch] iommu/amd: remove an unneeded condition
Message-Id: <20160107093606.GB27186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, Jiang Liu <jiang.liu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org

get_device_id() returns an unsigned short device id.  It never fails and
it never returns a negative so we can remove this condition.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 6f6502d..539b0de 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -3857,11 +3857,9 @@ static struct irq_domain *get_irq_domain(struct irq_alloc_info *info)
 	case X86_IRQ_ALLOC_TYPE_MSI:
 	case X86_IRQ_ALLOC_TYPE_MSIX:
 		devid = get_device_id(&info->msi_dev->dev);
-		if (devid >= 0) {
-			iommu = amd_iommu_rlookup_table[devid];
-			if (iommu)
-				return iommu->msi_domain;
-		}
+		iommu = amd_iommu_rlookup_table[devid];
+		if (iommu)
+			return iommu->msi_domain;
 		break;
 	default:
 		break;
