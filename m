From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 13 Dec 2016 21:25:20 +0000
Subject: Re: [patch] drm: mxsfb: drm_dev_alloc() returns error pointers
Message-Id: <20161213212520.65btpa6a5535puln@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161213122332.GA7519@elgon.mountain>
In-Reply-To: <20161213122332.GA7519@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marek Vasut <marex@denx.de>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Tue, Dec 13, 2016 at 03:23:32PM +0300, Dan Carpenter wrote:
> We should be checking for IS_ERR() instead of NULL because
> drm_dev_alloc() returns error pointers.
> 
> Fixes: 45d59d704080 ("drm: Add new driver for MXSFB controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued up in drm-misc for 4.11 (since drm_dev_alloc doesn't fail due to
the small allocs guarantee anyway), will show up in linux-next as soon as
-rc1 hits the door.

Thanks, Daniel

> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 79a18bf48b54..955441f71500 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -395,8 +395,8 @@ static int mxsfb_probe(struct platform_device *pdev)
>  		pdev->id_entry = of_id->data;
>  
>  	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
> -	if (!drm)
> -		return -ENOMEM;
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
>  
>  	ret = mxsfb_load(drm, 0);
>  	if (ret)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
