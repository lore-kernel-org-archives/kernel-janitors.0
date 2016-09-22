From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:39:37 +0000
Subject: [PATCH 07/14] GPU-DRM-TTM: Rename jump labels in ttm_dma_page_pool_free()
Message-Id: <f7228de5-7772-ec00-a0f0-baf05888ffe8@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 15:32:32 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index 9dc1632..ce3d361 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -449,7 +449,7 @@ static unsigned ttm_dma_page_pool_free(struct dma_pool *pool, unsigned nr_free,
 		return 0;
 	}
 	INIT_LIST_HEAD(&d_pages);
-restart:
+ lock_restart:
 	spin_lock_irqsave(&pool->lock, irq_flags);
 
 	/* We picking the oldest ones off the list */
@@ -489,14 +489,13 @@ restart:
 
 			/* free all so restart the processing */
 			if (nr_free)
-				goto restart;
+				goto lock_restart;
 
 			/* Not allowed to fall through or break because
 			 * following context is inside spinlock while we are
 			 * outside here.
 			 */
-			goto out;
-
+			goto check_pages_to_free;
 		}
 	}
 
@@ -510,7 +509,7 @@ restart:
 
 	if (freed_pages)
 		ttm_dma_pages_put(pool, &d_pages, pages_to_free, freed_pages);
-out:
+ check_pages_to_free:
 	if (pages_to_free != static_buf)
 		kfree(pages_to_free);
 	return nr_free;
-- 
2.10.0

