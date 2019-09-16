From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 16 Sep 2019 20:29:36 +0000
Subject: [PATCH] iommu/qcom: Simplify a test in 'qcom_iommu_add_device()'
Message-Id: <20190916202936.30403-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: agross@kernel.org, robdclark@gmail.com, joro@8bytes.org
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'iommu_group_get_for_dev()' never returns NULL, so this test can be
simplified a bit.

This way, the test is consistent with all other calls to
'iommu_group_get_for_dev()'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iommu/qcom_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index c31e7bc4ccbe..3d99ec868892 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -539,8 +539,8 @@ static int qcom_iommu_add_device(struct device *dev)
 	}
 
 	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR_OR_NULL(group))
-		return PTR_ERR_OR_ZERO(group);
+	if (IS_ERR(group))
+		return PTR_ERR(group);
 
 	iommu_group_put(group);
 	iommu_device_link(&qcom_iommu->iommu, dev);
-- 
2.20.1
