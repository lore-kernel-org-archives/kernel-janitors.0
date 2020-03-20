From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Mar 2020 13:24:11 +0000
Subject: [PATCH net-next] drm/amdgpu: Uninitialized variable in gfx_v9_0_rlcg_wreg()
Message-Id: <20200320132411.GD95012@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Emily Deng <Emily.Deng@amd.com>, David Airlie <airlied@linux.ie>, Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, Tao Zhou <tao.zhou1@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, Le Ma <le.ma@amd.com>, Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, James Zhu <James.Zhu@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>

The "shadow" variable was never set to false.

There is a quirk in current versions of GCC where it will sometimes set
it to false and not warn about the uninitiliazed variable.  That means
that this bug wouldn't have been discovered in normal testing.

Fixes: 2e0cc4d48b91 ("drm/amdgpu: revise RLCG access path")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 7bc2486167e7..affbff76758c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -735,7 +735,7 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
 	static void *spare_int;
 	static uint32_t grbm_cntl;
 	static uint32_t grbm_idx;
-	bool shadow;
+	bool shadow = false;
 
 	scratch_reg0 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] + mmSCRATCH_REG0)*4;
 	scratch_reg1 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG1)*4;
-- 
2.25.1
