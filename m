From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 10 Sep 2017 08:56:42 +0000
Subject: [PATCH] drm/i915: Fix an error handling in 'intel_framebuffer_init()'
Message-Id: <20170910085642.13673-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

We should go through the error handling path to decrease the
'framebuffer_references' as done everywhere else in this function.

Fixes: 2e2adb05736c ("drm/i915: Add render decompression support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/i915/intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index 7cd392f2cd94..478fa449003f 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -14077,7 +14077,7 @@ static int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 		if (mode_cmd->handles[i] != mode_cmd->handles[0]) {
 			DRM_DEBUG_KMS("bad plane %d handle\n", i);
-			return -EINVAL;
+			goto err;
 		}
 
 		stride_alignment = intel_fb_stride_alignment(fb, i);
-- 
2.11.0

