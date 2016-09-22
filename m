From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:35:47 +0000
Subject: [PATCH 03/14] GPU-DRM-TTM: Rename jump labels in ttm_page_pool_free()
Message-Id: <c965a015-d674-5867-4a38-ade343afc8be@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 14:30:12 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index 13fdd19..f33f6f6 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -322,8 +322,7 @@ static int ttm_page_pool_free(struct ttm_page_pool *pool, unsigned nr_free,
 		pr_err("Failed to allocate memory for pool free operation\n");
 		return 0;
 	}
-
-restart:
+ lock_restart:
 	spin_lock_irqsave(&pool->lock, irq_flags);
 
 	list_for_each_entry_reverse(p, &pool->list, lru) {
@@ -356,14 +355,13 @@ restart:
 
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
 
@@ -379,7 +377,7 @@ restart:
 
 	if (freed_pages)
 		ttm_pages_put(pages_to_free, freed_pages);
-out:
+ check_pages_to_free:
 	if (pages_to_free != static_buf)
 		kfree(pages_to_free);
 	return nr_free;
-- 
2.10.0

