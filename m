From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Apr 2017 18:41:47 +0000
Subject: [PATCH 1/2] drm/amd/powerplay: fix pp_dpm_get_current_power_state()
Message-Id: <20170403184147.GA22462@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>
Cc: Tom St Denis <tom.stdenis-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Eric Huang <JinHuiEric.Huang-5C7GfCeVMHo@public.gmane.org>, Edward O'Callaghan <funfunctor-dczkZgxz+BNUPWh3PAxdjQ@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

This switch statement is missing breaks.

Fixes: 2a5071056e6a ("drm/amd/powerplay: add global PowerPlay mutex.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
index dfd4fe6f0578..260b732be7c3 100644
--- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
@@ -539,10 +539,13 @@ static enum amd_pm_state_type pp_dpm_get_current_power_state(void *handle)
 	switch (state->classification.ui_label) {
 	case PP_StateUILabel_Battery:
 		pm_type = POWER_STATE_TYPE_BATTERY;
+		break;
 	case PP_StateUILabel_Balanced:
 		pm_type = POWER_STATE_TYPE_BALANCED;
+		break;
 	case PP_StateUILabel_Performance:
 		pm_type = POWER_STATE_TYPE_PERFORMANCE;
+		break;
 	default:
 		if (state->classification.flags & PP_StateClassificationFlag_Boot)
 			pm_type = POWER_STATE_TYPE_INTERNAL_BOOT;
