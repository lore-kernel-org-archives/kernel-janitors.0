From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 Aug 2019 16:10:42 +0000
Subject: Re: [PATCH][drm-next] drm/amd/powerplay: remove redundant duplicated return check
Message-Id: <CADnq5_MKp-x-aEEFtL3B8T7PJ+JusqJAykZwZ4Eu25ieOEPuhg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190805102940.26024-1-colin.king@canonical.com>
In-Reply-To: <20190805102940.26024-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <rex.zhu-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Applied.  thanks!

Alex

On Mon, Aug 5, 2019 at 6:29 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The check on ret is duplicated in two places, it is redundant code.
> Remove it.
>
> Addresses-Coverity: ("Logically dead code")
> Fixes: b94afb61cdae ("drm/amd/powerplay: honor hw limit on fetching metrics data for navi10")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> index d62c2784b102..b272c8dc8f79 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -941,8 +941,6 @@ static int navi10_get_gpu_power(struct smu_context *smu, uint32_t *value)
>         ret = navi10_get_metrics_table(smu, &metrics);
>         if (ret)
>                 return ret;
> -       if (ret)
> -               return ret;
>
>         *value = metrics.AverageSocketPower << 8;
>
> @@ -1001,8 +999,6 @@ static int navi10_get_fan_speed_rpm(struct smu_context *smu,
>         ret = navi10_get_metrics_table(smu, &metrics);
>         if (ret)
>                 return ret;
> -       if (ret)
> -               return ret;
>
>         *speed = metrics.CurrFanSpeed;
>
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
