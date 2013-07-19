From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jul 2013 05:45:46 +0000
Subject: [patch 1/2] drm/i915: checking for NULL instead of IS_ERR()
Message-Id: <20130719054546.GA17391@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

i915_gem_vma_create() returns and ERR_PTR() or a valid pointer, it never
returns NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 40c2fc6..9a9a77a 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -3113,9 +3113,9 @@ i915_gem_object_bind_to_gtt(struct drm_i915_gem_object *obj,
 	i915_gem_object_pin_pages(obj);
 
 	vma = i915_gem_vma_create(obj, &dev_priv->gtt.base);
-	if (vma = NULL) {
+	if (IS_ERR(vma)) {
 		i915_gem_object_unpin_pages(obj);
-		return -ENOMEM;
+		return PTR_ERR(vma);
 	}
 
 search_free:
diff --git a/drivers/gpu/drm/i915/i915_gem_stolen.c b/drivers/gpu/drm/i915/i915_gem_stolen.c
index f526136..27ffb4c 100644
--- a/drivers/gpu/drm/i915/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/i915_gem_stolen.c
@@ -395,8 +395,8 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_device *dev,
 		return obj;
 
 	vma = i915_gem_vma_create(obj, &dev_priv->gtt.base);
-	if (!vma) {
-		ret = -ENOMEM;
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
 		goto err_out;
 	}
 
