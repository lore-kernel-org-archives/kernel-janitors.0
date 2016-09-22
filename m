From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:46:10 +0000
Subject: [PATCH 14/14] GPU-DRM-TTM: Mark an array of text strings as "const" in ttm_dma_pool_init()
Message-Id: <9bb7cfe3-c230-93b5-01b8-697ad8f67843@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 18:46:01 +0200

The local variable "n" was not modified after it was initialized with
a few text strings.
Thus express this detail also by the data type qualifier "const".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index aa1679d..e21c1b3 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -574,7 +574,7 @@ static int ttm_dma_pool_match(struct device *dev, void *res, void *match_data)
 static struct dma_pool *ttm_dma_pool_init(struct device *dev, gfp_t flags,
 					  enum pool_type type)
 {
-	char *n[] = {"wc", "uc", "cached", " dma32", "unknown",};
+	char const * const n[] = {"wc", "uc", "cached", " dma32", "unknown",};
 	enum pool_type t[] = {IS_WC, IS_UC, IS_CACHED, IS_DMA32, IS_UNDEFINED};
 	struct device_pools *sec_pool;
 	struct dma_pool *pool, **ptr;
-- 
2.10.0

