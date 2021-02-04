From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Feb 2021 15:00:01 +0000
Subject: [PATCH][next][V2] iommu/mediatek: Fix unsigned domid comparison with less than zero
Message-Id: <20210204150001.102672-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for domid < 0 is always false because domid
is unsigned. Fix this by casting domid to an int before making
the comparison.

Addresses-Coverity: ("Unsigned comparison against 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: cast domid rather than making it an int. Replace L with : in
    the commit message.

---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0ad14a7604b1..1f262621ef19 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -645,7 +645,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_READ;
 
-	if (domid < 0)
+	if ((int)domid < 0)
 		return;
 	curdom = data->plat_data->iova_region + domid;
 	for (i = 0; i < data->plat_data->iova_region_nr; i++) {
-- 
2.29.2
