From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 14:00:11 +0000
Subject: [PATCH 2/2] drm/i915/dp: Use common error handling code in intel_dp_sink_crc_stop()
Message-Id: <1d3d0395-957a-2a87-3cb5-0d7355d04b65@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <668a4b56-091d-d4e7-2204-daaec6675e11@users.sourceforge.net>
In-Reply-To: <668a4b56-091d-d4e7-2204-daaec6675e11@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 15:40:47 +0200

Adjust jump targets so that a specific error code assignment
will be in the implementation only at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/i915/intel_dp.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index 342f1a1fa085..3dd514a77008 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -3894,27 +3894,19 @@ static int intel_dp_sink_crc_stop(struct intel_dp *intel_dp)
 	int count = 0;
 	int attempts = 10;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_SINK, &buf) < 0) {
-		DRM_DEBUG_KMS("Sink CRC couldn't be stopped properly\n");
-		ret = -EIO;
-		goto out;
-	}
+	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_SINK, &buf) < 0)
+		goto report_failure;
 
 	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_TEST_SINK,
-			       buf & ~DP_TEST_SINK_START) < 0) {
-		DRM_DEBUG_KMS("Sink CRC couldn't be stopped properly\n");
-		ret = -EIO;
-		goto out;
-	}
+			       buf & ~DP_TEST_SINK_START) < 0)
+		goto report_failure;
 
 	do {
 		intel_wait_for_vblank(dev_priv, intel_crtc->pipe);
+		if (drm_dp_dpcd_readb(&intel_dp->aux, DP_TEST_SINK_MISC, &buf)
+		    < 0)
+			goto e_io;
 
-		if (drm_dp_dpcd_readb(&intel_dp->aux,
-				      DP_TEST_SINK_MISC, &buf) < 0) {
-			ret = -EIO;
-			goto out;
-		}
 		count = buf & DP_TEST_COUNT_MASK;
 	} while (--attempts && count);
 
@@ -3923,9 +3915,15 @@ static int intel_dp_sink_crc_stop(struct intel_dp *intel_dp)
 		ret = -ETIMEDOUT;
 	}
 
- out:
+enable_ips:
 	hsw_enable_ips(intel_crtc);
 	return ret;
+
+report_failure:
+	DRM_DEBUG_KMS("Sink CRC couldn't be stopped properly\n");
+e_io:
+	ret = -EIO;
+	goto enable_ips;
 }
 
 static int intel_dp_sink_crc_start(struct intel_dp *intel_dp)
-- 
2.14.3

