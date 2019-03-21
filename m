From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Mar 2019 09:19:57 +0000
Subject: [PATCH] drm/amd/powerplay: Off by one in vega20_get_smu_msg_index()
Message-Id: <20190321091957.GA2793@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Kevin Wang <Kevin1.Wang-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Chengming Gui <Jack.Gui-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Likun Gao <Likun.Gao-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

The > should be >= so that we don't read one element beyond the end of
the vega20_message_map[] array.

Fixes: 3ec3c931489f ("drm/amd/powerplay: implement smu vega20_message_map for vega20")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
index 7e9e8ad9a300..31cd7b9d4dad 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -132,7 +132,8 @@ static int vega20_message_map[SMU_MSG_MAX_COUNT] = {
 static int vega20_get_smu_msg_index(struct smu_context *smc, uint32_t index)
 {
 	int val;
-	if (index > SMU_MSG_MAX_COUNT)
+
+	if (index >= SMU_MSG_MAX_COUNT)
 		return -EINVAL;
 
 	val = vega20_message_map[index];
-- 
2.17.1
