From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Feb 2021 13:59:36 +0000
Subject: [PATCH][next] iommu/mediatek: Fix unsigned domid comparison with less than zero
Message-Id: <20210203135936.23016-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Anan sun <anan.sun@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Chao Hao <chao.hao@mediatek.com>, Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for domid < 0 is always false because domid
is unsigned.  Fix this by making it signed.

Addresses-CoverityL ("Unsigned comparison against 0")
Fixes: ab1d5281a62b ("iommu/mediatek: Add iova reserved function")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0ad14a7604b1..823d719945b2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -640,7 +640,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 				       struct list_head *head)
 {
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
-	unsigned int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
+	int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
 	const struct mtk_iommu_iova_region *resv, *curdom;
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_READ;
-- 
2.29.2
