From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Mar 2015 10:48:25 +0000
Subject: [patch] drm/i915/skl: cleanup an indenting issue
Message-Id: <20150313104825.GA28907@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

This statement is indented an extra space.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 959058f..028c6d4 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -3905,13 +3905,13 @@ static void gen6_set_rps_thresholds(struct drm_i915_private *dev_priv, u8 val)
 	I915_WRITE(GEN6_RP_DOWN_THRESHOLD,
 		GT_INTERVAL_FROM_US(dev_priv, (ei_down * threshold_down / 100)));
 
-	 I915_WRITE(GEN6_RP_CONTROL,
-		    GEN6_RP_MEDIA_TURBO |
-		    GEN6_RP_MEDIA_HW_NORMAL_MODE |
-		    GEN6_RP_MEDIA_IS_GFX |
-		    GEN6_RP_ENABLE |
-		    GEN6_RP_UP_BUSY_AVG |
-		    GEN6_RP_DOWN_IDLE_AVG);
+	I915_WRITE(GEN6_RP_CONTROL,
+		   GEN6_RP_MEDIA_TURBO |
+		   GEN6_RP_MEDIA_HW_NORMAL_MODE |
+		   GEN6_RP_MEDIA_IS_GFX |
+		   GEN6_RP_ENABLE |
+		   GEN6_RP_UP_BUSY_AVG |
+		   GEN6_RP_DOWN_IDLE_AVG);
 
 	dev_priv->rps.power = new_power;
 	dev_priv->rps.last_adj = 0;
