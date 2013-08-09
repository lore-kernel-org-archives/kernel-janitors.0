From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Aug 2013 09:44:11 +0000
Subject: [patch] drm/i915: unbreak i915_gem_object_ggtt_unbind()
Message-Id: <20130809094411.GB29282@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

There is an extra semi-colon here so we just leak and never unbind
anything.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 735f43f..a582540 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -2656,7 +2656,7 @@ i915_gem_object_ggtt_unbind(struct drm_i915_gem_object *obj)
 	struct drm_i915_private *dev_priv = obj->base.dev->dev_private;
 	struct i915_address_space *ggtt = &dev_priv->gtt.base;
 
-	if (!i915_gem_obj_ggtt_bound(obj));
+	if (!i915_gem_obj_ggtt_bound(obj))
 		return 0;
 
 	if (obj->pin_count)
