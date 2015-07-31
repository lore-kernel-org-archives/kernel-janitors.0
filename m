From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Jul 2015 09:33:30 +0000
Subject: [patch] drm/omap: checking for NULL instead of IS_ERR()
Message-Id: <20150731093330.GA11127@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Archit Taneja <architt@codeaurora.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Fabian Frederick <fabf@skynet.be>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thierry Reding <treding@nvidia.com>

We recently start using the new drm_fb_helper functions but the error
handling needs to be updated as well to check for IS_ERR() instead of
NULL.

Fixes: 377eb331375f ('drm/omap: Use new drm_fb_helper functions')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 08ef090..b8e4cde 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -180,9 +180,9 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 	mutex_lock(&dev->struct_mutex);
 
 	fbi = drm_fb_helper_alloc_fbi(helper);
-	if (!fbi) {
+	if (IS_ERR(fbi)) {
 		dev_err(dev->dev, "failed to allocate fb info\n");
-		ret = -ENOMEM;
+		ret = PTR_ERR(fbi);
 		goto fail_unlock;
 	}
 
