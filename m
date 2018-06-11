From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Jun 2018 16:46:53 +0000
Subject: [PATCH][V2] drm/i915/guc: fix GEM_BUG_ON check
Message-Id: <20180611164653.13691-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for level being less than zero always false because flags
is currently unsigned and can never be negative. Fix this by making
flags a s32.

Detected by CoverityScan, CID#1468363 ("Macro compares unsigned to 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>

---
V2: Make flags s32 rather than remove the GEM_BUG_ON check, thanks to
Ville Syrjälä for spotting the mistake in my first attempt.
---
 drivers/gpu/drm/i915/intel_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_guc.c b/drivers/gpu/drm/i915/intel_guc.c
index 116f4ccf1bbd..fb31f5004bcf 100644
--- a/drivers/gpu/drm/i915/intel_guc.c
+++ b/drivers/gpu/drm/i915/intel_guc.c
@@ -206,7 +206,7 @@ void intel_guc_fini(struct intel_guc *guc)
 static u32 get_log_control_flags(void)
 {
 	u32 level = i915_modparams.guc_log_level;
-	u32 flags = 0;
+	s32 flags = 0;
 
 	GEM_BUG_ON(level < 0);
 
-- 
2.17.0

