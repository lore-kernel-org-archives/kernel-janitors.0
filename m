From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:56:12 +0000
Subject: [PATCH 14/14] GPU-DRM-OMAP: Rename a jump label in four functions
Message-Id: <ff3dbe73-ff9b-7f54-7d9e-cbb7cf51aa78@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
In-Reply-To: <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 18:00:23 +0200

Adjust jump labels according to the current Linux coding style convention.
Thus replace the identifier "fail" by "unlock" for this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 92510de..ea7ad1c 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -549,7 +549,7 @@ int omap_gem_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
 	/* if a shmem backed object, make sure we have pages attached now */
 	ret = get_pages(obj, &pages);
 	if (ret)
-		goto fail;
+		goto unlock;
 
 	/* where should we do corresponding put_pages().. we are mapping
 	 * the original page, rather than thru a GART, so we can't rely
@@ -561,9 +561,7 @@ int omap_gem_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
 		ret = fault_2d(obj, vma, vmf);
 	else
 		ret = fault_1d(obj, vma, vmf);
-
-
-fail:
+ unlock:
 	mutex_unlock(&dev->struct_mutex);
 	switch (ret) {
 	case 0:
@@ -682,14 +680,13 @@ int omap_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 	obj = drm_gem_object_lookup(file, handle);
 	if (obj = NULL) {
 		ret = -ENOENT;
-		goto fail;
+		goto unlock;
 	}
 
 	*offset = omap_gem_mmap_offset(obj);
 
 	drm_gem_object_unreference_unlocked(obj);
-
-fail:
+ unlock:
 	return ret;
 }
 
@@ -719,13 +716,12 @@ int omap_gem_roll(struct drm_gem_object *obj, uint32_t roll)
 		struct page **pages;
 		ret = get_pages(obj, &pages);
 		if (ret)
-			goto fail;
+			goto unlock;
 		ret = tiler_pin(omap_obj->block, pages, npages, roll, true);
 		if (ret)
 			dev_err(obj->dev->dev, "could not repin: %d\n", ret);
 	}
-
-fail:
+ unlock:
 	mutex_unlock(&obj->dev->struct_mutex);
 
 	return ret;
@@ -825,7 +821,7 @@ int omap_gem_get_paddr(struct drm_gem_object *obj,
 
 			ret = get_pages(obj, &pages);
 			if (ret)
-				goto fail;
+				goto unlock;
 
 			if (omap_obj->flags & OMAP_BO_TILED) {
 				block = tiler_reserve_2d(fmt,
@@ -839,7 +835,7 @@ int omap_gem_get_paddr(struct drm_gem_object *obj,
 				ret = PTR_ERR(block);
 				dev_err(obj->dev->dev,
 					"could not remap: %d (%d)\n", ret, fmt);
-				goto fail;
+				goto unlock;
 			}
 
 			/* TODO: enable async refill.. */
@@ -849,7 +845,7 @@ int omap_gem_get_paddr(struct drm_gem_object *obj,
 				tiler_release(block);
 				dev_err(obj->dev->dev,
 						"could not pin: %d\n", ret);
-				goto fail;
+				goto unlock;
 			}
 
 			omap_obj->paddr = tiler_ssptr(block);
@@ -865,10 +861,9 @@ int omap_gem_get_paddr(struct drm_gem_object *obj,
 		*paddr = omap_obj->paddr;
 	} else {
 		ret = -EINVAL;
-		goto fail;
+		goto unlock;
 	}
-
-fail:
+ unlock:
 	mutex_unlock(&obj->dev->struct_mutex);
 
 	return ret;
-- 
2.10.0

