From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Jan 2019 09:37:55 +0000
Subject: [PATCH] drm/komeda: Off by one in komeda_fb_get_pixel_addr()
Message-Id: <20190123093755.GA26018@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The > should be >= to avoid an off by one bug.

Fixes: c46c24bb6b11 ("drm/komeda: Add komeda_framebuffer")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---

I'm 98% sure this is correct, but please review it carefully because I'm
not 100% positive.

 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 4ddd5314ca23..23ee74d42239 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -144,7 +144,7 @@ komeda_fb_get_pixel_addr(struct komeda_fb *kfb, int x, int y, int plane)
 	const struct drm_gem_cma_object *obj;
 	u32 plane_x, plane_y, cpp, pitch, offset;
 
-	if (plane > fb->format->num_planes) {
+	if (plane >= fb->format->num_planes) {
 		DRM_DEBUG_KMS("Out of max plane num.\n");
 		return -EINVAL;
 	}
-- 
2.17.1
