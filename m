From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 09 May 2018 19:49:05 +0000
Subject: Re: [PATCH] drm/amd/powerplay: fix spelling mistake: "contruct" -> "construct"
Message-Id: <CADnq5_MUEPZpZswjr+0B8M5NSfWJdqCAgKZ1qgrT2aD98FPsCA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180428222155.20242-1-colin.king@canonical.com>
In-Reply-To: <20180428222155.20242-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Sat, Apr 28, 2018 at 6:21 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to spelling mistake in PP_ASSERT_WITH_CODE message text
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c   | 2 +-
>  drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> index 26fbeafc3c96..726994cf03ea 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> @@ -1229,7 +1229,7 @@ static int smu7_enable_dpm_tasks(struct pp_hwmgr *hwmgr)
>
>                 tmp_result = smu7_construct_voltage_tables(hwmgr);
>                 PP_ASSERT_WITH_CODE((0 = tmp_result),
> -                               "Failed to contruct voltage tables!",
> +                               "Failed to construct voltage tables!",
>                                 result = tmp_result);
>         }
>         smum_initialize_mc_reg_table(hwmgr);
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> index 7cbb56ba6fab..ced1c2aab7a9 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
> @@ -2829,7 +2829,7 @@ static int vega10_enable_dpm_tasks(struct pp_hwmgr *hwmgr)
>
>         tmp_result = vega10_construct_voltage_tables(hwmgr);
>         PP_ASSERT_WITH_CODE(!tmp_result,
> -                       "Failed to contruct voltage tables!",
> +                       "Failed to construct voltage tables!",
>                         result = tmp_result);
>
>         tmp_result = vega10_init_smc_table(hwmgr);
> --
> 2.17.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
