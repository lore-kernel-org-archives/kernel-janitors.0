From: Colin King <colin.king@canonical.com>
Date: Tue, 10 Oct 2017 13:47:33 +0000
Subject: [PATCH] drm/i915: remove redundant check on has_aliasing_ppgtt
Message-Id: <20171010134733.17516-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a previous check to on has_aliasing_ppgtt that returns
0 if it is false, so it is impossible for has_aliasing_ppgtt to
be false on the final return of function intel_sanitize_enable_ppgtt,
so final return in the function always will return 1.  Hence the
redundant ternary operator can be replaced with a return 1.

Detected by CoverityScan, CID#1357136 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/i915_gem_gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 4c82ceb8d318..e1a318ea4327 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -188,7 +188,7 @@ int intel_sanitize_enable_ppgtt(struct drm_i915_private *dev_priv,
 			return 2;
 	}
 
-	return has_aliasing_ppgtt ? 1 : 0;
+	return 1;
 }
 
 static int ppgtt_bind_vma(struct i915_vma *vma,
-- 
2.14.1

