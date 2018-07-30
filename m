From: Sean Paul <seanpaul@chromium.org>
Date: Mon, 30 Jul 2018 13:53:43 +0000
Subject: Re: [PATCH][drm-next] drm/msm/disp/dpu: fix two spelling mistakes
Message-Id: <20180730135343.GC20303@art_vandelay>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180730134446.8567-1-colin.king@canonical.com>
In-Reply-To: <20180730134446.8567-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

On Mon, Jul 30, 2018 at 02:44:46PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in error messages
> "diable" -> "disable"
> "cliend" -> "client"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_power_handle.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0bd3eda93e22..0922d3536412 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -421,7 +421,7 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
>  
>  	ret = dpu_core_irq_disable(phys_enc->dpu_kms, &irq->irq_idx, 1);
>  	if (ret) {
> -		DRM_ERROR("diable failed id=%u, intr=%d, hw=%d, irq=%d ret=%d",
> +		DRM_ERROR("disable failed id=%u, intr=%d, hw=%d, irq=%d ret=%d",
>  			  DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
>  			  irq->irq_idx, ret);
>  	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_power_handle.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_power_handle.c
> index a68f1249388c..a75eebca2f37 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_power_handle.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_power_handle.c
> @@ -121,7 +121,7 @@ void dpu_power_resource_deinit(struct platform_device *pdev,
>  	mutex_lock(&phandle->phandle_lock);
>  	list_for_each_entry_safe(curr_client, next_client,
>  			&phandle->power_client_clist, list) {
> -		pr_err("cliend:%s-%d still registered with refcount:%d\n",
> +		pr_err("client:%s-%d still registered with refcount:%d\n",
>  				curr_client->name, curr_client->id,
>  				curr_client->refcount);
>  		curr_client->active = false;
> -- 
> 2.17.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Sean Paul, Software Engineer, Google / Chromium OS
