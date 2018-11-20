From: Colin King <colin.king@canonical.com>
Date: Tue, 20 Nov 2018 17:17:45 +0000
Subject: [PATCH][drm-next] drm/amd/display: fix dereference of pointer fs_params before it is null checked
Message-Id: <20181120171745.13812-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there are several instances of pointer fs_params being
dereferenced before fs_params is being null checked.  Fix this by
only dereferencing fs_params after the null check.

Detected by CoverityScan, CID#1475565 ("Dereference before null check")

Fixes: e1e8a020c6b8 ("drm/amd/display: Add support for Freesync 2 HDR and Content to Display Mapping")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../drm/amd/display/modules/color/color_gamma.c  | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
index 7480f072c375..bbecbaefb741 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
@@ -813,20 +813,26 @@ static bool build_freesync_hdr(struct pwl_float_data_ex *rgb_regamma,
 	const struct hw_x_point *coord_x = coordinate_x;
 	struct fixed31_32 scaledX = dc_fixpt_zero;
 	struct fixed31_32 scaledX1 = dc_fixpt_zero;
-	struct fixed31_32 max_display = dc_fixpt_from_int(fs_params->max_display);
-	struct fixed31_32 min_display = dc_fixpt_from_fraction(fs_params->min_display, 10000);
-	struct fixed31_32 max_content = dc_fixpt_from_int(fs_params->max_content);
-	struct fixed31_32 min_content = dc_fixpt_from_fraction(fs_params->min_content, 10000);
+	struct fixed31_32 max_display;
+	struct fixed31_32 min_display;
+	struct fixed31_32 max_content;
+	struct fixed31_32 min_content;
 	struct fixed31_32 clip = dc_fixpt_one;
 	struct fixed31_32 output;
 	bool use_eetf = false;
 	bool is_clipped = false;
-	struct fixed31_32 sdr_white_level = dc_fixpt_from_int(fs_params->sdr_white_level);
+	struct fixed31_32 sdr_white_level;
 
 	if (fs_params = NULL || fs_params->max_content = 0 ||
 			fs_params->max_display = 0)
 		return false;
 
+	max_display = dc_fixpt_from_int(fs_params->max_display);
+	min_display = dc_fixpt_from_fraction(fs_params->min_display, 10000);
+	max_content = dc_fixpt_from_int(fs_params->max_content);
+	min_content = dc_fixpt_from_fraction(fs_params->min_content, 10000);
+	sdr_white_level = dc_fixpt_from_int(fs_params->sdr_white_level);
+
 	if (fs_params->min_display > 1000) // cap at 0.1 at the bottom
 		min_display = dc_fixpt_from_fraction(1, 10);
 	if (fs_params->max_display < 100) // cap at 100 at the top
-- 
2.19.1
