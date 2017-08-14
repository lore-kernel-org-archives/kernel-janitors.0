From: Jordan Crouse <jcrouse@codeaurora.org>
Date: Mon, 14 Aug 2017 14:50:24 +0000
Subject: Re: [PATCH] drm/msm: Error pointer dereference in error handling
Message-Id: <20170814145023.GA18946@jcrouse-lnx.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170811201535.xy4smb52jqo5egtv@mwanda>
In-Reply-To: <20170811201535.xy4smb52jqo5egtv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Fri, Aug 11, 2017 at 11:15:35PM +0300, Dan Carpenter wrote:
> "gpu->aspace" can be either an error pointer or NULL so we need to check
> for both.
> 
> Fixes: 0dbd7327f4d5 ("drm/msm: Move memptrs to msm_gpu")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 66af5ac334ba..156ad7d5c68a 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -775,7 +775,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		drm_gem_object_unreference_unlocked(gpu->memptrs_bo);
>  	}
>  
> -	if (gpu->aspace) {
> +	if (!IS_ERR_OR_NULL(gpu->aspace)) {
>  		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu,
>  			NULL, 0);
>  		msm_gem_address_space_put(gpu->aspace);

Yep, thats clearly a paddlin'.  Thanks.

Acked-by: Jordan Crouse <jcrouse@codeauorora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
