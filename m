From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 13:59:17 +0000
Subject: [PATCH 1/2] drm/i915/dp: Delete an unnecessary goto statement in intel_dp_sink_crc()
Message-Id: <bd6fe3e9-25fd-ccf7-c586-7ccfe6c99e5a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <668a4b56-091d-d4e7-2204-daaec6675e11@users.sourceforge.net>
In-Reply-To: <668a4b56-091d-d4e7-2204-daaec6675e11@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 15:15:20 +0200

A jump was specified for a location which was directly behind.
Thus remove such an unnecessary goto statement.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/i915/intel_dp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index ca48bce23a6f..342f1a1fa085 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -3994,10 +3994,8 @@ int intel_dp_sink_crc(struct intel_dp *intel_dp, u8 *crc)
 		goto stop;
 	}
 
-	if (drm_dp_dpcd_read(&intel_dp->aux, DP_TEST_CRC_R_CR, crc, 6) < 0) {
+	if (drm_dp_dpcd_read(&intel_dp->aux, DP_TEST_CRC_R_CR, crc, 6) < 0)
 		ret = -EIO;
-		goto stop;
-	}
 
 stop:
 	intel_dp_sink_crc_stop(intel_dp);
-- 
2.14.3

