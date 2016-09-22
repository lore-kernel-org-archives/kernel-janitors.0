From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:43:04 +0000
Subject: [PATCH 11/14] GPU-DRM-TTM: Return an error code only as a constant in ttm_dma_pool_init()
Message-Id: <7e8a9893-8f1f-189a-4f19-d105c9502747@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 17:17:19 +0200

* Return an error code without storing it in a local variable.

* Delete the local variable "ret" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index c21f45f..d5f41ed 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -579,7 +579,6 @@ static struct dma_pool *ttm_dma_pool_init(struct device *dev, gfp_t flags,
 	struct device_pools *sec_pool = NULL;
 	struct dma_pool *pool = NULL, **ptr;
 	unsigned i;
-	int ret = -ENODEV;
 	char *p;
 
 	if (!dev)
@@ -589,8 +588,6 @@ static struct dma_pool *ttm_dma_pool_init(struct device *dev, gfp_t flags,
 	if (!ptr)
 		return NULL;
 
-	ret = -ENOMEM;
-
 	pool = kmalloc_node(sizeof(struct dma_pool), GFP_KERNEL,
 			    dev_to_node(dev));
 	if (!pool)
@@ -644,7 +641,7 @@ err_mem:
 	devres_free(ptr);
 	kfree(sec_pool);
 	kfree(pool);
-	return ERR_PTR(ret);
+	return ERR_PTR(-ENOMEM);
 }
 
 static struct dma_pool *ttm_dma_find_pool(struct device *dev,
-- 
2.10.0

