From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Jul 2019 11:31:12 +0000
Subject: [PATCH -next] drm/i915: Remove set but not used variable 'encoder'
Message-Id: <20190705113112.64715-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch, imre.deak@intel.com, dhinakaran.pandiyan@intel.com, ville.syrjala@linux.intel.com, chris@chris-wilson.co.uk, manasi.d.navare@intel.com
Cc: YueHaibing <yuehaibing@huawei.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/i915/display/intel_dp.c: In function 'intel_dp_set_drrs_state':
drivers/gpu/drm/i915/display/intel_dp.c:6623:24: warning:
 variable 'encoder' set but not used [-Wunused-but-set-variable]

It's never used, so can be removed.Also remove related
variable 'dig_port'

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8f7188d71d08..0bdb7ecc5a81 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6620,8 +6620,6 @@ static void intel_dp_set_drrs_state(struct drm_i915_private *dev_priv,
 				    const struct intel_crtc_state *crtc_state,
 				    int refresh_rate)
 {
-	struct intel_encoder *encoder;
-	struct intel_digital_port *dig_port = NULL;
 	struct intel_dp *intel_dp = dev_priv->drrs.dp;
 	struct intel_crtc *intel_crtc = to_intel_crtc(crtc_state->base.crtc);
 	enum drrs_refresh_rate_type index = DRRS_HIGH_RR;
@@ -6636,9 +6634,6 @@ static void intel_dp_set_drrs_state(struct drm_i915_private *dev_priv,
 		return;
 	}
 
-	dig_port = dp_to_dig_port(intel_dp);
-	encoder = &dig_port->base;
-
 	if (!intel_crtc) {
 		DRM_DEBUG_KMS("DRRS: intel_crtc not initialized\n");
 		return;
