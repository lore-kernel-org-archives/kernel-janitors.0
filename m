From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Oct 2010 21:17:25 +0000
Subject: [patch] i915: signedness bug in check_overlay_src()
Message-Id: <20101027211724.GI6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

"depth" should be signed in case packed_depth_bytes() returns -EINVAL.

This probably doesn't make a difference at runtime.  In the original
code we would return -EINVAL later if (rec->offset_Y % 4294967274) is
non-zero.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/i915/intel_overlay.c b/drivers/gpu/drm/i915/intel_overlay.c
index afb96d2..02ff0a4 100644
--- a/drivers/gpu/drm/i915/intel_overlay.c
+++ b/drivers/gpu/drm/i915/intel_overlay.c
@@ -946,7 +946,9 @@ static int check_overlay_src(struct drm_device *dev,
 {
 	int uv_hscale = uv_hsubsampling(rec->flags);
 	int uv_vscale = uv_vsubsampling(rec->flags);
-	u32 stride_mask, depth, tmp;
+	u32 stride_mask;
+	int depth;
+	u32 tmp;
 
 	/* check src dimensions */
 	if (IS_845G(dev) || IS_I830(dev)) {
