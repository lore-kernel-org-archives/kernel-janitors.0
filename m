From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Mar 2019 06:27:07 +0000
Subject: [PATCH] drm/amd/powerplay: delete some dead code
Message-Id: <20190321062707.GB21489@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206123500.GA9203@mwanda>
In-Reply-To: <20180206123500.GA9203@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Chengming Gui <Jack.Gui-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Kevin Wang <kevin1.wang-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Likun Gao <Likun.Gao-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

The "size" variable is unsigned.  We never pass invalid sizes to this
function and we already used it as an array offset earlier so it's
too late to check here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
index 17143888e37e..b602975563fc 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -1668,9 +1668,6 @@ static int smu_v11_0_set_power_profile_mode(struct smu_context *smu, long *input
 	}
 
 	if (smu->power_profile_mode = PP_SMC_POWER_PROFILE_CUSTOM) {
-		if (size < 0)
-			return -EINVAL;
-
 		ret = smu_v11_0_get_activity_monitor_coeff(smu,
 							   (uint8_t *)(&activity_monitor),
 							   WORKLOAD_PPLIB_CUSTOM_BIT);
-- 
2.17.1
