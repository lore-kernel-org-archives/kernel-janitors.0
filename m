From: Colin King <colin.king@canonical.com>
Date: Tue, 10 Dec 2019 14:45:35 +0000
Subject: [PATCH][next] drm/i915/display: remove duplicated assignment to pointer crtc_state
Message-Id: <20191210144535.341977-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer crtc_state is being assigned twice, one of these is redundant
and can be removed.

Addresses-Coverity: ("Evaluation order violation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5c50b7d2db25..f3389d315b19 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -17751,7 +17751,7 @@ intel_modeset_setup_hw_state(struct drm_device *dev,
 
 	for_each_intel_crtc(&dev_priv->drm, crtc) {
 		struct intel_crtc_state *crtc_state -			crtc_state = to_intel_crtc_state(crtc->base.state);
+			to_intel_crtc_state(crtc->base.state);
 
 		intel_sanitize_crtc(crtc, ctx);
 		intel_dump_pipe_config(crtc_state, NULL, "[setup_hw_state]");
-- 
2.24.0
