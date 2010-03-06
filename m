From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Mar 2010 11:05:39 +0000
Subject: [patch] i915: fix small leak on error path
Message-Id: <20100306110539.GD4958@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Luca Barbieri <luca@luca-barbieri.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.sourceforge.net

We should free "params" before returning.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/i915/intel_overlay.c b/drivers/gpu/drm/i915/intel_overlay.c
index d355d1d..60595fc 100644
--- a/drivers/gpu/drm/i915/intel_overlay.c
+++ b/drivers/gpu/drm/i915/intel_overlay.c
@@ -1068,14 +1068,18 @@ int intel_overlay_put_image(struct drm_device *dev, void *data,
 
 	drmmode_obj = drm_mode_object_find(dev, put_image_rec->crtc_id,
                         DRM_MODE_OBJECT_CRTC);
-	if (!drmmode_obj)
-		return -ENOENT;
+	if (!drmmode_obj) {
+		ret = -ENOENT;
+		goto out_free;
+	}
 	crtc = to_intel_crtc(obj_to_crtc(drmmode_obj));
 
 	new_bo = drm_gem_object_lookup(dev, file_priv,
 			put_image_rec->bo_handle);
-	if (!new_bo)
-		return -ENOENT;
+	if (!new_bo) {
+		ret = -ENOENT;
+		goto out_free;
+	}
 
 	mutex_lock(&dev->mode_config.mutex);
 	mutex_lock(&dev->struct_mutex);
@@ -1165,6 +1169,7 @@ out_unlock:
 	mutex_unlock(&dev->struct_mutex);
 	mutex_unlock(&dev->mode_config.mutex);
 	drm_gem_object_unreference_unlocked(new_bo);
+out_free:
 	kfree(params);
 
 	return ret;
