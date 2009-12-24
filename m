From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Thu, 24 Dec 2009 12:48:58 +0000
Subject: drivers/gpu/drm/radeon/radeon_device.c: move a dereference below a
Message-Id: <1261658938.3546.12.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

If a NULL value is possible, the dereference should only occur after the
NULL test.

Coverity CID: 13335

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
diff --git a/drivers/gpu/drm/radeon/radeon_device.c
b/drivers/gpu/drm/radeon/radeon_device.c
index 02bcdb1..c0104b0 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -663,16 +663,18 @@ void radeon_device_fini(struct radeon_device
*rdev)
  */
 int radeon_suspend_kms(struct drm_device *dev, pm_message_t state)
 {
-	struct radeon_device *rdev = dev->dev_private;
+	struct radeon_device *rdev;
 	struct drm_crtc *crtc;
 	int r;
 
-	if (dev = NULL || rdev = NULL) {
+	if (dev = NULL || dev->dev_private = NULL) {
 		return -ENODEV;
 	}
 	if (state.event = PM_EVENT_PRETHAW) {
 		return 0;
 	}
+	rdev = dev->dev_private;
+
 	/* unpin the front buffers */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct radeon_framebuffer *rfb = to_radeon_framebuffer(crtc->fb);


