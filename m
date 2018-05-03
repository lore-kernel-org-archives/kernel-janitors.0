From: Colin King <colin.king@canonical.com>
Date: Thu, 03 May 2018 15:45:10 +0000
Subject: [PATCH] drm/i915/selftests: fix spelling mistake: "parmaters" -> "parameters"
Message-Id: <20180503154510.708-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_err error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/selftests/i915_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index eb89e301b602..e90f97236e50 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -81,7 +81,7 @@ checked_vma_instance(struct drm_i915_gem_object *obj,
 	}
 
 	if (i915_vma_compare(vma, vm, view)) {
-		pr_err("i915_vma_compare failed with create parmaters!\n");
+		pr_err("i915_vma_compare failed with create parameters!\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
2.17.0

