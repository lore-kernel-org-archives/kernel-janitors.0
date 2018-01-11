From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 11 Jan 2018 11:34:59 +0000
Subject: [PATCH -next] drm/etnaviv: make local symbols static
Message-Id: <1515670499-132320-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

drivers/gpu/drm/etnaviv/etnaviv_iommu.c:161:39: warning:
 symbol 'etnaviv_iommuv1_ops' was not declared. Should it be static?
drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c:239:39: warning:
 symbol 'etnaviv_iommuv2_ops' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_iommu.c | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 2 +-
 2 file changed, 2 insertion(+), 2 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
index 7a8c947..4b9b11c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
@@ -158,7 +158,7 @@ void etnaviv_iommuv1_restore(struct etnaviv_gpu *gpu)
 	gpu_write(gpu, VIVS_MC_MMU_RA_PAGE_TABLE, pgtable);
 }
 
-const struct etnaviv_iommu_domain_ops etnaviv_iommuv1_ops = {
+static const struct etnaviv_iommu_domain_ops etnaviv_iommuv1_ops = {
 	.free = etnaviv_iommuv1_domain_free,
 	.map = etnaviv_iommuv1_map,
 	.unmap = etnaviv_iommuv1_unmap,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
index 1e956e2..6e7c892 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
@@ -236,7 +236,7 @@ void etnaviv_iommuv2_restore(struct etnaviv_gpu *gpu)
 	gpu_write(gpu, VIVS_MMUv2_CONTROL, VIVS_MMUv2_CONTROL_ENABLE);
 }
 
-const struct etnaviv_iommu_domain_ops etnaviv_iommuv2_ops = {
+static const struct etnaviv_iommu_domain_ops etnaviv_iommuv2_ops = {
 	.free = etnaviv_iommuv2_domain_free,
 	.map = etnaviv_iommuv2_map,
 	.unmap = etnaviv_iommuv2_unmap,

