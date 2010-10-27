From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Oct 2010 21:25:34 +0000
Subject: [patch] i915: fix impossible BUG_ON() test
Message-Id: <20101027212534.GM6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

obj_priv->pin_count is unsigned so the BUG_ON(obj_priv->pin_count < 0)
will never trigger.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 8eb8453..151d9c8 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -4082,10 +4082,11 @@ i915_gem_object_unpin(struct drm_gem_object *obj)
 	struct drm_i915_gem_object *obj_priv = to_intel_bo(obj);
 
 	WARN_ON(i915_verify_lists(dev));
-	obj_priv->pin_count--;
-	BUG_ON(obj_priv->pin_count < 0);
+	BUG_ON(obj_priv->pin_count = 0);
 	BUG_ON(obj_priv->gtt_space = NULL);
 
+	obj_priv->pin_count--;
+
 	/* If the object is no longer pinned, and is
 	 * neither active nor being flushed, then stick it on
 	 * the inactive list
