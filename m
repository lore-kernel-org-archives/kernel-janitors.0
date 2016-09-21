From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:54:19 +0000
Subject: [PATCH 12/14] GPU-DRM-OMAP: Move a variable assignment in omap_gem_attach_pages()
Message-Id: <50aaf72b-eb09-0a81-9856-800d797b7ccb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
In-Reply-To: <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 17:42:28 +0200

Move one assignment for the local variable "npages" so that its setting
will only be performed after a call of the function "drm_gem_get_pages"
succeeded by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 26f1212..3c49ad9 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -243,7 +243,7 @@ static int omap_gem_attach_pages(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 	struct page **pages;
-	int npages = obj->size >> PAGE_SHIFT;
+	int npages;
 	int i, ret;
 	dma_addr_t *addrs;
 
@@ -255,6 +255,8 @@ static int omap_gem_attach_pages(struct drm_gem_object *obj)
 		return PTR_ERR(pages);
 	}
 
+	npages = obj->size >> PAGE_SHIFT;
+
 	/* for non-cached buffers, ensure the new pages are clean because
 	 * DSS, GPU, etc. are not cache coherent:
 	 */
-- 
2.10.0

