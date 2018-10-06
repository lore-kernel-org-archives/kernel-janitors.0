From: Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 06 Oct 2018 01:41:30 +0000
Subject: Re: [PATCH -next] drm/msm/dpu: remove duplicated include from dpu_hw_lm.c
Message-Id: <4a87e33a27de879647b95e4885c468dc@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538790573-171721-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538790573-171721-1-git-send-email-yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sravanthi Kollukuduru <skolluku-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

On 2018-10-05 18:49, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index acb8dc8..5d5dea8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -16,7 +16,6 @@
>  #include "dpu_hw_lm.h"
>  #include "dpu_hw_mdss.h"
>  #include "dpu_dbg.h"
> -#include "dpu_kms.h"
> 
>  #define LM_OP_MODE                        0x00
>  #define LM_OUT_SIZE                       0x04
