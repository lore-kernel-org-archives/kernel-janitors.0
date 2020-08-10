From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 09:59:52 +0000
Subject: [PATCH] drm/i915/vlv_dsi_pll: fix spelling mistake "Cant" -> "Can't"
Message-Id: <20200810095952.60968-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a drm_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c b/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
index d0a514301575..4070b00c3690 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
@@ -483,7 +483,7 @@ int bxt_dsi_pll_compute(struct intel_encoder *encoder,
 
 	if (dsi_ratio < dsi_ratio_min || dsi_ratio > dsi_ratio_max) {
 		drm_err(&dev_priv->drm,
-			"Cant get a suitable ratio from DSI PLL ratios\n");
+			"Can't get a suitable ratio from DSI PLL ratios\n");
 		return -ECHRNG;
 	} else
 		drm_dbg_kms(&dev_priv->drm, "DSI PLL calculation is Done!!\n");
-- 
2.27.0
