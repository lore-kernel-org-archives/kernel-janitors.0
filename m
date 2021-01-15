From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Jan 2021 09:42:53 +0000
Subject: [PATCH][next] drm/i915/dp: fix spelling contraction "couldnt" -> "couldn't"
Message-Id: <20210115094253.8299-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling contraction mistake in a drm_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8a00e609085f..2887c4975be0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4189,7 +4189,7 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
 	if (intel_dp_pcon_start_frl_training(intel_dp) < 0) {
 		int ret, mode;
 
-		drm_dbg(&dev_priv->drm, "Couldnt set FRL mode, continuing with TMDS mode\n");
+		drm_dbg(&dev_priv->drm, "Couldn't set FRL mode, continuing with TMDS mode\n");
 		ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
 		mode = drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, NULL);
 
-- 
2.29.2
