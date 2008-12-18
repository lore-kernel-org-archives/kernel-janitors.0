From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 18 Dec 2008 14:09:00 +0000
Subject: [PATCH 1/6] drm/i915: fix sparse warnings: declare one-bit bitfield as unsigned
Message-Id: <494ad5d2.190c660a.55a0.ffff96ff@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.sourceforge.net

Fix this sparse warnings:

  drivers/gpu/drm/i915/i915_drv.h:169:22: error: dubious one-bit signed bitfield
  drivers/gpu/drm/i915/i915_drv.h:169:22: warning: dubious bitfield without explicit `signed' or `unsigned'
  drivers/gpu/drm/i915/i915_drv.h:170:19: error: dubious one-bit signed bitfield
  drivers/gpu/drm/i915/i915_drv.h:170:19: warning: dubious bitfield without explicit `signed' or `unsigned'
  drivers/gpu/drm/i915/i915_drv.h:171:16: error: dubious one-bit signed bitfield
  drivers/gpu/drm/i915/i915_drv.h:171:16: warning: dubious bitfield without explicit `signed' or `unsigned'
  drivers/gpu/drm/i915/i915_drv.h:172:23: error: dubious one-bit signed bitfield
  drivers/gpu/drm/i915/i915_drv.h:172:23: warning: dubious bitfield without explicit `signed' or `unsigned'

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/gpu/drm/i915/i915_drv.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 467572a..a640bcf 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -166,10 +166,10 @@ typedef struct drm_i915_private {
 	struct drm_display_mode *vbt_mode; /* if any */
 
 	/* Feature bits from the VBIOS */
-	int int_tv_support:1;
-	int lvds_dither:1;
-	int lvds_vbt:1;
-	int int_crt_support:1;
+	unsigned int int_tv_support:1;
+	unsigned int lvds_dither:1;
+	unsigned int lvds_vbt:1;
+	unsigned int int_crt_support:1;
 
 	struct drm_i915_fence_reg fence_regs[16]; /* assume 965 */
 	int fence_reg_start; /* 4 if userland hasn't ioctl'd us yet */
-- 
1.5.6.3

