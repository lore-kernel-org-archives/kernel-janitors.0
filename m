From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 May 2012 07:33:02 +0000
Subject: [patch] gma500: silence an unused variable warning
Message-Id: <20120510073302.GA5919@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: David Airlie <airlied@linux.ie>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Alan Cox <alan@linux.intel.com>

If CONFIG_BACKLIGHT_CLASS_DEVICE is disabled then GCC warns that:
	drivers/gpu/drm/gma500/opregion.c:154:6: warning:
		unused variable ‘max’ [-Wunused-variable]

Which give me a chance to use the new config_enabled() macro.  :)

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/gma500/opregion.c b/drivers/gpu/drm/gma500/opregion.c
index 05661bf..d2125ba 100644
--- a/drivers/gpu/drm/gma500/opregion.c
+++ b/drivers/gpu/drm/gma500/opregion.c
@@ -151,7 +151,6 @@ static u32 asle_set_backlight(struct drm_device *dev, u32 bclp)
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	struct opregion_asle *asle = dev_priv->opregion.asle;
 	struct backlight_device *bd = dev_priv->backlight_device;
-	u32 max;
 
 	DRM_DEBUG_DRIVER("asle set backlight %x\n", bclp);
 
@@ -165,11 +164,12 @@ static u32 asle_set_backlight(struct drm_device *dev, u32 bclp)
 	if (bclp > 255)
 		return ASLE_BACKLIGHT_FAILED;
 
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
-	max = bd->props.max_brightness;
-	bd->props.brightness = bclp * max / 255;
-	backlight_update_status(bd);
-#endif
+	if (config_enabled(CONFIG_BACKLIGHT_CLASS_DEVICE)) {
+		int max = bd->props.max_brightness;
+		bd->props.brightness = bclp * max / 255;
+		backlight_update_status(bd);
+	}
+
 	asle->cblv = (bclp * 0x64) / 0xff | ASLE_CBLV_VALID;
 
 	return 0;
