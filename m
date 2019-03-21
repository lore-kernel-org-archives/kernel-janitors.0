From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Mar 2019 06:28:22 +0000
Subject: [PATCH] drm/amd/powerplay: Fix double unlock bug in smu_sys_set_pp_table()
Message-Id: <20190321062822.GD21489@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Kevin Wang <kevin1.wang-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Chengming Gui <Jack.Gui-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Likun Gao <Likun.Gao-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

We already unlocked a few lines earlier so this code unlocks twice on
the success path.

Fixes: 5809d7420f97 ("drm/amd/powerplay: implement sysfs of pp_table for smu11 (v2)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm not sure what this bug looks like at runtime, but it's slightly
weird that no one noticed.  This is from static analysis and I haven't
tested it myself.

 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 00b7c885772b..7e8c74da6a74 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -187,6 +187,8 @@ int smu_sys_set_pp_table(struct smu_context *smu,  void *buf, size_t size)
 	if (ret)
 		pr_info("smu reset failed, ret = %d\n", ret);
 
+	return ret;
+
 failed:
 	mutex_unlock(&smu->mutex);
 	return ret;
-- 
2.17.1
