From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Jan 2021 15:00:22 +0000
Subject: [PATCH][next] drm/amdgpu: Fix masking binary not operator on two mask operations
Message-Id: <20210122150022.209454-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Huang Rui <ray.huang@amd.com>, Aaron Liu <aaron.liu@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the ! operator is incorrectly being used to flip bits on
mask values. Fix this by using the bit-wise ~ operator instead.

Addresses-Coverity: ("Logical vs. bitwise operator")
Fixes: 3c9a7b7d6e75 ("drm/amdgpu: update mmhub mgcg&ls for mmhub_v2_3")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
index 1961745e89c7..ab9be5ad5a5f 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
@@ -531,12 +531,12 @@ mmhub_v2_3_update_medium_grain_light_sleep(struct amdgpu_device *adev,
 
 	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS)) {
 		data &= ~MM_ATC_L2_CGTT_CLK_CTRL__MGLS_OVERRIDE_MASK;
-		data1 &= !(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
+		data1 &= ~(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
 			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_REGISTER_MASK);
-		data2 &= !(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
+		data2 &= ~(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
 			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
 			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
 			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
-- 
2.29.2
