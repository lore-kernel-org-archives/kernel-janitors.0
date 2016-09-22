From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:42:12 +0000
Subject: [PATCH 10/14] GPU-DRM-TTM: Return directly after a failed kobject_init_and_add() in ttm_dma_page_all
Message-Id: <94a74055-0608-60f2-ce14-61b99abc5170@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 16:24:43 +0200

* Return directly after a call of the function "kobject_init_and_add"
  failed here.

* Delete the jump target "err" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index feba278..c21f45f 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -1102,12 +1102,10 @@ int ttm_dma_page_alloc_init(struct ttm_mem_global *glob, unsigned max_pages)
 				   &glob->kobj, "dma_pool");
 	if (unlikely(ret != 0)) {
 		kobject_put(&_manager->kobj);
-		goto err;
+		return ret;
 	}
 	ttm_dma_pool_mm_shrink_init(_manager);
 	return 0;
-err:
-	return ret;
 }
 
 void ttm_dma_page_alloc_fini(void)
-- 
2.10.0

