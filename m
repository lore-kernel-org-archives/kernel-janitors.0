From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 15 Jan 2021 11:43:29 +0000
Subject: [PATCH] drm/dp_helper: tweak kerneldoc to address warning
Message-Id: <20210115114329.27152-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Uma Shankar <uma.shankar@intel.com>, Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 07c9b8634fb6 ("drm/dp_helper: Add helpers to configure PCONs
RGB-YCbCr Conversion") introduces a warning with make htmldocs in
./drivers/gpu/drm/drm_dp_helper.c:965 for
drm_dp_downstream_rgb_to_ycbcr_conversion():

  warning: Excess function parameter 'colorspc' description
  warning: Function parameter or member 'color_spc' not described

Tweak the kerneldoc for drm_dp_downstream_rgb_to_ycbcr_conversion().

Fixes: 07c9b8634fb6 ("drm/dp_helper: Add helpers to configure PCONs RGB-YCbCr Conversion")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210115

Jani, please pick this minor doc warning fixup.

 drivers/gpu/drm/drm_dp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 3ecde451f523..d60e94ac6fdd 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -954,7 +954,7 @@ EXPORT_SYMBOL(drm_dp_downstream_444_to_420_conversion);
  *                                               RGB->YCbCr conversion capability
  * @dpcd: DisplayPort configuration data
  * @port_cap: downstream facing port capabilities
- * @colorspc: Colorspace for which conversion cap is sought
+ * @color_spc: Colorspace for which conversion cap is sought
  *
  * Returns: whether the downstream facing port can convert RGB->YCbCr for a given
  * colorspace.
@@ -3134,7 +3134,7 @@ int drm_dp_pcon_pps_override_param(struct drm_dp_aux *aux, u8 pps_param[6])
 }
 EXPORT_SYMBOL(drm_dp_pcon_pps_override_param);
 
-/*
+/**
  * drm_dp_pcon_convert_rgb_to_ycbcr() - Configure the PCon to convert RGB to Ycbcr
  * @aux: displayPort AUX channel
  * @color_spc: Color-space/s for which conversion is to be enabled, 0 for disable.
-- 
2.17.1
