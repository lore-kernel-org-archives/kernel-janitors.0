From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 May 2018 12:56:05 +0000
Subject: [PATCH] drm/amd/pp: missing curly braces in smu7_enable_sclk_mclk_dpm()
Message-Id: <20180517125604.GA10930@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Eric Huang <JinHuiEric.Huang-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

We added some more lines of code to this if statement but forgot to add
curly braces.

Fixes: 0c24e7ef233b ("drm/amd/powerplay: add specific changes for VEGAM in smu7_hwmgr.c")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
index 8eb3f5176646..646c9e9bf681 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
@@ -1018,7 +1018,7 @@ static int smu7_enable_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
 
 	/* enable SCLK dpm */
-	if (!data->sclk_dpm_key_disabled)
+	if (!data->sclk_dpm_key_disabled) {
 		if (hwmgr->chip_id = CHIP_VEGAM)
 			smu7_disable_sclk_vce_handshake(hwmgr);
 
@@ -1026,6 +1026,7 @@ static int smu7_enable_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
 		(0 = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DPM_Enable)),
 		"Failed to enable SCLK DPM during DPM Start Function!",
 		return -EINVAL);
+	}
 
 	/* enable MCLK dpm */
 	if (0 = data->mclk_dpm_key_disabled) {
