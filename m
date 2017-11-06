From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Nov 2017 11:44:22 +0000
Subject: [PATCH] drm/amd/display: remove some unneeded code
Message-Id: <20171106114422.sd5zoah6k6eaww4e@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: Charlene Liu <charlene.liu-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dmytro Laktyushkin <Dmytro.Laktyushkin-5C7GfCeVMHo@public.gmane.org>, Vitaly Prosyak <vitaly.prosyak-5C7GfCeVMHo@public.gmane.org>, Yongqiang Sun <yongqiang.sun-5C7GfCeVMHo@public.gmane.org>, Tony Cheng <tony.cheng-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

We assign "v_init = asic_blank_start;" a few lines earlier so there is
no need to do it again inside the if statements.  Also "v_init" is
unsigned so it can't be less than zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c
index 1994865d4351..c7333cdf1802 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c
@@ -236,13 +236,10 @@ static void tgn10_program_timing(
 	if (tg->dlg_otg_param.signal = SIGNAL_TYPE_DISPLAY_PORT ||
 		tg->dlg_otg_param.signal = SIGNAL_TYPE_DISPLAY_PORT_MST ||
 		tg->dlg_otg_param.signal = SIGNAL_TYPE_EDP) {
-		v_init = asic_blank_start;
 		start_point = 1;
 		if (patched_crtc_timing.flags.INTERLACE = 1)
 			field_num = 1;
 	}
-	if (v_init < 0)
-		v_init = 0;
 	v_fp2 = 0;
 	if (tg->dlg_otg_param.vstartup_start > asic_blank_end)
 		v_fp2 = tg->dlg_otg_param.vstartup_start > asic_blank_end;
