From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Oct 2019 09:04:54 +0000
Subject: [PATCH] drm/amd/powerplay: unlock on error in smu_resume()
Message-Id: <20191007090454.GE3865@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rex Zhu <rex.zhu-5C7GfCeVMHo@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

This function needs to drop the mutex before returning.

Fixes: f7e3a5776fa6 ("drm/amd/powerplay: check SMU engine readiness before proceeding on S3 resume")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 6a64f765fcd4..f1fbbc8b77ee 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -1384,7 +1384,7 @@ static int smu_resume(void *handle)
 	ret = smu_start_smc_engine(smu);
 	if (ret) {
 		pr_err("SMU is not ready yet!\n");
-		return ret;
+		goto failed;
 	}
 
 	ret = smu_smc_table_hw_init(smu, false);
-- 
2.20.1
