From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Date: Wed, 09 Oct 2019 08:57:11 +0000
Subject: Re: drm/komeda: Use devm_platform_ioremap_resource() in komeda_dev_create()
Message-Id: <20191009085704.GA26615@jamwan02-TSP300>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64a6ea39-3e4b-2ebe-74f7-98720e581e3e@web.de>
In-Reply-To: <64a6ea39-3e4b-2ebe-74f7-98720e581e3e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, nd <nd@arm.com>

On Sat, Sep 21, 2019 at 07:50:46PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Sep 2019 19:43:51 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thank you for the patch.

Looks good to me.
Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> --
> 2.23.0
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index ca64a129c594..a387d923962e 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -172,19 +172,12 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
>  	struct platform_device *pdev = to_platform_device(dev);
>  	const struct komeda_product_data *product;
>  	struct komeda_dev *mdev;
> -	struct resource *io_res;
>  	int err = 0;
> 
>  	product = of_device_get_match_data(dev);
>  	if (!product)
>  		return ERR_PTR(-ENODEV);
> 
> -	io_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!io_res) {
> -		DRM_ERROR("No registers defined.\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> -
>  	mdev = devm_kzalloc(dev, sizeof(*mdev), GFP_KERNEL);
>  	if (!mdev)
>  		return ERR_PTR(-ENOMEM);
> @@ -192,7 +185,7 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
>  	mutex_init(&mdev->lock);
> 
>  	mdev->dev = dev;
> -	mdev->reg_base = devm_ioremap_resource(dev, io_res);
> +	mdev->reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mdev->reg_base)) {
>  		DRM_ERROR("Map register space failed.\n");
>  		err = PTR_ERR(mdev->reg_base);
