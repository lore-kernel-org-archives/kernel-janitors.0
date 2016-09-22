From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:33:51 +0000
Subject: [PATCH 01/14] GPU-DRM-TTM: Use kmalloc_array() in two functions
Message-Id: <3fb3509e-fd3f-010e-9736-529ba42e506b@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 14:00:31 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data types by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index a37de5d..bfc51cb 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -315,8 +315,9 @@ static int ttm_page_pool_free(struct ttm_page_pool *pool, unsigned nr_free,
 	if (use_static)
 		pages_to_free = static_buf;
 	else
-		pages_to_free = kmalloc(npages_to_free * sizeof(struct page *),
-					GFP_KERNEL);
+		pages_to_free = kmalloc_array(npages_to_free,
+					      sizeof(*pages_to_free),
+					      GFP_KERNEL);
 	if (!pages_to_free) {
 		pr_err("Failed to allocate memory for pool free operation\n");
 		return 0;
@@ -501,8 +502,9 @@ static int ttm_alloc_new_pages(struct list_head *pages, gfp_t gfp_flags,
 			(unsigned)(PAGE_SIZE/sizeof(struct page *)));
 
 	/* allocate array for page caching change */
-	caching_array = kmalloc(max_cpages*sizeof(struct page *), GFP_KERNEL);
-
+	caching_array = kmalloc_array(max_cpages,
+				      sizeof(*caching_array),
+				      GFP_KERNEL);
 	if (!caching_array) {
 		pr_err("Unable to allocate table for new pages\n");
 		return -ENOMEM;
-- 
2.10.0

