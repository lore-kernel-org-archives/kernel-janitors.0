From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 18 Dec 2008 21:32:22 +0000
Subject: [PATCH 6/6] drm/i915: add prototype for 'intelfb_panic' to header file
Message-Id: <494ad5e4.0baa660a.04de.7bb4@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.sourceforge.net

Fix this sparse warning:

  drivers/gpu/drm/i915/intel_fb.c:417:5: warning: symbol 'intelfb_panic' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/gpu/drm/i915/intel_drv.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_drv.h b/drivers/gpu/drm/i915/intel_drv.h
index 407edd5..b8ae5ce 100644
--- a/drivers/gpu/drm/i915/intel_drv.h
+++ b/drivers/gpu/drm/i915/intel_drv.h
@@ -135,6 +135,8 @@ extern void intel_sdvo_set_hotplug(struct drm_connector *connector, int enable);
 extern int intelfb_probe(struct drm_device *dev);
 extern int intelfb_remove(struct drm_device *dev, struct drm_framebuffer *fb);
 extern int intelfb_resize(struct drm_device *dev, struct drm_crtc *crtc);
+extern int intelfb_panic(struct notifier_block *n, unsigned long ununsed,
+			 void *panic_str);
 extern void intelfb_restore(void);
 extern void intel_crtc_fb_gamma_set(struct drm_crtc *crtc, u16 red, u16 green,
 				    u16 blue, int regno);
-- 
1.5.6.3

