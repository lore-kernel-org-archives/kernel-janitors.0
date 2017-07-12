From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 07:27:10 +0000
Subject: [PATCH] drm/i915: Fix error code in __create_hw_context()
Message-Id: <20170712072710.2uqqhomiup6zi2qx@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We accidentally forget to set the error code here, which means that we
return NULL.  The callers aren't expecting that and Oops.

Fixes: 4ff4b44cbb70 ("drm/i915: Store a direct lookup from object handle to vma")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/i915_gem_context.c b/drivers/gpu/drm/i915/i915_gem_context.c
index 39ed58a21fc1..25a73365a5be 100644
--- a/drivers/gpu/drm/i915/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/i915_gem_context.c
@@ -275,8 +275,10 @@ __create_hw_context(struct drm_i915_private *dev_priv,
 	ctx->vma_lut.ht = kcalloc(ctx->vma_lut.ht_size,
 				  sizeof(*ctx->vma_lut.ht),
 				  GFP_KERNEL);
-	if (!ctx->vma_lut.ht)
+	if (!ctx->vma_lut.ht) {
+		ret = -ENOMEM;
 		goto err_out;
+	}
 
 	INIT_WORK(&ctx->vma_lut.resize, resize_vma_ht);
 
