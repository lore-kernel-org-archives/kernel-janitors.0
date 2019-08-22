From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2019 02:37:26 +0000
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variable 'psp_enabled'
Message-Id: <CADnq5_PE3r+4ZrUmc7o0_ah4wZpBi5jhR-yBHA_F+9gzX7Os5Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627075350.86800-1-yuehaibing@huawei.com>
In-Reply-To: <20190627075350.86800-1-yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Jack Xiao <Jack.Xiao-5C7GfCeVMHo@public.gmane.org>, Tao Zhou <tao.zhou1-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Leo Liu <leo.liu-5C7GfCeVMHo@public.gmane.org>, tiancyin <tianci.yin-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Kenneth Feng <kenneth.feng-5C7GfCeVMHo@public.gmane.org>, "Wentland, Harry" <harry.wentland-5C7GfCeVMHo@public.gmane.org>, Christian Koenig <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Hawking Zhang <Hawking.Zhang-5C7GfCeVMHo@public.gmane.org>

Applied.  thanks!

Alex

On Thu, Jun 27, 2019 at 10:29 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/amd/amdgpu/nv.c: In function 'nv_common_early_init':
> drivers/gpu/drm/amd/amdgpu/nv.c:471:7: warning:
>  variable 'psp_enabled' set but not used [-Wunused-but-set-variable]
>
> It's not used since inroduction in
> commit c6b6a42175f5 ("drm/amdgpu: add navi10 common ip block (v3)")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/nv.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
> index af20ffb55c54..8b9fa3db8daa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -468,7 +468,6 @@ static const struct amdgpu_asic_funcs nv_asic_funcs >
>  static int nv_common_early_init(void *handle)
>  {
> -       bool psp_enabled = false;
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         adev->smc_rreg = NULL;
> @@ -485,10 +484,6 @@ static int nv_common_early_init(void *handle)
>
>         adev->asic_funcs = &nv_asic_funcs;
>
> -       if (amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_PSP) &&
> -           (amdgpu_ip_block_mask & (1 << AMD_IP_BLOCK_TYPE_PSP)))
> -               psp_enabled = true;
> -
>         adev->rev_id = nv_get_rev_id(adev);
>         adev->external_rev_id = 0xff;
>         switch (adev->asic_type) {
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
