From: Jonathan Cameron <jic23@kernel.org>
Date: Wed, 26 Apr 2017 06:25:24 +0000
Subject: Re: [PATCH] iio: adc: Max9611: checking for ERR_PTR instead of NULL in probe
Message-Id: <1c0a27bd-7de6-aa02-189d-7d3fb2343b06@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170420102618.z6xqguj5rnob67if@mwanda>
In-Reply-To: <20170420102618.z6xqguj5rnob67if@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 20/04/17 11:26, Dan Carpenter wrote:
> devm_iio_device_alloc() doesn't return ERR_PTRs, it returns NULLs.
> 
> Fixes: 69780a3bbc0b ("iio: adc: Add Maxim max9611 ADC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Applied to the fixes-togreg branch of iio.git.  Will get this to
Greg soon after the merge window closes.

Thanks,

Jonathan
> diff --git a/drivers/iio/adc/max9611.c b/drivers/iio/adc/max9611.c
> index ec82106480e1..dc3869bf3248 100644
> --- a/drivers/iio/adc/max9611.c
> +++ b/drivers/iio/adc/max9611.c
> @@ -536,8 +536,8 @@ static int max9611_probe(struct i2c_client *client,
>  	int ret;
>  
>  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*max9611));
> -	if (IS_ERR(indio_dev))
> -		return PTR_ERR(indio_dev);
> +	if (!indio_dev)
> +		return -ENOMEM;
>  
>  	i2c_set_clientdata(client, indio_dev);
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

