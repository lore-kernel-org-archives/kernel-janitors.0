From: zhoucm1 <zhoucm1@amd.com>
Date: Tue, 04 Dec 2018 06:39:52 +0000
Subject: Re: [PATCH -next] drm/amdgpu: Fix return value check in amdgpu_allocate_static_csa()
Message-Id: <fc2e78a7-d739-6e53-864b-75080e124585@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543905576-38015-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1543905576-38015-1-git-send-email-weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, David1.Zhou-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Rex.Zhu-5C7GfCeVMHo@public.gmane.org, Monk.Liu-5C7GfCeVMHo@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 2018年12月04日 14:39, Wei Yongjun wrote:
> Fix the return value check which testing the wrong variable
> in amdgpu_allocate_static_csa().
>
> Fixes: 7946340fa389 ("drm/amdgpu: Move csa related code to separate file")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> index 0c590dd..a5fbc6f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> @@ -43,7 +43,7 @@ int amdgpu_allocate_static_csa(struct amdgpu_device *adev, struct amdgpu_bo **bo
>   	r = amdgpu_bo_create_kernel(adev, size, PAGE_SIZE,
>   				domain, bo,
>   				NULL, &ptr);
> -	if (!bo)
> +	if (!r)
>   		return -ENOMEM;
I guess original is correct as well, if you want to change it, you can 
make like below, not your 'if (!r)':
                 if (r)
                         return r;

-David
>   
>   	memset(ptr, 0, size);
>
>
>
