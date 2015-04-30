From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Apr 2015 14:30:50 +0000
Subject: [patch] drm/i915: checking IS_ERR() instead of NULL
Message-Id: <20150430143050.GB22086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We switched from calling i915_gem_alloc_context_obj() to calling
i915_gem_alloc_object() so the error handling needs to be updated to
check for NULL instead of IS_ERR().

Fixes: 149c86e74fe4 ('drm/i915: Allocate context objects from stolen')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/intel_lrc.c b/drivers/gpu/drm/i915/intel_lrc.c
index 732fd63..0fa9209 100644
--- a/drivers/gpu/drm/i915/intel_lrc.c
+++ b/drivers/gpu/drm/i915/intel_lrc.c
@@ -1895,10 +1895,9 @@ int intel_lr_context_deferred_create(struct intel_context *ctx,
 	context_size = round_up(get_lr_context_size(ring), 4096);
 
 	ctx_obj = i915_gem_alloc_object(dev, context_size);
-	if (IS_ERR(ctx_obj)) {
-		ret = PTR_ERR(ctx_obj);
-		DRM_DEBUG_DRIVER("Alloc LRC backing obj failed: %d\n", ret);
-		return ret;
+	if (!ctx_obj) {
+		DRM_DEBUG_DRIVER("Alloc LRC backing obj failed.\n");
+		return -ENOMEM;
 	}
 
 	if (is_global_default_ctx) {
