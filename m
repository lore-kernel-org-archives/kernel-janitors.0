From: Colin King <colin.king@canonical.com>
Date: Fri, 16 Jun 2017 08:46:10 +0000
Subject: [PATCH][drm-next] drm/amdgpu: fix some spelling mistakes and break overly wide lines
Message-Id: <20170616084610.22861-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fixes to spelling mistakes in DRM_INFO, dev_info and
WARN_ONCE messages.  Also break overly wide lines and add some
white spacing where appropriate in ternary operator.

Fixes:
  "successed" -> "succeeded"
  "suuport" -> "support"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 12 ++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 875cde414be7..990c427233f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1885,7 +1885,9 @@ static int amdgpu_sriov_reinit_early(struct amdgpu_device *adev)
 				continue;
 
 			r = block->version->funcs->hw_init(adev);
-			DRM_INFO("RE-INIT: %s %s\n", block->version->funcs->name, r?"failed":"successed");
+			DRM_INFO("RE-INIT: %s %s\n",
+				 block->version->funcs->name,
+				 r ? "failed" : "succeeded");
 		}
 	}
 
@@ -1916,7 +1918,9 @@ static int amdgpu_sriov_reinit_late(struct amdgpu_device *adev)
 				continue;
 
 			r = block->version->funcs->hw_init(adev);
-			DRM_INFO("RE-INIT: %s %s\n", block->version->funcs->name, r?"failed":"successed");
+			DRM_INFO("RE-INIT: %s %s\n",
+				 block->version->funcs->name,
+				 r ? "failed" : "succeeded");
 		}
 	}
 
@@ -2800,7 +2804,7 @@ int amdgpu_sriov_gpu_reset(struct amdgpu_device *adev, struct amdgpu_job *job)
 		/* bad news, how to tell it to userspace ? */
 		dev_info(adev->dev, "GPU reset failed\n");
 	} else {
-		dev_info(adev->dev, "GPU reset successed!\n");
+		dev_info(adev->dev, "GPU reset succeeded!\n");
 	}
 
 	adev->gfx.in_reset = false;
@@ -2966,7 +2970,7 @@ int amdgpu_gpu_reset(struct amdgpu_device *adev)
 		/* bad news, how to tell it to userspace ? */
 		dev_info(adev->dev, "GPU reset failed\n");
 	else
-		dev_info(adev->dev, "GPU reset successed!\n");
+		dev_info(adev->dev, "GPU reset succeeded!\n");
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 5795f81369f0..06f11e2a32af 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1301,7 +1301,7 @@ static int amdgpu_vm_update_ptes(struct amdgpu_pte_update_params *params,
 
 		if (params->shadow) {
 			if (WARN_ONCE(use_cpu_update,
-				"CPU VM update doesn't suuport shadow pages"))
+				"CPU VM update doesn't support shadow pages"))
 				return 0;
 
 			if (!pt->shadow)
-- 
2.11.0

