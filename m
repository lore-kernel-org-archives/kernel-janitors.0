From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:55:19 +0000
Subject: [PATCH 13/14] GPU-DRM-OMAP: Rename a jump label in omap_gem_new_dmabuf()
Message-Id: <48e87ab8-a85f-ca51-ebac-bb6f6012fbcc@users.sourceforge.net>
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
Date: Wed, 21 Sep 2016 17:45:04 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 3c49ad9..92510de 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -1442,7 +1442,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 	obj = omap_gem_new(dev, gsize, OMAP_BO_MEM_DMABUF | OMAP_BO_WC);
 	if (!obj) {
 		obj = ERR_PTR(-ENOMEM);
-		goto done;
+		goto unlock;
 	}
 
 	omap_obj = to_omap_bo(obj);
@@ -1462,7 +1462,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 		if (!pages) {
 			omap_gem_free_object(obj);
 			obj = ERR_PTR(-ENOMEM);
-			goto done;
+			goto unlock;
 		}
 
 		omap_obj->pages = pages;
@@ -1476,11 +1476,10 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 		if (WARN_ON(i != npages)) {
 			omap_gem_free_object(obj);
 			obj = ERR_PTR(-ENOMEM);
-			goto done;
+			goto unlock;
 		}
 	}
-
-done:
+ unlock:
 	mutex_unlock(&dev->struct_mutex);
 	return obj;
 }
-- 
2.10.0

