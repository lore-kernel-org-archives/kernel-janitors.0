From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:36:37 +0000
Subject: [PATCH 04/14] GPU-DRM-TTM: Rename a jump label in ttm_page_pool_get_pages()
Message-Id: <ba278f4b-e28d-6a92-c1c4-171b8f77f38b@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 14:36:47 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index f33f6f6..3dd603f 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -646,7 +646,7 @@ static unsigned ttm_page_pool_get_pages(struct ttm_page_pool *pool,
 		list_splice_init(&pool->list, pages);
 		count -= pool->npages;
 		pool->npages = 0;
-		goto out;
+		goto unlock;
 	}
 	/* find the last pages to include for requested number of pages. Split
 	 * pool to begin and halve it to reduce search space. */
@@ -667,7 +667,7 @@ static unsigned ttm_page_pool_get_pages(struct ttm_page_pool *pool,
 	list_cut_position(pages, &pool->list, p);
 	pool->npages -= count;
 	count = 0;
-out:
+ unlock:
 	spin_unlock_irqrestore(&pool->lock, irq_flags);
 	return count;
 }
-- 
2.10.0

