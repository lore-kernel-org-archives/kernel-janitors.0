From: Harry Wentland <harry.wentland@amd.com>
Date: Mon, 03 Apr 2017 18:53:44 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix a NULL deref in amdgpu_vm_add_prt_cb()
Message-Id: <10afeb82-a698-5684-0303-5c9a3895d99f@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403184139.GA12398@mwanda>
In-Reply-To: <20170403184139.GA12398@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Junwei Zhang <Jerry.Zhang-5C7GfCeVMHo@public.gmane.org>, Edward O'Callaghan <funfunctor-dczkZgxz+BNUPWh3PAxdjQ@public.gmane.org>, Alex Xie <AlexBin.Xie-5C7GfCeVMHo@public.gmane.org>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

On 2017-04-03 02:41 PM, Dan Carpenter wrote:
> We accidentally dereference "cb" if the kmalloc() fails.
>
> Fixes: 451bc8eb8fe6 ("drm/amdgpu: fix PRT teardown on VM fini v3")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 0235d7933efd..45a1bcfc41f7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1518,7 +1518,7 @@ static void amdgpu_vm_add_prt_cb(struct amdgpu_device *adev,
>  		if (fence)
>  			dma_fence_wait(fence, false);
>
> -		amdgpu_vm_prt_put(cb->adev);
> +		amdgpu_vm_prt_put(adev);
>  	} else {
>  		cb->adev = adev;
>  		if (!fence || dma_fence_add_callback(fence, &cb->cb,
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
