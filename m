From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 04 Mar 2019 18:59:47 +0000
Subject: Re: [PATCH][drm-next] drm/amdgpu: fix missing assignment of error return code to variable ret
Message-Id: <CADnq5_O9MQY1T=_3NiuDsVbvGR+5Twyyh53WMt=uOuBz327g0Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190302221658.7536-1-colin.king@canonical.com>
In-Reply-To: <20190302221658.7536-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Oded Gabbay <oded.gabbay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Sat, Mar 2, 2019 at 5:17 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> An earlier commit replaced ttm_bo_wait with amdgpu_bo_sync_wait and
> removed the error return assignment to variable ret. Fix this by adding
> the assignment back. Also break line to clean up checkpatch overly
> long line warning.
>
> Detected by CoverityScan, CID#1477327 ("Logically dead code")
>
> Fixes: c60cd590cb7d ("drm/amdgpu: Replace ttm_bo_wait with amdgpu_bo_sync_wait")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 1921dec3df7a..92993baac91a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -906,7 +906,8 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
>                 pr_err("validate_pt_pd_bos() failed\n");
>                 goto validate_pd_fail;
>         }
> -       amdgpu_bo_sync_wait(vm->root.base.bo, AMDGPU_FENCE_OWNER_KFD, false);
> +       ret = amdgpu_bo_sync_wait(vm->root.base.bo,
> +                                 AMDGPU_FENCE_OWNER_KFD, false);
>         if (ret)
>                 goto wait_pd_fail;
>         amdgpu_bo_fence(vm->root.base.bo,
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
