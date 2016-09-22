From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 17:45:18 +0000
Subject: [PATCH 13/14] GPU-DRM-TTM: Delete unnecessary variable initialisations in ttm_dma_pool_init()
Message-Id: <58dbc452-eff7-3ef5-3a61-4ec4a26fd15e@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 17:37:24 +0200

Two local variables will be set to an appropriate pointer a bit later.
Thus omit the explicit initialisation which became unnecessary with
a previous update step.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index 4c50196..aa1679d 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -576,8 +576,8 @@ static struct dma_pool *ttm_dma_pool_init(struct device *dev, gfp_t flags,
 {
 	char *n[] = {"wc", "uc", "cached", " dma32", "unknown",};
 	enum pool_type t[] = {IS_WC, IS_UC, IS_CACHED, IS_DMA32, IS_UNDEFINED};
-	struct device_pools *sec_pool = NULL;
-	struct dma_pool *pool = NULL, **ptr;
+	struct device_pools *sec_pool;
+	struct dma_pool *pool, **ptr;
 	unsigned i;
 	char *p;
 
-- 
2.10.0

