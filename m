From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Apr 2017 18:41:39 +0000
Subject: [PATCH] drm/amdgpu: Fix a NULL deref in amdgpu_vm_add_prt_cb()
Message-Id: <20170403184139.GA12398@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Junwei Zhang <Jerry.Zhang@amd.com>, Edward O'Callaghan <funfunctor@folklore1984.net>, Alex Xie <AlexBin.Xie@amd.com>

We accidentally dereference "cb" if the kmalloc() fails.

Fixes: 451bc8eb8fe6 ("drm/amdgpu: fix PRT teardown on VM fini v3")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 0235d7933efd..45a1bcfc41f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1518,7 +1518,7 @@ static void amdgpu_vm_add_prt_cb(struct amdgpu_device *adev,
 		if (fence)
 			dma_fence_wait(fence, false);
 
-		amdgpu_vm_prt_put(cb->adev);
+		amdgpu_vm_prt_put(adev);
 	} else {
 		cb->adev = adev;
 		if (!fence || dma_fence_add_callback(fence, &cb->cb,
