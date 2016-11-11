From: Lars-Peter Clausen <lars@metafoo.de>
Date: Fri, 11 Nov 2016 13:50:18 +0000
Subject: Re: [patch] iio:adc: ad7766: testing the wrong variable in probe
Message-Id: <62d0bc7e-45ca-6106-ace7-d33193bf49cb@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161110193018.GB32533@mwanda>
In-Reply-To: <20161110193018.GB32533@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/10/2016 08:30 PM, Dan Carpenter wrote:
> We should be testing "ret" here.
> 
> Fixes: aa16c6bd0e09 ("iio:adc: Add support for AD7766/AD7767")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Lars-Peter Clausen <lars@metafoo.de>

Thanks.

> 
> diff --git a/drivers/iio/adc/ad7766.c b/drivers/iio/adc/ad7766.c
> index d906686..75cca42 100644
> --- a/drivers/iio/adc/ad7766.c
> +++ b/drivers/iio/adc/ad7766.c
> @@ -239,8 +239,8 @@ static int ad7766_probe(struct spi_device *spi)
>  
>  	ret = devm_regulator_bulk_get(&spi->dev, ARRAY_SIZE(ad7766->reg),
>  		ad7766->reg);
> -	if (IS_ERR(ad7766->reg))
> -		return PTR_ERR(ad7766->reg);
> +	if (ret)
> +		return ret;
>  
>  	ad7766->pd_gpio = devm_gpiod_get_optional(&spi->dev, "powerdown",
>  		GPIOD_OUT_HIGH);
> 

