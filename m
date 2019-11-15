From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Nov 2019 07:27:40 +0000
Subject: [PATCH] drm/amdgpu: Release the correct object on error in amdgpu_benchmark_move()
Message-Id: <20191115072740.4gznld4t3ngbmcsd@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Junwei Zhang <Jerry.Zhang-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pan Bian <bianpan2016-9Onoh4P/yGk@public.gmane.org>, Christian K??nig <christian.koenig-5C7GfCeVMHo@public.gmane.org>

There is a typo so this unreserves "sobj" instead of "dobj".

Fixes: bb812f1ea87d ("drm/amdgpu: allocate gart memory when it's required (v3)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index d1495e1c9289..43d9d03bc7e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -114,7 +114,7 @@ static void amdgpu_benchmark_move(struct amdgpu_device *adev, unsigned size,
 		goto out_cleanup;
 	r = amdgpu_bo_pin(dobj, ddomain);
 	if (r) {
-		amdgpu_bo_unreserve(sobj);
+		amdgpu_bo_unreserve(dobj);
 		goto out_cleanup;
 	}
 	r = amdgpu_ttm_alloc_gart(&dobj->tbo);
-- 
2.11.0
