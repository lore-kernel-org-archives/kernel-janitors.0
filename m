From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Oct 2019 09:02:06 +0000
Subject: [PATCH] drm/amd/powerplay: Fix error handling in smu_init_fb_allocations()
Message-Id: <20191007090206.GD3865@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rex Zhu <rex.zhu-5C7GfCeVMHo@public.gmane.org>, Kevin Wang <Kevin1.Wang-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

The error handling is off by one.  We should not free the first
"tables[i].bo" without decrementing "i" because that might result in a
double free.  The second problem is that when an error occurs, then the
zeroth element "tables[0].bo" isn't freed.

I had make "i" signed int for the error handling to work, so I just
updated "ret" as well as a clean up.

Fixes: f96357a991b9 ("drm/amd/powerplay: implement smu_init(fini)_fb_allocations function")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index f1fbbc8b77ee..c9266ea70331 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -896,8 +896,7 @@ static int smu_init_fb_allocations(struct smu_context *smu)
 	struct amdgpu_device *adev = smu->adev;
 	struct smu_table_context *smu_table = &smu->smu_table;
 	struct smu_table *tables = smu_table->tables;
-	uint32_t i = 0;
-	int32_t ret = 0;
+	int ret, i;
 
 	for (i = 0; i < SMU_TABLE_COUNT; i++) {
 		if (tables[i].size = 0)
@@ -915,7 +914,7 @@ static int smu_init_fb_allocations(struct smu_context *smu)
 
 	return 0;
 failed:
-	for (; i > 0; i--) {
+	while (--i >= 0) {
 		if (tables[i].size = 0)
 			continue;
 		amdgpu_bo_free_kernel(&tables[i].bo,
-- 
2.20.1
