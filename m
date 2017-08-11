From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Aug 2017 20:15:35 +0000
Subject: [PATCH] drm/msm: Error pointer dereference in error handling
Message-Id: <20170811201535.xy4smb52jqo5egtv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>, Jordan Crouse <jcrouse@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org

"gpu->aspace" can be either an error pointer or NULL so we need to check
for both.

Fixes: 0dbd7327f4d5 ("drm/msm: Move memptrs to msm_gpu")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 66af5ac334ba..156ad7d5c68a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -775,7 +775,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		drm_gem_object_unreference_unlocked(gpu->memptrs_bo);
 	}
 
-	if (gpu->aspace) {
+	if (!IS_ERR_OR_NULL(gpu->aspace)) {
 		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu,
 			NULL, 0);
 		msm_gem_address_space_put(gpu->aspace);
