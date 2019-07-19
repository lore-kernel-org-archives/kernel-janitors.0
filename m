From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 19 Jul 2019 02:41:00 +0000
Subject: [PATCH -next] drm/i915/icl: Remove set but not used variable 'src_y'
Message-Id: <20190719024100.64738-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch, ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com, matthew.d.roper@intel.com
Cc: YueHaibing <yuehaibing@huawei.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/i915/display/intel_sprite.c: In function 'g4x_sprite_check_scaling':
drivers/gpu/drm/i915/display/intel_sprite.c:1494:13: warning:
 variable 'src_y' set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/i915/display/intel_sprite.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 34586f29be60..9c3367491f04 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1491,7 +1491,7 @@ g4x_sprite_check_scaling(struct intel_crtc_state *crtc_state,
 	const struct drm_framebuffer *fb = plane_state->base.fb;
 	const struct drm_rect *src = &plane_state->base.src;
 	const struct drm_rect *dst = &plane_state->base.dst;
-	int src_x, src_y, src_w, src_h, crtc_w, crtc_h;
+	int src_x, src_w, src_h, crtc_w, crtc_h;
 	const struct drm_display_mode *adjusted_mode  		&crtc_state->base.adjusted_mode;
 	unsigned int cpp = fb->format->cpp[0];
@@ -1502,7 +1502,6 @@ g4x_sprite_check_scaling(struct intel_crtc_state *crtc_state,
 	crtc_h = drm_rect_height(dst);
 
 	src_x = src->x1 >> 16;
-	src_y = src->y1 >> 16;
 	src_w = drm_rect_width(src) >> 16;
 	src_h = drm_rect_height(src) >> 16;
