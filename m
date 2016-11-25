From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 25 Nov 2016 06:43:48 +0000
Subject: Re: [patch] drm/hisilicon/hibmc: Checking for NULL instead of IS_ERR()
Message-Id: <20161125064348.iqvmc5d3dwtom4aj@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161124113545.GP17225@mwanda>
In-Reply-To: <20161124113545.GP17225@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Xinliang Liu <z.liuxinliang@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen Feng <puck.chen@hisilicon.com>

On Thu, Nov 24, 2016 at 02:35:45PM +0300, Dan Carpenter wrote:
> The drm_dev_alloc() function returns error pointers.  It never returns
> NULLs.
> 
> Fixes: 5e0df3a08f3d ("drm/hisilicon/hibmc: Add hisilicon hibmc drm master driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to drm-misc, thanks.
-Daniel

> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 73ba8b0..d94e349 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -377,9 +377,9 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>  	int ret;
>  
>  	dev = drm_dev_alloc(&hibmc_driver, &pdev->dev);
> -	if (!dev) {
> +	if (IS_ERR(dev)) {
>  		DRM_ERROR("failed to allocate drm_device\n");
> -		return -ENOMEM;
> +		return PTR_ERR(dev);
>  	}
>  
>  	dev->pdev = pdev;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
