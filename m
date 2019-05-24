From: Colin King <colin.king@canonical.com>
Date: Fri, 24 May 2019 21:26:27 +0000
Subject: [PATCH][next] drm/i915/gtt: set err to -ENOMEM on memory allocation failure
Message-Id: <20190524212627.24256-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the allocation of ppgtt->work fails the error return
path via err_free returns an uninitialized value in err. Fix this
by setting err to the appropriate error return of -ENOMEM.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: d3622099c76f ("drm/i915/gtt: Always acquire struct_mutex for gen6_ppgtt_cleanup")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/i915_gem_gtt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 8d8a4b0ad4d9..8a9b506387d4 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -2035,8 +2035,10 @@ static struct i915_hw_ppgtt *gen6_ppgtt_create(struct drm_i915_private *i915)
 	ppgtt->base.vm.pte_encode = ggtt->vm.pte_encode;
 
 	ppgtt->work = kmalloc(sizeof(*ppgtt->work), GFP_KERNEL);
-	if (!ppgtt->work)
+	if (!ppgtt->work) {
+		err = -ENOMEM;
 		goto err_free;
+	}
 
 	err = gen6_ppgtt_init_scratch(ppgtt);
 	if (err)
-- 
2.20.1
