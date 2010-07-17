From: Dan Carpenter <error27@gmail.com>
Date: Sat, 17 Jul 2010 10:28:02 +0000
Subject: [patch] drm: radeon: fix sign bug
Message-Id: <20100717102802.GF17585@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Dave Airlie <airlied@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The "error" variable is unsigned so it's never less than zero.  I
changed it to check if (freq < current_freq) directly.

"best_error" is also unsigned so "best_error - 100" could be a large
number instead of a negative.  Since "error" is unsigned it is never
less than a negative and so the cases where "best_error" is less than or
equal to 100 are false.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 8154cdf..a68728d 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -558,15 +558,17 @@ static void radeon_compute_pll_legacy(struct radeon_pll *pll,
 					current_freq = radeon_div(tmp, ref_div * post_div);
 
 					if (pll->flags & RADEON_PLL_PREFER_CLOSEST_LOWER) {
-						error = freq - current_freq;
-						error = error < 0 ? 0xffffffff : error;
+						if (freq < current_freq)
+							error = 0xffffffff;
+						else
+							error = freq - current_freq;
 					} else
 						error = abs(current_freq - freq);
 					vco_diff = abs(vco - best_vco);
 
 					if ((best_vco = 0 && error < best_error) ||
 					    (best_vco != 0 &&
-					     (error < best_error - 100 ||
+					     ((best_error > 100 && error < best_error - 100) ||
 					      (abs(error - best_error) < 100 && vco_diff < best_vco_diff)))) {
 						best_post_div = post_div;
 						best_ref_div = ref_div;
