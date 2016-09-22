From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:37:37 +0000
Subject: [PATCH 05/14] GPU-DRM-TTM: Use kmalloc_array() in two more functions
Message-Id: <050b05d3-60ad-3768-8519-3ea37c34b188@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 14:48:39 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data types by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index bef9f6f..194818d 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -439,8 +439,9 @@ static unsigned ttm_dma_page_pool_free(struct dma_pool *pool, unsigned nr_free,
 	if (use_static)
 		pages_to_free = static_buf;
 	else
-		pages_to_free = kmalloc(npages_to_free * sizeof(struct page *),
-					GFP_KERNEL);
+		pages_to_free = kmalloc_array(npages_to_free,
+					      sizeof(*pages_to_free),
+					      GFP_KERNEL);
 
 	if (!pages_to_free) {
 		pr_err("%s: Failed to allocate memory for pool free operation\n",
@@ -726,8 +727,9 @@ static int ttm_dma_pool_alloc_new_pages(struct dma_pool *pool,
 			(unsigned)(PAGE_SIZE/sizeof(struct page *)));
 
 	/* allocate array for page caching change */
-	caching_array = kmalloc(max_cpages*sizeof(struct page *), GFP_KERNEL);
-
+	caching_array = kmalloc_array(max_cpages,
+				      sizeof(*caching_array),
+				      GFP_KERNEL);
 	if (!caching_array) {
 		pr_err("%s: Unable to allocate table for new pages\n",
 		       pool->dev_name);
-- 
2.10.0

