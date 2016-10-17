From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 17 Oct 2016 16:10:22 +0000
Subject: Re: [patch] drm/imx: drm_dev_alloc() returns error pointers
Message-Id: <1476720622.2488.46.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013085321.GG16198@mwanda>
In-Reply-To: <20161013085321.GG16198@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Am Donnerstag, den 13.10.2016, 11:53 +0300 schrieb Dan Carpenter:
> We are checking for NULL here, when we should be checking for error
> pointers.
> 
> Fixes: 54db5decce17 ("drm/imx: drop deprecated load/unload drm_driver ops")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> index 98df09c..3acc976 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -357,8 +357,8 @@ static int imx_drm_bind(struct device *dev)
>  	int ret;
>  
>  	drm = drm_dev_alloc(&imx_drm_driver, dev);
> -	if (!drm)
> -		return -ENOMEM;
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
>  
>  	imxdrm = devm_kzalloc(dev, sizeof(*imxdrm), GFP_KERNEL);
>  	if (!imxdrm) {

Applied, thanks.

regards
Philipp

