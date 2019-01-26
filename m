From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 26 Jan 2019 12:05:38 +0000
Subject: [PATCH -next] drm/xen-front: Drop pointless static qualifier in fb_destroy()
Message-Id: <1548504338-114487-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to have the 'struct drm_framebuffer *fb' variable
static since new value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 860da05..c2955d3 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -54,7 +54,7 @@ static void fb_destroy(struct drm_framebuffer *fb)
 	  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct xen_drm_front_drm_info *drm_info = dev->dev_private;
-	static struct drm_framebuffer *fb;
+	struct drm_framebuffer *fb;
 	struct drm_gem_object *gem_obj;
 	int ret;
 
