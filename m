From: Colin King <colin.king@canonical.com>
Date: Sat, 11 May 2019 12:41:35 +0000
Subject: [PATCH] iommu/amd: remove redundant assignment to variable npages
Message-Id: <20190511124135.3635-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable npages is being initialized however this is never read and
later it is being reassigned to a new value. The initialization is
redundant and hence can be removed.

Addresses-Coverity: ("Unused Value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iommu/amd_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 09c9e45f7fa2..c0b5b9298e8e 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -2609,7 +2609,7 @@ static void unmap_sg(struct device *dev, struct scatterlist *sglist,
 	struct protection_domain *domain;
 	struct dma_ops_domain *dma_dom;
 	unsigned long startaddr;
-	int npages = 2;
+	int npages;
 
 	domain = get_domain(dev);
 	if (IS_ERR(domain))
-- 
2.20.1
