From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Feb 2017 20:23:42 +0000
Subject: [PATCH] drm/amdgpu/virt: fix double kfree on bo_va
Message-Id: <20170203202342.13128-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Monk Liu <Monk.Liu@amd.com>, Xiangliang Yu <Xiangliang.Yu@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

bo_va is being kfree'd twice, once in the call to amdgpu_vm_bo_rmv
and then a short while later. Fix this double free by removing
the 2nd kfree.

Detected by CoverityScan, CID#1399524 ("Double Free")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 3fd951c..dcfb7df 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -83,7 +83,6 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		DRM_ERROR("failed to do bo_map on static CSA, err=%d\n", r);
 		amdgpu_vm_bo_rmv(adev, bo_va);
 		ttm_eu_backoff_reservation(&ticket, &list);
-		kfree(bo_va);
 		return r;
 	}
 
-- 
2.10.2

