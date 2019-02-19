From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Feb 2019 15:01:29 +0000
Subject: [PATCH][next] drm/i915/selftests: fix memory leak of 'spin'
Message-Id: <20190219150129.12728-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a memory leak of 'spin' on an error return path. Fix this by
kfree'ing spin before the return.

Fixes: c06ee6ff2cbc ("drm/i915/selftests: Context SSEU reconfiguration tests")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_context.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/selftests/i915_gem_context.c
index d00d0bb07784..cf988797bb17 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_context.c
@@ -725,8 +725,10 @@ __sseu_prepare(struct drm_i915_private *i915,
 		}
 
 		ret = igt_spinner_init(spin, i915);
-		if (ret)
+		if (ret) {
+			kfree(spin);
 			return ret;
+		}
 
 		rq = igt_spinner_create_request(spin, ctx, engine, MI_NOOP);
 		if (IS_ERR(rq)) {
-- 
2.20.1
