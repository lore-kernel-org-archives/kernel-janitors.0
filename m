From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Jul 2018 09:29:29 +0000
Subject: [PATCH] drm/amdgpu: fix spelling mistake "successed" -> "succeeded"
Message-Id: <20180717092929.19311-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err error message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 9883fa9bb41b..e9feb3c58389 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2004,7 +2004,7 @@ static int amdgpu_device_ip_reinit_early_sriov(struct amdgpu_device *adev)
 				continue;
 
 			r = block->version->funcs->hw_init(adev);
-			DRM_INFO("RE-INIT: %s %s\n", block->version->funcs->name, r?"failed":"successed");
+			DRM_INFO("RE-INIT: %s %s\n", block->version->funcs->name, r?"failed":"succeeded");
 			if (r)
 				return r;
 		}
@@ -2039,7 +2039,7 @@ static int amdgpu_device_ip_reinit_late_sriov(struct amdgpu_device *adev)
 				continue;
 
 			r = block->version->funcs->hw_init(adev);
-			DRM_INFO("RE-INIT: %s %s\n", block->version->funcs->name, r?"failed":"successed");
+			DRM_INFO("RE-INIT: %s %s\n", block->version->funcs->name, r?"failed":"succeeded");
 			if (r)
 				return r;
 		}
@@ -3092,7 +3092,7 @@ static int amdgpu_device_handle_vram_lost(struct amdgpu_device *adev)
  * @adev: amdgpu device pointer
  *
  * attempt to do soft-reset or full-reset and reinitialize Asic
- * return 0 means successed otherwise failed
+ * return 0 means succeeded otherwise failed
  */
 static int amdgpu_device_reset(struct amdgpu_device *adev)
 {
@@ -3170,7 +3170,7 @@ static int amdgpu_device_reset(struct amdgpu_device *adev)
  * @from_hypervisor: request from hypervisor
  *
  * do VF FLR and reinitialize Asic
- * return 0 means successed otherwise failed
+ * return 0 means succeeded otherwise failed
  */
 static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 				     bool from_hypervisor)
@@ -3295,7 +3295,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		dev_info(adev->dev, "GPU reset(%d) failed\n", atomic_read(&adev->gpu_reset_counter));
 		amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_GPU_RESET_FAIL, 0, r);
 	} else {
-		dev_info(adev->dev, "GPU reset(%d) successed!\n",atomic_read(&adev->gpu_reset_counter));
+		dev_info(adev->dev, "GPU reset(%d) succeeded!\n",atomic_read(&adev->gpu_reset_counter));
 	}
 
 	amdgpu_vf_error_trans_all(adev);
-- 
2.17.1

