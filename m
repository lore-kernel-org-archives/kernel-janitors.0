From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 15 Sep 2019 19:34:01 +0000
Subject: [PATCH] iommu/arm-smmu: Axe a useless test in 'arm_smmu_master_alloc_smes()'
Message-Id: <20190915193401.27426-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

'ommu_group_get_for_dev()' never returns NULL, so this test can be removed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iommu/arm-smmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index c3ef0cc8f764..6fae8cdbe985 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1038,8 +1038,6 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	}
 
 	group = iommu_group_get_for_dev(dev);
-	if (!group)
-		group = ERR_PTR(-ENOMEM);
 	if (IS_ERR(group)) {
 		ret = PTR_ERR(group);
 		goto out_err;
-- 
2.20.1
