From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 12:16:59 +0000
Subject: [PATCH] drm/amdgpu: potential shift wrapping bug
Message-Id: <20170810121659.7k2pqemqnd3px2qi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, Harish Kasiviswanathan <Harish.Kasiviswanathan-5C7GfCeVMHo@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "Zhang,
 Jerry" <Jerry.Zhang-5C7GfCeVMHo@public.gmane.org>, Alex Xie <AlexBin.Xie-5C7GfCeVMHo@public.gmane.org>

"frag_align" is a u64, so presumably we want to use the high bits as
well instead of shift wrapping.

Fixes: 6be7adb37d9b ("drm/amdgpu: increase fragmentation size for Vega10 v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index ba0407d12525..d9a8e942ac3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1459,7 +1459,7 @@ static int amdgpu_vm_frag_ptes(struct amdgpu_pte_update_params	*params,
 	/* SI and newer are optimized for 64KB */
 	unsigned pages_per_frag = AMDGPU_LOG2_PAGES_PER_FRAG(params->adev);
 	uint64_t frag_flags = AMDGPU_PTE_FRAG(pages_per_frag);
-	uint64_t frag_align = 1 << pages_per_frag;
+	uint64_t frag_align = 1ULL << pages_per_frag;
 
 	uint64_t frag_start = ALIGN(start, frag_align);
 	uint64_t frag_end = end & ~(frag_align - 1);
