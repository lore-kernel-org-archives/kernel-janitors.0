From: Sushmita Susheelendra <ssusheel@codeaurora.org>
Date: Mon, 10 Jul 2017 17:51:33 +0000
Subject: Re: [PATCH] drm/msm: unlock on error in msm_gem_get_iova()
Message-Id: <4c8833e51fdbb10186786b43e0629204@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710072042.fs7ovvp5ufyg5hn3@mwanda>
In-Reply-To: <20170710072042.fs7ovvp5ufyg5hn3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org

Thanks for the catch!

-Sushmita

On 2017-07-10 01:20, Dan Carpenter wrote:
> We recently added locking to this function but there was a direct 
> return
> that was overlooked where we need to unlock.
> 
> Fixes: 0e08270a1f01 ("drm/msm: Separate locking of buffer resources
> from struct_mutex")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c 
> b/drivers/gpu/drm/msm/msm_gem.c
> index 65f35544c1ec..065d933df2c3 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -383,8 +383,10 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
>  		struct page **pages;
> 
>  		vma = add_vma(obj, aspace);
> -		if (IS_ERR(vma))
> -			return PTR_ERR(vma);
> +		if (IS_ERR(vma)) {
> +			ret = PTR_ERR(vma);
> +			goto unlock;
> +		}
> 
>  		pages = get_pages(obj);
>  		if (IS_ERR(pages)) {
> @@ -405,7 +407,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
> 
>  fail:
>  	del_vma(vma);
> -
> +unlock:
>  	mutex_unlock(&msm_obj->lock);
>  	return ret;
>  }
