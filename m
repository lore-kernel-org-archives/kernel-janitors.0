From: Colin King <colin.king@canonical.com>
Date: Wed, 09 Oct 2019 10:00:24 +0000
Subject: [PATCH][next] drm/i915/selftests: fix null pointer dereference on pointer data
Message-Id: <20191009100024.23077-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where data fails to be allocated the error exit path is
via label 'out' where data is dereferenced in a for-loop.  Fix this
by exiting via the label 'out_file' instead to avoid the null pointer
dereference.

Addresses-Coverity: ("Dereference after null check")
Fixes: 50d16d44cce4 ("drm/i915/selftests: Exercise context switching in parallel")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index fb58c0919ea1..e5c235051ae5 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -263,7 +263,7 @@ static int live_parallel_switch(void *arg)
 	if (!data) {
 		i915_gem_context_unlock_engines(ctx);
 		err = -ENOMEM;
-		goto out;
+		goto out_file;
 	}
 
 	m = 0; /* Use the first context as our template for the engines */
-- 
2.20.1
