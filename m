From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:41:20 +0000
Subject: [PATCH 09/14] GPU-DRM-TTM: Return directly after a failed kzalloc() in ttm_dma_page_alloc_init()
Message-Id: <30cd1943-7762-65b7-4307-39ae0acdf699@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 16:16:36 +0200

* Return directly after a memory allocation failed in this function
  at the beginning.

* Delete the explicit initialisation for the local variable "ret"
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index e3f5542..feba278 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -1080,7 +1080,7 @@ static void ttm_dma_pool_mm_shrink_fini(struct ttm_pool_manager *manager)
 
 int ttm_dma_page_alloc_init(struct ttm_mem_global *glob, unsigned max_pages)
 {
-	int ret = -ENOMEM;
+	int ret;
 
 	WARN_ON(_manager);
 
@@ -1088,7 +1088,7 @@ int ttm_dma_page_alloc_init(struct ttm_mem_global *glob, unsigned max_pages)
 
 	_manager = kzalloc(sizeof(*_manager), GFP_KERNEL);
 	if (!_manager)
-		goto err;
+		return -ENOMEM;
 
 	mutex_init(&_manager->lock);
 	INIT_LIST_HEAD(&_manager->pools);
-- 
2.10.0

