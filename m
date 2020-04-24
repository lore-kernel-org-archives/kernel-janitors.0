From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Apr 2020 11:12:26 +0000
Subject: [PATCH] amdgpu/dc: remove redundant assignment to variable 'option'
Message-Id: <20200424111226.11796-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable option is being initialized with a value that is
never read and it is being updated later with a new value.  The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c
index 4245e1f818a3..e096d2b95ef9 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c
@@ -679,8 +679,7 @@ void dce110_opp_v_set_csc_default(
 	if (default_adjust->force_hw_default = false) {
 		const struct out_csc_color_matrix *elm;
 		/* currently parameter not in use */
-		enum grph_color_adjust_option option -			GRPH_COLOR_MATRIX_HW_DEFAULT;
+		enum grph_color_adjust_option option;
 		uint32_t i;
 		/*
 		 * HW default false we program locally defined matrix
-- 
2.25.1
