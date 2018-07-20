From: Liviu Dudau <Liviu.Dudau@arm.com>
Date: Fri, 20 Jul 2018 09:09:58 +0000
Subject: Re: [PATCH] drm/cma-helper: NULL dereference calling drm_gem_cma_prime_get_sg_table()
Message-Id: <20180720090958.GA23516@e110455-lin.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180719081200.63xibytp4esvmg4z@mwanda>
In-Reply-To: <20180719081200.63xibytp4esvmg4z@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Thu, Jul 19, 2018 at 11:12:01AM +0300, Dan Carpenter wrote:
> This funciton is only called from drm_gem_map_dma_buf().  It's supposed
> to return error pointers on failure and returning a NULL pointer will
> lead to a NULL dereference.
> 
> Fixes: 78467dc5f70f ("drm/cma: add low-level hook functions to use prime helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 80a5115c3846..f8a9c09efb87 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -436,7 +436,7 @@ struct sg_table *drm_gem_cma_prime_get_sg_table(struct drm_gem_object *obj)
>  
>  	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
>  	if (!sgt)
> -		return NULL;
> +		return ERR_PTR(-EINVAL);
>  
>  	ret = dma_get_sgtable(obj->dev->dev, sgt, cma_obj->vaddr,
>  			      cma_obj->paddr, obj->size);
> @@ -447,7 +447,7 @@ struct sg_table *drm_gem_cma_prime_get_sg_table(struct drm_gem_object *obj)
>  
>  out:
>  	kfree(sgt);
> -	return NULL;
> +	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_cma_prime_get_sg_table);
>  
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
==========
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
