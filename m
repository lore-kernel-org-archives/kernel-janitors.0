From: Colin King <colin.king@canonical.com>
Date: Sat, 02 Mar 2019 22:16:58 +0000
Subject: [PATCH][drm-next] drm/amdgpu: fix missing assignment of error return code to variable ret
Message-Id: <20190302221658.7536-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An earlier commit replaced ttm_bo_wait with amdgpu_bo_sync_wait and
removed the error return assignment to variable ret. Fix this by adding
the assignment back. Also break line to clean up checkpatch overly
long line warning.

Detected by CoverityScan, CID#1477327 ("Logically dead code")

Fixes: c60cd590cb7d ("drm/amdgpu: Replace ttm_bo_wait with amdgpu_bo_sync_wait")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 1921dec3df7a..92993baac91a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -906,7 +906,8 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 		pr_err("validate_pt_pd_bos() failed\n");
 		goto validate_pd_fail;
 	}
-	amdgpu_bo_sync_wait(vm->root.base.bo, AMDGPU_FENCE_OWNER_KFD, false);
+	ret = amdgpu_bo_sync_wait(vm->root.base.bo,
+				  AMDGPU_FENCE_OWNER_KFD, false);
 	if (ret)
 		goto wait_pd_fail;
 	amdgpu_bo_fence(vm->root.base.bo,
-- 
2.20.1
