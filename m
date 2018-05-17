From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 May 2018 15:38:49 +0000
Subject: Re: [PATCH] drm/amd/pp: missing curly braces in smu7_enable_sclk_mclk_dpm()
Message-Id: <CADnq5_MBFgrw7p=fpKyA6OL-AVSkuoSDo-EZ=Oy9N-TK+QTy4w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180517125604.GA10930@mwanda>
In-Reply-To: <20180517125604.GA10930@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Eric Huang <JinHuiEric.Huang-5C7GfCeVMHo@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Thu, May 17, 2018 at 8:56 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We added some more lines of code to this if statement but forgot to add
> curly braces.
>
> Fixes: 0c24e7ef233b ("drm/amd/powerplay: add specific changes for VEGAM in smu7_hwmgr.c")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> index 8eb3f5176646..646c9e9bf681 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> @@ -1018,7 +1018,7 @@ static int smu7_enable_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
>         struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
>
>         /* enable SCLK dpm */
> -       if (!data->sclk_dpm_key_disabled)
> +       if (!data->sclk_dpm_key_disabled) {
>                 if (hwmgr->chip_id = CHIP_VEGAM)
>                         smu7_disable_sclk_vce_handshake(hwmgr);
>
> @@ -1026,6 +1026,7 @@ static int smu7_enable_sclk_mclk_dpm(struct pp_hwmgr *hwmgr)
>                 (0 = smum_send_msg_to_smc(hwmgr, PPSMC_MSG_DPM_Enable)),
>                 "Failed to enable SCLK DPM during DPM Start Function!",
>                 return -EINVAL);
> +       }
>
>         /* enable MCLK dpm */
>         if (0 = data->mclk_dpm_key_disabled) {
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
