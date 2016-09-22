From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:34:55 +0000
Subject: [PATCH 02/14] GPU-DRM-TTM: Rename a jump label in ttm_alloc_new_pages()
Message-Id: <ba7e2b2b-5852-35cc-48e2-f92bbf790d79@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 14:16:05 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index bfc51cb..13fdd19 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -527,7 +527,7 @@ static int ttm_alloc_new_pages(struct list_head *pages, gfp_t gfp_flags,
 						caching_array, cpages);
 			}
 			r = -ENOMEM;
-			goto out;
+			goto free_array;
 		}
 
 #ifdef CONFIG_HIGHMEM
@@ -546,7 +546,7 @@ static int ttm_alloc_new_pages(struct list_head *pages, gfp_t gfp_flags,
 					ttm_handle_caching_state_failure(pages,
 						ttm_flags, cstate,
 						caching_array, cpages);
-					goto out;
+					goto free_array;
 				}
 				cpages = 0;
 			}
@@ -562,7 +562,7 @@ static int ttm_alloc_new_pages(struct list_head *pages, gfp_t gfp_flags,
 					ttm_flags, cstate,
 					caching_array, cpages);
 	}
-out:
+ free_array:
 	kfree(caching_array);
 
 	return r;
-- 
2.10.0

