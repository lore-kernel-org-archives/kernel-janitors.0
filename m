From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:38:42 +0000
Subject: [PATCH 06/14] GPU-DRM-TTM: Rename a jump label in ttm_dma_pool_alloc_new_pages()
Message-Id: <dce2cbff-8ad5-27a1-087b-f2a2ed013ffd@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 14:54:12 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index 194818d..9dc1632 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -758,7 +758,7 @@ static int ttm_dma_pool_alloc_new_pages(struct dma_pool *pool,
 						cpages);
 			}
 			r = -ENOMEM;
-			goto out;
+			goto free_array;
 		}
 		p = dma_p->p;
 #ifdef CONFIG_HIGHMEM
@@ -777,7 +777,7 @@ static int ttm_dma_pool_alloc_new_pages(struct dma_pool *pool,
 					ttm_dma_handle_caching_state_failure(
 						pool, d_pages, caching_array,
 						cpages);
-					goto out;
+					goto free_array;
 				}
 				cpages = 0;
 			}
@@ -791,7 +791,7 @@ static int ttm_dma_pool_alloc_new_pages(struct dma_pool *pool,
 			ttm_dma_handle_caching_state_failure(pool, d_pages,
 					caching_array, cpages);
 	}
-out:
+ free_array:
 	kfree(caching_array);
 	return r;
 }
-- 
2.10.0

