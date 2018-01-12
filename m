From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Jan 2018 17:36:03 +0000
Subject: [PATCH][next] drm/i915/pmu: fix sizeof on attr, should be *attr
Message-Id: <20180112173603.28486-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

I believe the sizeof(attr) should be in fact sizeof(*attr), fortunately
the current code works because sizeof(struct attribute **) is the same
as sizeof(struct attribute *) for x86.

Detected by CoverityScan, CID#1463854 ("Sizeof not portable")

Fixes: 109ec558370f ("drm/i915/pmu: Only enumerate available counters in sysfs")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 95ab5e28f5be..9be4f5201e41 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -794,7 +794,7 @@ create_event_attributes(struct drm_i915_private *i915)
 		goto err_alloc;
 
 	/* Max one pointer of each attribute type plus a termination entry. */
-	attr = kzalloc((count * 2 + 1) * sizeof(attr), GFP_KERNEL);
+	attr = kzalloc((count * 2 + 1) * sizeof(*attr), GFP_KERNEL);
 	if (!attr)
 		goto err_alloc;
 
-- 
2.15.1

