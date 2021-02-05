From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Feb 2021 12:46:17 +0000
Subject: [PATCH] iommu/mediatek: Fix error code in probe()
Message-Id: <YB0+GU5akSdu29Vu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org

This error path is supposed to return -EINVAL.  It used to return
directly but we added some clean up and accidentally removed the
error code.  Also I fixed a typo in the error message.

Fixes: c0b57581b73b ("iommu/mediatek: Add power-domain operation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iommu/mtk_iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0ad14a7604b1..5f78ac0dc30e 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -886,7 +886,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	link = device_link_add(data->smicomm_dev, dev,
 			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
 	if (!link) {
-		dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
+		dev_err(dev, "Unable to link %s.\n", dev_name(data->smicomm_dev));
+		ret = -EINVAL;
 		goto out_runtime_disable;
 	}
 
-- 
2.30.0
