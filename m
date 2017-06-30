From: Jordan Crouse <jcrouse@codeaurora.org>
Date: Fri, 30 Jun 2017 14:42:34 +0000
Subject: Re: [Freedreno] [PATCH] drm/msm: fix an integer overflow test
Message-Id: <20170630144234.GA14604@jcrouse-lnx.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630075915.crhfqqmjaxq34awz@mwanda>
In-Reply-To: <20170630075915.crhfqqmjaxq34awz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kasin Li <donglil-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

On Fri, Jun 30, 2017 at 10:59:15AM +0300, Dan Carpenter wrote:
> We recently added an integer overflow check but it needs an additional
> tweak to work properly on 32 bit systems.
> 
> The problem is that we're doing the right hand side of the assignment as
> type unsigned long so the max it will have an integer overflow instead
> of being larger than SIZE_MAX.  That means the "sz > SIZE_MAX" condition
> is never true even on 32 bit systems.  We need to first cast it to u64
> and then do the math.
> 
> Fixes: 4a630fadbb29 ("drm/msm: Fix potential buffer overflow issue")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Indeed. Thanks for the catch.

Acked-by: Jordan Crouse <jcrouse@codeaurora.org>

> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 6bfca7470141..8095658e8cb4 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -34,8 +34,8 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  		struct msm_gpu *gpu, uint32_t nr_bos, uint32_t nr_cmds)
>  {
>  	struct msm_gem_submit *submit;
> -	uint64_t sz = sizeof(*submit) + (nr_bos * sizeof(submit->bos[0])) +
> -		(nr_cmds * sizeof(submit->cmd[0]));
> +	uint64_t sz = sizeof(*submit) + ((u64)nr_bos * sizeof(submit->bos[0])) +
> +		((u64)nr_cmds * sizeof(submit->cmd[0]));
>  
>  	if (sz > SIZE_MAX)
>  		return NULL;
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
