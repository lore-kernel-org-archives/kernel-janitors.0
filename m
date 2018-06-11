From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Jun 2018 16:00:37 +0000
Subject: [PATCH] drm/i915/guc: remove redundant GEM_BUG_ON check
Message-Id: <20180611160037.23402-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for level being less than zero is redundant as level
is an unsigned u32 and hence will never be less than zero.
Remove this redundant check.

Detected by CoverityScan, CID#1468363 ("Macro compares unsigned to 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/intel_guc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_guc.c b/drivers/gpu/drm/i915/intel_guc.c
index 116f4ccf1bbd..a2f782a4f97d 100644
--- a/drivers/gpu/drm/i915/intel_guc.c
+++ b/drivers/gpu/drm/i915/intel_guc.c
@@ -208,8 +208,6 @@ static u32 get_log_control_flags(void)
 	u32 level = i915_modparams.guc_log_level;
 	u32 flags = 0;
 
-	GEM_BUG_ON(level < 0);
-
 	if (!GUC_LOG_LEVEL_IS_ENABLED(level))
 		flags |= GUC_LOG_DEFAULT_DISABLED;
 
-- 
2.17.0

