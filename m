From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 19 Jul 2019 01:51:36 +0000
Subject: [PATCH -next] drm/i915/dsi: remove set but not used variable 'hfront_porch'
Message-Id: <20190719015136.103988-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch, imre.deak@intel.com, madhav.chauhan@intel.com, vandita.kulkarni@intel.com, chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com
Cc: YueHaibing <yuehaibing@huawei.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/i915/display/icl_dsi.c: In function 'gen11_dsi_set_transcoder_timings':
drivers/gpu/drm/i915/display/icl_dsi.c:768:6: warning:
 variable 'hfront_porch' set but not used [-Wunused-but-set-variable]

It is never used and can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 4d952accfaaa..a42348be0438 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -763,7 +763,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
 	enum transcoder dsi_trans;
 	/* horizontal timings */
 	u16 htotal, hactive, hsync_start, hsync_end, hsync_size;
-	u16 hfront_porch, hback_porch;
+	u16 hback_porch;
 	/* vertical timings */
 	u16 vtotal, vactive, vsync_start, vsync_end, vsync_shift;
 
@@ -772,8 +772,6 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
 	hsync_start = adjusted_mode->crtc_hsync_start;
 	hsync_end = adjusted_mode->crtc_hsync_end;
 	hsync_size  = hsync_end - hsync_start;
-	hfront_porch = (adjusted_mode->crtc_hsync_start -
-			adjusted_mode->crtc_hdisplay);
 	hback_porch = (adjusted_mode->crtc_htotal -
 		       adjusted_mode->crtc_hsync_end);
 	vactive = adjusted_mode->crtc_vdisplay;
