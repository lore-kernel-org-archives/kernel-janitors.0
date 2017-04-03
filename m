From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 03 Apr 2017 20:33:03 +0000
Subject: Re: [PATCH 2/2] drm/amd/powerplay: fix a couple locking issues
Message-Id: <CADnq5_MBCPEqt-apH8qbBT4B7xDxDqzDzmFtNqXTrTPh70-Uiw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403184242.GB22462@mwanda>
In-Reply-To: <20170403184242.GB22462@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tom St Denis <tom.stdenis@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Eric Huang <JinHuiEric.Huang@amd.com>, Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Monk Liu <Monk.Liu@amd.com>

On Mon, Apr 3, 2017 at 2:42 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We should return unlock on the error path in pp_dpm_dispatch_tasks()
> and there is a double lock bug in pp_dpm_set_sclk_od().
>
> Fixes: 2a5071056e6a ("drm/amd/powerplay: add global PowerPlay mutex.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied. thanks!

Alex

>
> diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> index 260b732be7c3..e59b5627d543 100644
> --- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> @@ -493,8 +493,10 @@ static int pp_dpm_dispatch_tasks(void *handle, enum amd_pp_event event_id,
>         {
>                 enum amd_pm_state_type  ps;
>
> -               if (input = NULL)
> -                       return -EINVAL;
> +               if (input = NULL) {
> +                       ret = -EINVAL;
> +                       break;
> +               }
>                 ps = *(unsigned long *)input;
>
>                 data.requested_ui_label = power_state_convert(ps);
> @@ -897,7 +899,7 @@ static int pp_dpm_set_sclk_od(void *handle, uint32_t value)
>
>         mutex_lock(&pp_handle->pp_lock);
>         ret = hwmgr->hwmgr_func->set_sclk_od(hwmgr, value);
> -       mutex_lock(&pp_handle->pp_lock);
> +       mutex_unlock(&pp_handle->pp_lock);
>         return ret;
>  }
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
