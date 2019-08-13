From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Aug 2019 13:58:31 +0000
Subject: Re: [PATCH] drm/amdgpu/powerplay: fix spelling mistake "unsuported" -> "unsupported"
Message-Id: <CADnq5_MihuON5NRn7gbjbD9br37=vL+ZtjNqqFE2XQGrA_P7Zw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190813103340.11051-1-colin.king@canonical.com>
In-Reply-To: <20190813103340.11051-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <rex.zhu-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Applied.  Thanks!

Alex

On Tue, Aug 13, 2019 at 6:33 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a pr_err error message. Fix it. Also
> add a space after a comma to clean up a checkpatch warning.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/powerplay/smu_v11_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> index 8bbcf034799c..d324bd28934d 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> @@ -288,7 +288,7 @@ static int smu_v11_0_check_fw_version(struct smu_context *smu)
>                 smu->smc_if_version = SMU11_DRIVER_IF_VERSION_NV14;
>                 break;
>         default:
> -               pr_err("smu unsuported asic type:%d.\n",smu->adev->asic_type);
> +               pr_err("smu unsupported asic type:%d.\n", smu->adev->asic_type);
>                 smu->smc_if_version = SMU11_DRIVER_IF_VERSION_INV;
>                 break;
>         }
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
