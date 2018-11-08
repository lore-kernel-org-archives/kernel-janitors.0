From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 08 Nov 2018 20:33:26 +0000
Subject: Re: [PATCH -next] drm/radeon: remove set but not used variable 'rdev'
Message-Id: <CADnq5_NrRBH_2jNqJq-vQoSraPNvfihFDuyLTK3erR_W=qyUzw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541678023-143862-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541678023-143862-1-git-send-email-yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian Koenig <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Thu, Nov 8, 2018 at 9:04 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> From: Yue Haibing <yuehaibing@huawei.com>
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/radeon/radeon_object.c: In function 'radeon_bo_unref':
> drivers/gpu/drm/radeon/radeon_object.c:317:24: warning:
>  variable 'rdev' set but not used [-Wunused-but-set-variable]
>
> It not used  any more after commit
>   e7e31600d3e2 ("drm/radeon: remove taking mclk_lock from radeon_bo_unref")
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_object.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index ba2fd29..c4b2e14 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -314,11 +314,9 @@ struct radeon_bo *radeon_bo_ref(struct radeon_bo *bo)
>  void radeon_bo_unref(struct radeon_bo **bo)
>  {
>         struct ttm_buffer_object *tbo;
> -       struct radeon_device *rdev;
>
>         if ((*bo) = NULL)
>                 return;
> -       rdev = (*bo)->rdev;
>         tbo = &((*bo)->tbo);
>         ttm_bo_put(tbo);
>         *bo = NULL;
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
