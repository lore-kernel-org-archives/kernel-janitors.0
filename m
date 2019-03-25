From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Mar 2019 09:23:49 +0000
Subject: [PATCH] drm/i915: Fix an error code in i915_gem_context_open()
Message-Id: <20190325092349.GF16023@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

If gem_context_register() fails then "ctx" is a valid pointer, not an
error pointer.  We should just return "err".

Fixes: 3aa9945a528e ("drm/i915: Separate GEM context construction and registration to userspace")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/i915_gem_context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_context.c b/drivers/gpu/drm/i915/i915_gem_context.c
index e6f594668245..25f267a03d3d 100644
--- a/drivers/gpu/drm/i915/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/i915_gem_context.c
@@ -709,7 +709,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
 	idr_destroy(&file_priv->context_idr);
 	mutex_destroy(&file_priv->vm_idr_lock);
 	mutex_destroy(&file_priv->context_idr_lock);
-	return PTR_ERR(ctx);
+	return err;
 }
 
 void i915_gem_context_close(struct drm_file *file)
-- 
2.17.1
