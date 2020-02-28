From: Colin King <colin.king@canonical.com>
Date: Fri, 28 Feb 2020 13:16:06 +0000
Subject: [PATCH][next] drm/amd/display: fix indentation issue on a hunk of code
Message-Id: <20200228131606.65041-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are multiple statements that are indented incorrectly. Add
in the missing tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../gpu/drm/amd/display/dc/calcs/dce_calcs.c  | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
index 5d081c42e81b..2c6db379afae 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
@@ -3265,33 +3265,33 @@ bool bw_calcs(struct dc_context *ctx,
 				bw_fixed_to_int(bw_mul(data->
 					stutter_exit_watermark[9], bw_int_to_fixed(1000)));
 
-		calcs_output->stutter_entry_wm_ns[0].b_mark -			bw_fixed_to_int(bw_mul(data->
-				stutter_entry_watermark[4], bw_int_to_fixed(1000)));
-		calcs_output->stutter_entry_wm_ns[1].b_mark -			bw_fixed_to_int(bw_mul(data->
-				stutter_entry_watermark[5], bw_int_to_fixed(1000)));
-		calcs_output->stutter_entry_wm_ns[2].b_mark -			bw_fixed_to_int(bw_mul(data->
-				stutter_entry_watermark[6], bw_int_to_fixed(1000)));
-		if (ctx->dc->caps.max_slave_planes) {
-			calcs_output->stutter_entry_wm_ns[3].b_mark +			calcs_output->stutter_entry_wm_ns[0].b_mark  				bw_fixed_to_int(bw_mul(data->
-					stutter_entry_watermark[0], bw_int_to_fixed(1000)));
-			calcs_output->stutter_entry_wm_ns[4].b_mark +					stutter_entry_watermark[4], bw_int_to_fixed(1000)));
+			calcs_output->stutter_entry_wm_ns[1].b_mark  				bw_fixed_to_int(bw_mul(data->
-					stutter_entry_watermark[1], bw_int_to_fixed(1000)));
-		} else {
-			calcs_output->stutter_entry_wm_ns[3].b_mark +					stutter_entry_watermark[5], bw_int_to_fixed(1000)));
+			calcs_output->stutter_entry_wm_ns[2].b_mark  				bw_fixed_to_int(bw_mul(data->
-					stutter_entry_watermark[7], bw_int_to_fixed(1000)));
-			calcs_output->stutter_entry_wm_ns[4].b_mark +					stutter_entry_watermark[6], bw_int_to_fixed(1000)));
+			if (ctx->dc->caps.max_slave_planes) {
+				calcs_output->stutter_entry_wm_ns[3].b_mark +					bw_fixed_to_int(bw_mul(data->
+						stutter_entry_watermark[0], bw_int_to_fixed(1000)));
+				calcs_output->stutter_entry_wm_ns[4].b_mark +					bw_fixed_to_int(bw_mul(data->
+						stutter_entry_watermark[1], bw_int_to_fixed(1000)));
+			} else {
+				calcs_output->stutter_entry_wm_ns[3].b_mark +					bw_fixed_to_int(bw_mul(data->
+						stutter_entry_watermark[7], bw_int_to_fixed(1000)));
+				calcs_output->stutter_entry_wm_ns[4].b_mark +					bw_fixed_to_int(bw_mul(data->
+						stutter_entry_watermark[8], bw_int_to_fixed(1000)));
+			}
+			calcs_output->stutter_entry_wm_ns[5].b_mark  				bw_fixed_to_int(bw_mul(data->
-					stutter_entry_watermark[8], bw_int_to_fixed(1000)));
-		}
-		calcs_output->stutter_entry_wm_ns[5].b_mark -			bw_fixed_to_int(bw_mul(data->
-				stutter_entry_watermark[9], bw_int_to_fixed(1000)));
+					stutter_entry_watermark[9], bw_int_to_fixed(1000)));
 
 			calcs_output->urgent_wm_ns[0].b_mark  				bw_fixed_to_int(bw_mul(data->
-- 
2.25.0
