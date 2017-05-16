From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 May 2017 14:42:54 +0000
Subject: [PATCH] drm/amd/powerplay: fix a signedness bugs
Message-Id: <20170516144253.vvu3i6mbx3rv5uki@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Eric Huang <JinHuiEric.Huang-5C7GfCeVMHo@public.gmane.org>, Ken Wang <Qingqing.wang-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Smatch complains about a signedness bug here:

	vega10_hwmgr.c:4202 vega10_force_clock_level()
	warn: always true condition '(i >= 0) => (0-u32max >= 0)'

Fixes: 7b52db39a4c2 ("drm/amd/powerplay: fix bug sclk/mclk level can't be set on vega10.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
index ad30f5d3a10d..2614af2f553f 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
@@ -4186,7 +4186,7 @@ static int vega10_force_clock_level(struct pp_hwmgr *hwmgr,
 		enum pp_clock_type type, uint32_t mask)
 {
 	struct vega10_hwmgr *data = (struct vega10_hwmgr *)(hwmgr->backend);
-	uint32_t i;
+	int i;
 
 	if (hwmgr->dpm_level != AMD_DPM_FORCED_LEVEL_MANUAL)
 		return -EINVAL;
