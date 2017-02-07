From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:16:51 +0000
Subject: [patch] drm/amdgpu/virt: double free in amdgpu_map_static_csa()
Message-Id: <20170207131651.GB27416@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Xiangliang Yu <Xiangliang.Yu@amd.com>, amd-gfx@lists.freedesktop.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

The amdgpu_vm_bo_rmv() function frees "bo_va" so we shouldn't free it
a second time.

Fixes: 4e4bbe7343a6 ("drm/amdgpu:add new file for SRIOV")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 3fd951c71d1b..dcfb7df3caf4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -83,7 +83,6 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		DRM_ERROR("failed to do bo_map on static CSA, err=%d\n", r);
 		amdgpu_vm_bo_rmv(adev, bo_va);
 		ttm_eu_backoff_reservation(&ticket, &list);
-		kfree(bo_va);
 		return r;
 	}
 
