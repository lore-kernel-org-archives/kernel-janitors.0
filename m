From: Colin King <colin.king@canonical.com>
Date: Fri, 28 Jun 2019 14:45:17 +0000
Subject: [PATCH] drm/amd/powerplay: fix incorrect assignments to mclk_mask and soc_mask
Message-Id: <20190628144517.7747-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Wang <kevin1.wang@amd.com>, Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are null pointer checks on mlck_mask and soc_mask however the
sclk_mask is being used in assignments in what looks to be a cut-n-paste
coding error. Fix this by using the correct pointers in the assignments.

Addresses-Coverity: ("Dereference after null check")
Fixes: 2d9fb9b06643 ("drm/amd/powerplay: add function get_profiling_clk_mask for navi10")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index 27e5c80..ac151da 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1134,14 +1134,14 @@ static int navi10_get_profiling_clk_mask(struct smu_context *smu,
 			ret = smu_get_dpm_level_count(smu, SMU_MCLK, &level_count);
 			if (ret)
 				return ret;
-			*sclk_mask = level_count - 1;
+			*mclk_mask = level_count - 1;
 		}
 
 		if(soc_mask) {
 			ret = smu_get_dpm_level_count(smu, SMU_SOCCLK, &level_count);
 			if (ret)
 				return ret;
-			*sclk_mask = level_count - 1;
+			*soc_mask = level_count - 1;
 		}
 	}
 
-- 
2.7.4
