From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Aug 2013 09:43:02 +0000
Subject: [patch] drm/i915: precedence bug in hsw_compute_wm_results()
Message-Id: <20130809094302.GA29282@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The '!' operation has higher precedence than the compare so probably
this test is never true.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index a5a9959..0b9d9a7 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -2562,7 +2562,7 @@ static void hsw_compute_wm_results(struct drm_device *dev,
 	 * a WM level. */
 	results->enable_fbc_wm = true;
 	for (level = 1; level <= max_level; level++) {
-		if (!lp_results[level - 1].fbc_val > lp_maximums->fbc) {
+		if (lp_results[level - 1].fbc_val <= lp_maximums->fbc) {
 			results->enable_fbc_wm = false;
 			lp_results[level - 1].fbc_val = 0;
 		}
