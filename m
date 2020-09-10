From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Sep 2020 10:08:50 +0000
Subject: [PATCH] drm/i915: Fix an error code i915_gem_object_copy_blt()
Message-Id: <20200910100850.GD79916@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>

This code should use "vma[1]" instead of "vma".  The "vma" is a variable
is a valid pointer.

Fixes: 6b05030496f7 ("drm/i915: Convert i915_gem_object/client_blt.c to use ww locking as well, v2.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
index d93eb36160c9..aee7ad3cc3c6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
@@ -364,7 +364,7 @@ int i915_gem_object_copy_blt(struct drm_i915_gem_object *src,
 
 	vma[1] = i915_vma_instance(dst, vm, NULL);
 	if (IS_ERR(vma[1]))
-		return PTR_ERR(vma);
+		return PTR_ERR(vma[1]);
 
 	i915_gem_ww_ctx_init(&ww, true);
 	intel_engine_pm_get(ce->engine);
-- 
2.28.0
