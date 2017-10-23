From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Oct 2017 19:46:40 +0000
Subject: [PATCH] drm/etnaviv: Improve unlocking of a mutex in etnaviv_iommu_map_gem()
Message-Id: <5a6c753f-d822-fb9e-0ea4-054754bdf4cc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Oct 2017 21:27:30 +0200

Add a jump target so that a call of the function "mutex_unlock" is stored
only once at the end of this function implementation.
Replace three calls by goto statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index f103e787de94..9b0d797349d4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -221,18 +221,16 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu *mmu,
 		if (iova < 0x80000000 - sg_dma_len(sgt->sgl)) {
 			mapping->iova = iova;
 			list_add_tail(&mapping->mmu_node, &mmu->mappings);
-			mutex_unlock(&mmu->lock);
-			return 0;
+			ret = 0;
+			goto unlock;
 		}
 	}
 
 	node = &mapping->vram_node;
 
 	ret = etnaviv_iommu_find_iova(mmu, node, etnaviv_obj->base.size);
-	if (ret < 0) {
-		mutex_unlock(&mmu->lock);
-		return ret;
-	}
+	if (ret < 0)
+		goto unlock;
 
 	mmu->last_iova = node->start + etnaviv_obj->base.size;
 	mapping->iova = node->start;
@@ -242,13 +240,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu *mmu,
 	if (ret < 0) {
 		drm_mm_remove_node(node);
-		mutex_unlock(&mmu->lock);
-		return ret;
+		goto unlock;
 	}
 
 	list_add_tail(&mapping->mmu_node, &mmu->mappings);
 	mmu->need_flush = true;
+unlock:
 	mutex_unlock(&mmu->lock);
-
 	return ret;
 }
 
-- 
2.14.2

