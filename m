From: Hartmut Knaack <knaack.h@gmx.de>
Date: Wed, 30 Apr 2014 20:37:01 +0000
Subject: Re: [patch] staging: iio: ad799x: cleanup probe error handling
Message-Id: <53615EED.8040600@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140430100822.GC20713@mwanda>
In-Reply-To: <20140430100822.GC20713@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Aida Mynzhasova <ai.c.c0der@gmail.com>, Masanari Iida <standby24x7@gmail.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter schrieb:
> My static checker is upset that we check IS_ERR(t->reg) when we know it
> is not an ERR_PTR().  The code is harmless but I have cleaned it up and
> removed the condition.
Good spot. But doesn't that also apply to the two checks in ad799x_remove()?
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
> index 16a8b14..5c95cd9 100644
> --- a/drivers/iio/adc/ad799x.c
> +++ b/drivers/iio/adc/ad799x.c
> @@ -717,7 +717,7 @@ static int ad799x_probe(struct i2c_client *client,
>  	ret = iio_triggered_buffer_setup(indio_dev, NULL,
>  		&ad799x_trigger_handler, NULL);
>  	if (ret)
> -		goto error_disable_reg;
> +		goto error_disable_vref;
>  
>  	if (client->irq > 0) {
>  		ret = devm_request_threaded_irq(&client->dev,
> @@ -739,11 +739,10 @@ static int ad799x_probe(struct i2c_client *client,
>  
>  error_cleanup_ring:
>  	iio_triggered_buffer_cleanup(indio_dev);
> +error_disable_vref:
> +	regulator_disable(st->vref);
>  error_disable_reg:
> -	if (!IS_ERR(st->vref))
> -		regulator_disable(st->vref);
> -	if (!IS_ERR(st->reg))
> -		regulator_disable(st->reg);
> +	regulator_disable(st->reg);
>  
>  	return ret;
>  }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

