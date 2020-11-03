From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Nov 2020 10:16:23 +0000
Subject: [PATCH] iommu: fix a check in iommu_check_bind_data()
Message-Id: <20201103101623.GA1127762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, Jacob Pan <jacob.pan.linux@gmail.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org

The "data->flags" variable is a u64 so if one of the high 32 bits is
set the original code will allow it, but it should be rejected.  The
fix is to declare "mask" as a u64 instead of a u32.

Fixes: d90573812eea ("iommu/uapi: Handle data and argsz filled by users")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iommu/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8c470f451a32..b53446bb8c6b 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2071,7 +2071,7 @@ EXPORT_SYMBOL_GPL(iommu_uapi_cache_invalidate);
 
 static int iommu_check_bind_data(struct iommu_gpasid_bind_data *data)
 {
-	u32 mask;
+	u64 mask;
 	int i;
 
 	if (data->version != IOMMU_GPASID_BIND_VERSION_1)
-- 
2.28.0
