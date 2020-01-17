From: Colin King <colin.king@canonical.com>
Date: Fri, 17 Jan 2020 13:33:05 +0000
Subject: [PATCH][next] drm/amd/display: fix for-loop with incorrectly sized loop counter
Message-Id: <20200117133305.113280-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Nikola Cornij <Nikola.Cornij@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A for-loop is iterating from 0 up to 1000 however the loop variable count
is a u8 and hence not large enough.  Fix this by making count an int.
Also remove the redundant initialization of count since this is never used
and add { } on the loop statement make the loop block clearer.

Addresses-Coverity: ("Operands don't affect result")
Fixes: ed581a0ace44 ("drm/amd/display: wait for update when setting dpg test pattern")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 6ab298c65247..cbed738a4246 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -3680,7 +3680,7 @@ static void set_crtc_test_pattern(struct dc_link *link,
 			struct pipe_ctx *odm_pipe;
 			enum controller_dp_color_space controller_color_space;
 			int opp_cnt = 1;
-			uint8_t count = 0;
+			int count;
 
 			switch (test_pattern_color_space) {
 			case DP_TEST_PATTERN_COLOR_SPACE_RGB:
@@ -3725,11 +3725,12 @@ static void set_crtc_test_pattern(struct dc_link *link,
 				width,
 				height);
 			/* wait for dpg to blank pixel data with test pattern */
-			for (count = 0; count < 1000; count++)
+			for (count = 0; count < 1000; count++) {
 				if (opp->funcs->dpg_is_blanked(opp))
 					break;
 				else
 					udelay(100);
+			}
 		}
 	}
 	break;
-- 
2.24.0
