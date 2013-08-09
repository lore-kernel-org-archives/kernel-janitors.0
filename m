From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Aug 2013 10:07:31 +0000
Subject: [patch v2] drm/i915: fix a limit check in hsw_compute_wm_results()
Message-Id: <20130809100731.GA31727@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130809095826.GA4313@cantiga.alporthouse.com>
In-Reply-To: <20130809095826.GA4313@cantiga.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The '!' here was not intended.  Since '!' has higher precedence than
compare, it means the check is never true.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: My first patch was wrong.

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 96234c6..0f5eb21 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -2685,7 +2685,7 @@ static void hsw_compute_wm_results(struct drm_device *dev,
 	 * a WM level. */
 	results->enable_fbc_wm = true;
 	for (level = 1; level <= max_level; level++) {
-		if (!lp_results[level - 1].fbc_val > lp_maximums->fbc) {
+		if (lp_results[level - 1].fbc_val > lp_maximums->fbc) {
 			results->enable_fbc_wm = false;
 			lp_results[level - 1].fbc_val = 0;
 		}
