From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Jul 2019 13:41:20 +0000
Subject: [PATCH][next] drm/amdgpu: remove redundant assignment to pointer 'ring'
Message-Id: <20190723134120.28441-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Leo Liu <leo.liu@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'ring' is being assigned a value that is never
read, hence the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 93b3500e522b..a2a8ca942f34 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -1331,7 +1331,6 @@ static int vcn_v1_0_pause_dpg_mode(struct amdgpu_device *adev,
 				WREG32_SOC15(UVD, 0, mmUVD_JRBC_RB_CNTL,
 							UVD_JRBC_RB_CNTL__RB_RPTR_WR_EN_MASK);
 
-				ring = &adev->vcn.inst->ring_dec;
 				WREG32_SOC15(UVD, 0, mmUVD_RBC_RB_WPTR,
 						   RREG32_SOC15(UVD, 0, mmUVD_SCRATCH2) & 0x7FFFFFFF);
 				SOC15_WAIT_ON_RREG(UVD, 0, mmUVD_POWER_STATUS,
-- 
2.20.1
