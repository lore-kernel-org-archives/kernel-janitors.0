From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:52:05 +0000
Subject: [PATCH 10/14] GPU-DRM-OMAP: Use kmalloc_array() in omap_gem_attach_pages()
Message-Id: <2e7b2e16-c448-3470-32d1-582db3aa6634@users.sourceforge.net>
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
Date: Wed, 21 Sep 2016 17:37:04 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 505dee0..e4f1924 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -259,7 +259,7 @@ static int omap_gem_attach_pages(struct drm_gem_object *obj)
 	 * DSS, GPU, etc. are not cache coherent:
 	 */
 	if (omap_obj->flags & (OMAP_BO_WC|OMAP_BO_UNCACHED)) {
-		addrs = kmalloc(npages * sizeof(*addrs), GFP_KERNEL);
+		addrs = kmalloc_array(npages, sizeof(*addrs), GFP_KERNEL);
 		if (!addrs) {
 			ret = -ENOMEM;
 			goto free_pages;
-- 
2.10.0

