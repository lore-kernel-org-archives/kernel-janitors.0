From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 30 Oct 2020 18:26:30 +0000
Subject: [PATCH] iommu/vt-d: Avoid GFP_ATOMIC where it is not needed
Message-Id: <20201030182630.5154-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, baolu.lu@linux.intel.com, joro@8bytes.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

There is no reason to use GFP_ATOMIC in a 'suspend' function.
Use GFP_KERNEL instead to give more opportunities to allocate the
requested memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Should GFP_ATOMIC be mandatory here, a comment explaining why would be great
---
 drivers/iommu/intel/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index f8177c59d229..cd2a82ed78b5 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4114,7 +4114,7 @@ static int iommu_suspend(void)
 
 	for_each_active_iommu(iommu, drhd) {
 		iommu->iommu_state = kcalloc(MAX_SR_DMAR_REGS, sizeof(u32),
-						 GFP_ATOMIC);
+					     GFP_KERNEL);
 		if (!iommu->iommu_state)
 			goto nomem;
 	}
-- 
2.27.0
