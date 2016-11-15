From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 15 Nov 2016 10:00:53 +0000
Subject: Re: [patch] drm: zte: checking for NULL instead of IS_ERR()
Message-Id: <20161115100053.cz3ikoojsuhi33kc@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161115095301.GC15424@mwanda>
In-Reply-To: <20161115095301.GC15424@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Shawn Guo <shawnguo@kernel.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Tue, Nov 15, 2016 at 12:53:01PM +0300, Dan Carpenter wrote:
> drm_dev_alloc() never returns NULL, it only returns error pointers on
> error.
> 
> Fixes: 0a886f59528a ("drm: zte: add initial vou drm driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thx.
-Daniel

> 
> diff --git a/drivers/gpu/drm/zte/zx_drm_drv.c b/drivers/gpu/drm/zte/zx_drm_drv.c
> index abc8099..3e76f72 100644
> --- a/drivers/gpu/drm/zte/zx_drm_drv.c
> +++ b/drivers/gpu/drm/zte/zx_drm_drv.c
> @@ -107,8 +107,8 @@ static int zx_drm_bind(struct device *dev)
>  		return -ENOMEM;
>  
>  	drm = drm_dev_alloc(&zx_drm_driver, dev);
> -	if (!drm)
> -		return -ENOMEM;
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
>  
>  	drm->dev_private = priv;
>  	dev_set_drvdata(dev, drm);
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
