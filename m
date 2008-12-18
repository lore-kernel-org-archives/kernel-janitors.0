From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 18 Dec 2008 20:25:51 +0000
Subject: [PATCH 5/6] drm/i915: comment out unused function 'i915_driver_firstopen'
Message-Id: <494ad5e1.02a1660a.77b3.5036@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.sourceforge.net

Fix this warning:

  drivers/gpu/drm/i915/i915_dma.c:1011: warning: 'i915_driver_firstopen' defined but not used

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/gpu/drm/i915/i915_dma.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
index 36a6884..10f3fe6 100644
--- a/drivers/gpu/drm/i915/i915_dma.c
+++ b/drivers/gpu/drm/i915/i915_dma.c
@@ -1007,12 +1007,14 @@ void i915_master_destroy(struct drm_device *dev, struct drm_master *master)
 }
 
 
+#ifdef UNUSED
 static int i915_driver_firstopen(struct drm_device *dev)
 {
 	if (drm_core_check_feature(dev, DRIVER_MODESET))
 		return 0;
 	return 0;
 }
+#endif /* UNUSED */
 
 /**
  * i915_driver_load - setup chip and create an initial config
-- 
1.5.6.3

