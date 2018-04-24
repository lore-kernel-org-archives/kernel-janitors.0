From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 24 Apr 2018 09:10:28 +0000
Subject: Re: [PATCH -next] drm/amdgpu: fix error return code in amdgpu_amdkfd_gpuvm_create_process_vm()
Message-Id: <CAFCwf12e_JS3qOfq22isPpwy-Hs3mwpv0iLB9NDMxPr=wgYGWw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522243256-94061-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522243256-94061-1-git-send-email-weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Wed, Mar 28, 2018 at 4:20 PM, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> Fix to return error code -ENOMEM from the eviction fence create fail
> error handling case instead of 0, as done elsewhere in this function.
>
> Fixes: a46a2cd103a8 ("drm/amdgpu: Add GPUVM memory management functions for KFD")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index a12a165..c5c9c6f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -846,6 +846,7 @@ int amdgpu_amdkfd_gpuvm_create_process_vm(struct kgd_dev *kgd, void **vm,
>                                                    current->mm);
>                 if (!info->eviction_fence) {
>                         pr_err("Failed to create eviction fence\n");
> +                       ret = -ENOMEM;
>                         goto create_evict_fence_fail;
>                 }
>

Thanks, but not relevant as the code moved to a different function and
it already contains the line you added.

Oded
