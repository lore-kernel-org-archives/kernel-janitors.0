From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 03 Apr 2017 20:28:54 +0000
Subject: Re: [PATCH 1/2] drm/amd/powerplay: fix pp_dpm_get_current_power_state()
Message-Id: <CADnq5_NT+KEAX1w8a4vZdTYfH3eQ_OsmPF2KhfoCVBXA5aeQ_Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403184147.GA22462@mwanda>
In-Reply-To: <20170403184147.GA22462@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tom St Denis <tom.stdenis@amd.com>, Edward O'Callaghan <funfunctor@folklore1984.net>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, Eric Huang <JinHuiEric.Huang@amd.com>, Huang Rui <ray.huang@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Mon, Apr 3, 2017 at 2:41 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This switch statement is missing breaks.
>
> Fixes: 2a5071056e6a ("drm/amd/powerplay: add global PowerPlay mutex.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

>
> diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> index dfd4fe6f0578..260b732be7c3 100644
> --- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> @@ -539,10 +539,13 @@ static enum amd_pm_state_type pp_dpm_get_current_power_state(void *handle)
>         switch (state->classification.ui_label) {
>         case PP_StateUILabel_Battery:
>                 pm_type = POWER_STATE_TYPE_BATTERY;
> +               break;
>         case PP_StateUILabel_Balanced:
>                 pm_type = POWER_STATE_TYPE_BALANCED;
> +               break;
>         case PP_StateUILabel_Performance:
>                 pm_type = POWER_STATE_TYPE_PERFORMANCE;
> +               break;
>         default:
>                 if (state->classification.flags & PP_StateClassificationFlag_Boot)
>                         pm_type = POWER_STATE_TYPE_INTERNAL_BOOT;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
