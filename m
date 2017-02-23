From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Feb 2017 10:39:57 +0000
Subject: [patch] drm/i915: return false on failure in intel_dp_compute_config()
Message-Id: <20170223103956.GA27484@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Chandra Konduru <chandra.konduru@intel.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

This function is a bool type where we are supposed to return false on
failure and true on success.  Negative error codes are currently treated
as true.

Fixes: a1b2278e4dfc ("drm/i915: skylake panel fitting using shared scalers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index d1670b8afbf5..9173548ba601 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -1637,10 +1637,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 				       adjusted_mode);
 
 		if (INTEL_GEN(dev_priv) >= 9) {
-			int ret;
-			ret = skl_update_scaler_crtc(pipe_config);
-			if (ret)
-				return ret;
+			if (skl_update_scaler_crtc(pipe_config))
+				return false;
 		}
 
 		if (HAS_GMCH_DISPLAY(dev_priv))
