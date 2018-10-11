From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 11 Oct 2018 08:46:52 +0000
Subject: Re: [PATCH -next] drm: Use PTR_ERR_OR_ZERO in drm_fb_cma_fbdev_init()
Message-Id: <20181011084652.GZ31561@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539176563-144779-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539176563-144779-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>

On Wed, Oct 10, 2018 at 01:02:43PM +0000, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_fb_cma_helper.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
> index fb0dfc6..30741eb 100644
> --- a/drivers/gpu/drm/drm_fb_cma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_cma_helper.c
> @@ -124,10 +124,7 @@ int drm_fb_cma_fbdev_init(struct drm_device *dev, unsigned int preferred_bpp,
>  
>  	/* dev->fb_helper will indirectly point to fbdev_cma after this call */
>  	fbdev_cma = drm_fbdev_cma_init(dev, preferred_bpp, max_conn_count);
> -	if (IS_ERR(fbdev_cma))
> -		return PTR_ERR(fbdev_cma);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(fbdev_cma);
>  }
>  EXPORT_SYMBOL_GPL(drm_fb_cma_fbdev_init);
>  
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
