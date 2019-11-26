From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:50:03 +0000
Subject: [PATCH] drm/i915: unmap the correct pointer in i915_error_object_create()
Message-Id: <20191126125003.zpczouqpyr7njwha@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Bruce Chang <yu.bruce.chang@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We should be unmapping "page" instead of "s".  This code originally used
kmap_atomic() before it was changed to kmap().  The two mapping
functions are different which leads to this common mistake.

Fixes: 3e749f5199e1 ("drm/i915: Avoid atomic context for error capture")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 3c85cb0ee99f..6fe23446303b 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1045,7 +1045,7 @@ i915_error_object_create(struct drm_i915_private *i915,
 
 			s = kmap(page);
 			ret = compress_page(compress, s, dst);
-			kunmap(s);
+			kunmap(page);
 
 			drm_clflush_pages(&page, 1);
 
-- 
2.11.0
