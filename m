From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Aug 2019 13:20:12 +0000
Subject: [PATCH] drm/amd/powerplay: Fix an off by one in navi10_get_smu_msg_index()
Message-Id: <20190826132012.GB6840@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Kevin Wang <kevin1.wang-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Kenneth Feng <kenneth.feng-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

The navi10_message_map[] array has SMU_MSG_MAX_COUNT elements so the ">"
has to be changed to ">=" to prevent reading one element beyond the end
of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index d7e25f5113f1..fbecd25f150f 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -213,7 +213,7 @@ static int navi10_get_smu_msg_index(struct smu_context *smc, uint32_t index)
 {
 	struct smu_11_0_cmn2aisc_mapping mapping;
 
-	if (index > SMU_MSG_MAX_COUNT)
+	if (index >= SMU_MSG_MAX_COUNT)
 		return -EINVAL;
 
 	mapping = navi10_message_map[index];
-- 
2.20.1
