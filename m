From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:10:29 +0000
Subject: [PATCH] drm/amdgpu: Fix a bug in jpeg_v1_0_start()
Message-Id: <20191126121029.3tye7e3gyduxryfr@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Leo Liu <leo.liu-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Christian K??nig <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Originally the last WREG32_SOC15() was a part of the if statement block
but the curly braces are on the wrong line.

Fixes: bb0db70f3f75 ("drm/amdgpu: separate JPEG1.0 code out from VCN1.0")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis (Smatch).  Not tested.

 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
index 553506df077d..a141408dfb23 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
@@ -522,7 +522,8 @@ void jpeg_v1_0_start(struct amdgpu_device *adev, int mode)
 		WREG32_SOC15(JPEG, 0, mmUVD_LMI_JRBC_RB_64BIT_BAR_HIGH, upper_32_bits(ring->gpu_addr));
 		WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_RPTR, 0);
 		WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_WPTR, 0);
-	}	WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_CNTL, UVD_JRBC_RB_CNTL__RB_RPTR_WR_EN_MASK);
+		WREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_CNTL, UVD_JRBC_RB_CNTL__RB_RPTR_WR_EN_MASK);
+	}
 
 	/* initialize wptr */
 	ring->wptr = RREG32_SOC15(JPEG, 0, mmUVD_JRBC_RB_WPTR);
-- 
2.11.0
