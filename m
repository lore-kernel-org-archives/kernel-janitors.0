From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Oct 2018 07:18:42 +0000
Subject: [PATCH -next] drm/omap: remove set but not used variable 'plane'
Message-Id: <1538723922-175599-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536667253-5792-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536667253-5792-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/omapdrm/omap_fb.c: In function 'omap_framebuffer_update_scanout':
drivers/gpu/drm/omapdrm/omap_fb.c:130:16: warning:
 variable 'plane' set but not used [-Wunused-but-set-variable]
  struct plane *plane = &omap_fb->planes[0];
  
After commit 2ecceeb53b19 ("drm/omap: Move buffer pitch/offset to drm_framebuffer")
'plane' is not used any more.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/omapdrm/omap_fb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 4d264fd..e3e47aa 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -127,7 +127,6 @@ void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
 {
 	struct omap_framebuffer *omap_fb = to_omap_framebuffer(fb);
 	const struct drm_format_info *format = omap_fb->format;
-	struct plane *plane = &omap_fb->planes[0];
 	u32 x, y, orient = 0;
 
 	info->fourcc = fb->format->format;
@@ -201,8 +200,6 @@ void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
 	info->screen_width /= format->cpp[0];
 
 	if (fb->format->format = DRM_FORMAT_NV12) {
-		plane = &omap_fb->planes[1];
-
 		if (info->rotation_type = OMAP_DSS_ROT_TILER) {
 			WARN_ON(!(omap_gem_flags(fb->obj[1]) & OMAP_BO_TILED));
 			omap_gem_rotated_dma_addr(fb->obj[1], orient, x/2, y/2,
