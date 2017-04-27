From: Jonathan Cameron <jic23@kernel.org>
Date: Thu, 27 Apr 2017 06:21:09 +0000
Subject: Re: [PATCH] iio: adc: mxs-lradc: Checking IS_ERR() instead of NULL
Message-Id: <13f3bcd0-c6c8-7abc-d732-91a19618f5a5@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170426210349.sjmf65ck5awfgz22@mwanda>
In-Reply-To: <20170426210349.sjmf65ck5awfgz22@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>, Marek Vasut <marex@denx.de>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 26/04/17 22:03, Dan Carpenter wrote:
> devm_ioremap() returns NULL on error.  It doesn't return error pointers.
> 
> Fixes: 6dd112b9f85e ("iio: adc: mxs-lradc: Add support for ADC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Hi Dan,

Already another patch for this under review.  Open question there is whether
devm_ioremap_resource is the way to go instead.

Jonathan
> diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
> index b0c7d8ee5cb8..493e2a26415d 100644
> --- a/drivers/iio/adc/mxs-lradc-adc.c
> +++ b/drivers/iio/adc/mxs-lradc-adc.c
> @@ -719,8 +719,8 @@ static int mxs_lradc_adc_probe(struct platform_device *pdev)
>  
>  	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	adc->base = devm_ioremap(dev, iores->start, resource_size(iores));
> -	if (IS_ERR(adc->base))
> -		return PTR_ERR(adc->base);
> +	if (!adc->base)
> +		return -ENOMEM;
>  
>  	init_completion(&adc->completion);
>  	spin_lock_init(&adc->lock);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

