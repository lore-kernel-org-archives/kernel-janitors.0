From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Sep 2017 16:21:54 +0000
Subject: [PATCH] drm/i915: remove redundant variable hw_check
Message-Id: <20170914162154.11304-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

hw_check is being assigned and updated but is no longer being read,
hence it is redundant and can be removed.

Detected by clang scan-build:
"warning: Value stored to 'hw_check' during its initialization
is never read"

Fixes: f6d1973db2d2 ("drm/i915: Move modeset state verifier calls")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/intel_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index f17275519484..ac261eaa5ba5 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -12359,7 +12359,6 @@ static void intel_atomic_commit_tail(struct drm_atomic_state *state)
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc *crtc;
 	struct intel_crtc_state *intel_cstate;
-	bool hw_check = intel_state->modeset;
 	u64 put_domains[I915_MAX_PIPES] = {};
 	unsigned crtc_vblank_mask = 0;
 	int i;
@@ -12376,7 +12375,6 @@ static void intel_atomic_commit_tail(struct drm_atomic_state *state)
 
 		if (needs_modeset(new_crtc_state) ||
 		    to_intel_crtc_state(new_crtc_state)->update_pipe) {
-			hw_check = true;
 
 			put_domains[to_intel_crtc(crtc)->pipe]  				modeset_get_crtc_power_domains(crtc,
-- 
2.14.1

