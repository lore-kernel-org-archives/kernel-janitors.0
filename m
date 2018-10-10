From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Oct 2018 19:13:59 +0000
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variable 'ring' in psp_v11_0_ring_stop
Message-Id: <CADnq5_MeA5VXnxVwUDfR0eKptf8hxCg0oVUDwLgnFUSKqKDEHA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538221154-49213-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538221154-49213-1-git-send-email-yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Feifei Xu <Feifei.Xu-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher, Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, "Wang,
 Ken" <Ken.Wang-5C7GfCeVMHo@public.gmane.org>, "Quan, Evan" <evan.quan-5C7GfCeVMHo@public.gmane.org>, Christian Koenig <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Shaoyun Liu <Shaoyun.Liu-5C7GfCeVMHo@public.gmane.org>

On Mon, Oct 1, 2018 at 3:26 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/amd/amdgpu/psp_v11_0.c: In function 'psp_v11_0_ring_stop':
> drivers/gpu/drm/amd/amdgpu/psp_v11_0.c:309:19: warning:
>  variable 'ring' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> index 9217af0..3f3fac2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> @@ -306,11 +306,8 @@ static int psp_v11_0_ring_stop(struct psp_context *psp,
>                               enum psp_ring_type ring_type)
>  {
>         int ret = 0;
> -       struct psp_ring *ring;
>         struct amdgpu_device *adev = psp->adev;
>
> -       ring = &psp->km_ring;
> -
>         /* Write the ring destroy command to C2PMSG_64 */
>         WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_64, GFX_CTRL_CMD_ID_DESTROY_RINGS);
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
