From: Colin King <colin.king@canonical.com>
Date: Fri, 17 Apr 2020 16:08:29 +0000
Subject: [PATCH][next] drm/i915: remove redundant assignment to variable test_result
Message-Id: <20200417160829.112776-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable test_result is being initialized with a value that is
never read and it is being updated later with a new value.  The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d4fcc9583869..55697c5e251a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5567,7 +5567,7 @@ void intel_dp_process_phy_request(struct intel_dp *intel_dp)
 
 static u8 intel_dp_autotest_phy_pattern(struct intel_dp *intel_dp)
 {
-	u8 test_result = DP_TEST_NAK;
+	u8 test_result;
 
 	test_result = intel_dp_prepare_phytest(intel_dp);
 	if (test_result != DP_TEST_ACK)
-- 
2.25.1
