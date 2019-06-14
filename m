From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 14 Jun 2019 09:27:47 +0000
Subject: Re: [Cocci] [PATCH] drivers: Inline code in devm_platform_ioremap_resource() from two functions
Message-Id: <alpine.DEB.2.20.1906141127030.9068@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
 <alpine.DEB.2.21.1906081925090.2543@hadrien>
 <7b4fe770-dadd-80ba-2ba4-0f2bc90984ef@web.de>
 <f573b2d3-11d0-92b5-f8ab-4c4b6493e152@metux.net>
 <032e347f-e575-c89c-fa62-473d52232735@web.de>
In-Reply-To: <032e347f-e575-c89c-fa62-473d52232735@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr



On Fri, 14 Jun 2019, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 14 Jun 2019 11:05:33 +0200
>
> Two function calls were combined in this function implementation.
> Inline corresponding code so that extra error checks can be avoided here.

I don't see any point to this at all.  By inlining the code, you have
created a clone, which will introduce extra work to maintain in the
future.

julia


>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/base/platform.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 4d1729853d1a..baadca72f949 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -80,8 +80,8 @@ struct resource *platform_get_resource(struct platform_device *dev,
>  EXPORT_SYMBOL_GPL(platform_get_resource);
>
>  /**
> - * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
> - *				    device
> + * devm_platform_ioremap_resource
> + * Achieve devm_ioremap_resource() functionality for a platform device
>   *
>   * @pdev: platform device to use both for memory resource lookup as well as
>   *        resource management
> @@ -91,10 +91,39 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
>  void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
>  					     unsigned int index)
>  {
> -	struct resource *res;
> +	u32 i;
>
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
> -	return devm_ioremap_resource(&pdev->dev, res);
> +	for (i = 0; i < pdev->num_resources; i++) {
> +		struct resource *res = &pdev->resource[i];
> +
> +		if (resource_type(res) = IORESOURCE_MEM && index-- = 0) {
> +			struct device *dev = &pdev->dev;
> +			resource_size_t size = resource_size(res);
> +			void __iomem *dest;
> +
> +			if (!devm_request_mem_region(dev,
> +						     res->start,
> +						     size,
> +						     dev_name(dev))) {
> +				dev_err(dev,
> +					"can't request region for resource %pR\n",
> +					res);
> +				return IOMEM_ERR_PTR(-EBUSY);
> +			}
> +
> +			dest = devm_ioremap(dev, res->start, size);
> +			if (!dest) {
> +				dev_err(dev,
> +					"ioremap failed for resource %pR\n",
> +					res);
> +				devm_release_mem_region(dev, res->start, size);
> +				dest = IOMEM_ERR_PTR(-ENOMEM);
> +			}
> +
> +			return dest;
> +		}
> +	}
> +	return IOMEM_ERR_PTR(-EINVAL);
>  }
>  EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
>  #endif /* CONFIG_HAS_IOMEM */
> --
> 2.22.0
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
