From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:44:14 +0000
Subject: [PATCH 12/14] GPU-DRM-TTM: Less function calls in ttm_dma_pool_init() after error detection
Message-Id: <d4a64e64-0c22-bd6f-2b2f-6dc1bef33bc8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
In-Reply-To: <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:30:52 +0200

The kfree() function was called in up to two cases
by the ttm_dma_pool_init() function during error handling
even if the passed variable contained a null pointer.

Adjust jump targets according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index d5f41ed..4c50196 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -591,12 +591,12 @@ static struct dma_pool *ttm_dma_pool_init(struct device *dev, gfp_t flags,
 	pool = kmalloc_node(sizeof(struct dma_pool), GFP_KERNEL,
 			    dev_to_node(dev));
 	if (!pool)
-		goto err_mem;
+		goto free_devres;
 
 	sec_pool = kmalloc_node(sizeof(struct device_pools), GFP_KERNEL,
 				dev_to_node(dev));
 	if (!sec_pool)
-		goto err_mem;
+		goto free_pool;
 
 	INIT_LIST_HEAD(&sec_pool->pools);
 	sec_pool->dev = dev;
@@ -637,10 +637,10 @@ static struct dma_pool *ttm_dma_pool_init(struct device *dev, gfp_t flags,
 	devres_add(dev, ptr);
 
 	return pool;
-err_mem:
-	devres_free(ptr);
-	kfree(sec_pool);
+ free_pool:
 	kfree(pool);
+ free_devres:
+	devres_free(ptr);
 	return ERR_PTR(-ENOMEM);
 }
 
-- 
2.10.0

