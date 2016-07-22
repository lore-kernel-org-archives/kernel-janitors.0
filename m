From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Jul 2016 06:45:23 +0000
Subject: [PATCH] GPU-DRM-OMAP: Delete unnecessary checks before two function calls
Message-Id: <72ff4670-4f3d-c7ed-4f37-e49f2bbc7aba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54D28E5C.9040304@users.sourceforge.net>
In-Reply-To: <54D28E5C.9040304@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Jul 2016 08:28:31 +0200

The following functions test whether their argument is NULL and then
return immediately.
* backlight_device_unregister
* drm_gem_object_unreference_unlocked

Thus the test around the calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 3 +--
 drivers/gpu/drm/omapdrm/omap_fb.c               | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 1b0cf2d..0eae8af 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -1284,8 +1284,7 @@ static int dsicm_probe(struct platform_device *pdev)
 	return 0;
 
 err_sysfs_create:
-	if (bldev != NULL)
-		backlight_device_unregister(bldev);
+	backlight_device_unregister(bldev);
 err_bl:
 	destroy_workqueue(ddata->workqueue);
 err_reg:
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 983c8cf..31f5178 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -115,8 +115,8 @@ static void omap_framebuffer_destroy(struct drm_framebuffer *fb)
 
 	for (i = 0; i < n; i++) {
 		struct plane *plane = &omap_fb->planes[i];
-		if (plane->bo)
-			drm_gem_object_unreference_unlocked(plane->bo);
+
+		drm_gem_object_unreference_unlocked(plane->bo);
 	}
 
 	kfree(omap_fb);
-- 
2.9.2

