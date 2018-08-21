From: Colin King <colin.king@canonical.com>
Date: Tue, 21 Aug 2018 11:55:19 +0000
Subject: [PATCH] drm/msm: fix unsigned comparison with less than zero
Message-Id: <20180821115520.4215-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

The return from the call to _mixer_stages can be a negative error
code however this is being assigned to an unsigned variable 'stages'
hence the check is always false. Fix this by making 'stages' an
int.

Detected by Coccinelle ("Unsigned expression compared with zero:
stages < 0")

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 06be7cf7ce50..79bafea66354 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -310,7 +310,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	u32 mixercfg = 0, mixercfg_ext = 0, mix, ext;
 	u32 mixercfg_ext2 = 0, mixercfg_ext3 = 0;
 	int i, j;
-	u8 stages;
+	int stages;
 	int pipes_per_stage;
 
 	stages = _mixer_stages(ctx->mixer_hw_caps, ctx->mixer_count, lm);
-- 
2.17.1
