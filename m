From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jul 2012 06:44:49 +0000
Subject: [patch] drm/i915: dereferencing an error pointer
Message-Id: <20120717064449.GB14985@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We need to check that "ctx" is a valid pointer before dereferencing it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies to linux-next.

diff --git a/drivers/gpu/drm/i915/i915_gem_context.c b/drivers/gpu/drm/i915/i915_gem_context.c
index 9ae3f2c..a82c0ec 100644
--- a/drivers/gpu/drm/i915/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/i915_gem_context.c
@@ -496,11 +496,13 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 
 	ctx = create_hw_context(dev, file_priv);
 	mutex_unlock(&dev->struct_mutex);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	args->ctx_id = ctx->id;
 	DRM_DEBUG_DRIVER("HW context %d created\n", args->ctx_id);
 
-	return PTR_RET(ctx);
+	return 0;
 }
 
 int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
