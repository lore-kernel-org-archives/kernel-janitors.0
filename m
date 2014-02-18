From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Feb 2014 14:59:26 +0000
Subject: [patch] drm/gma500: cleanup in psb_mode_operation_ioctl()
Message-Id: <20140218145925.GB6914@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

It looks like the "mode" test was changed at some point and but it
wasn't totally cleaned up.  I've removed the unneeded indent block and
the duplicative test for "if (mode)".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 1199180667c9..411ed5b80d53 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -534,24 +534,22 @@ static int psb_mode_operation_ioctl(struct drm_device *dev, void *data,
 		}
 
 		/* drm_crtc_convert_umode(mode, umode); */
-		{
-			mode->clock = umode->clock;
-			mode->hdisplay = umode->hdisplay;
-			mode->hsync_start = umode->hsync_start;
-			mode->hsync_end = umode->hsync_end;
-			mode->htotal = umode->htotal;
-			mode->hskew = umode->hskew;
-			mode->vdisplay = umode->vdisplay;
-			mode->vsync_start = umode->vsync_start;
-			mode->vsync_end = umode->vsync_end;
-			mode->vtotal = umode->vtotal;
-			mode->vscan = umode->vscan;
-			mode->vrefresh = umode->vrefresh;
-			mode->flags = umode->flags;
-			mode->type = umode->type;
-			strncpy(mode->name, umode->name, DRM_DISPLAY_MODE_LEN);
-			mode->name[DRM_DISPLAY_MODE_LEN-1] = 0;
-		}
+		mode->clock = umode->clock;
+		mode->hdisplay = umode->hdisplay;
+		mode->hsync_start = umode->hsync_start;
+		mode->hsync_end = umode->hsync_end;
+		mode->htotal = umode->htotal;
+		mode->hskew = umode->hskew;
+		mode->vdisplay = umode->vdisplay;
+		mode->vsync_start = umode->vsync_start;
+		mode->vsync_end = umode->vsync_end;
+		mode->vtotal = umode->vtotal;
+		mode->vscan = umode->vscan;
+		mode->vrefresh = umode->vrefresh;
+		mode->flags = umode->flags;
+		mode->type = umode->type;
+		strncpy(mode->name, umode->name, DRM_DISPLAY_MODE_LEN);
+		mode->name[DRM_DISPLAY_MODE_LEN-1] = 0;
 
 		connector_funcs = (struct drm_connector_helper_funcs *)
 				   connector->helper_private;
@@ -562,8 +560,7 @@ static int psb_mode_operation_ioctl(struct drm_device *dev, void *data,
 		}
 
 		/*do some clean up work*/
-		if (mode)
-			drm_mode_destroy(dev, mode);
+		drm_mode_destroy(dev, mode);
 mode_op_out:
 		drm_modeset_unlock_all(dev);
 		return ret;
