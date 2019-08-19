From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 19 Aug 2019 06:17:33 +0000
Subject: [PATCH -next] drm/etnaviv: fix missing unlock on error in etnaviv_iommuv1_context_alloc()
Message-Id: <20190819061733.50023-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function etnaviv_iommuv1_context_alloc()
in the error handling case.

Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
index aac8dbf3ea56..1a7c89a67bea 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
@@ -140,8 +140,10 @@ etnaviv_iommuv1_context_alloc(struct etnaviv_iommu_global *global)
 	}
 
 	v1_context = kzalloc(sizeof(*v1_context), GFP_KERNEL);
-	if (!v1_context)
+	if (!v1_context) {
+		mutex_unlock(&global->lock);
 		return NULL;
+	}
 
 	v1_context->pgtable_cpu = dma_alloc_wc(global->dev, PT_SIZE,
 					       &v1_context->pgtable_dma,
