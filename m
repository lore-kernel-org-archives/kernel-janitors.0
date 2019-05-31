From: Colin King <colin.king@canonical.com>
Date: Fri, 31 May 2019 10:32:01 +0000
Subject: [PATCH][next] drm/i915: fix use of uninitialized pointer vaddr
Message-Id: <20190531103201.10124-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Auld <matthew.auld@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of err is using the incorrect pointer vaddr that has
not been initialized. Fix this by using the correct pointer obj instead.

Addresses-Coverity: ("Uninitialized pointer read")
Fixes: 6501aa4e3a45 ("drm/i915: add in-kernel blitter client")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
index 8de568d2c792..e23d8c9e9298 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
@@ -32,7 +32,7 @@ static int igt_fill_blt(void *arg)
 
 		obj = i915_gem_object_create_internal(i915, sz);
 		if (IS_ERR(obj)) {
-			err = PTR_ERR(vaddr);
+			err = PTR_ERR(obj);
 			goto err_flush;
 		}
 
-- 
2.20.1
