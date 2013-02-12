From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 12 Feb 2013 04:01:50 +0000
Subject: [PATCH 2/5] iommu: remove redundant NULL check before dma_ops_domain_free().
Message-Id: <1360641713-24895-3-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Cyril Roelandt <tipecaml@gmail.com>, joro@8bytes.org, iommu@lists.linux-foundation.org

dma_ops_domain_free on a NULL pointer is a no-op, so the NULL check in
amd_iommu_init_dma_ops() can be removed.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/iommu/amd_iommu.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index d33eaaf..98f555d 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -3187,8 +3187,7 @@ int __init amd_iommu_init_dma_ops(void)
 free_domains:
 
 	for_each_iommu(iommu) {
-		if (iommu->default_dom)
-			dma_ops_domain_free(iommu->default_dom);
+		dma_ops_domain_free(iommu->default_dom);
 	}
 
 	return ret;
-- 
1.7.10.4

