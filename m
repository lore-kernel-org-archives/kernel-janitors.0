From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Mar 2019 05:08:43 +0000
Subject: [PATCH] drm/i915/selftests: Fix an IS_ERR() vs NULL check
Message-Id: <20190326050843.GA20038@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tdz@users.sourceforge.net>

The live_context() function returns error pointers.  It never returns
NULL.

Fixes: 9c1477e83e62 ("drm/i915/selftests: Exercise adding requests to a full GGTT")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index 9a9451846b33..89766688e420 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -455,7 +455,7 @@ static int igt_evict_contexts(void *arg)
 			struct i915_gem_context *ctx;
 
 			ctx = live_context(i915, file);
-			if (!ctx)
+			if (IS_ERR(ctx))
 				break;
 
 			/* We will need some GGTT space for the rq's context */
-- 
2.17.1
