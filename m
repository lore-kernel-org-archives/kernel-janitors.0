From: Lars-Peter Clausen <lars@metafoo.de>
Date: Wed, 24 Oct 2012 08:22:52 +0000
Subject: Re: [patch] iio:dac:ad5449: unlock on error path
Message-Id: <5087A55C.6010202@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121024071307.GC2536@elgon.mountain>
In-Reply-To: <20121024071307.GC2536@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/24/2012 09:13 AM, Dan Carpenter wrote:
> There is an unlock missing on this error path.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks,

Acked-by: Lars-Peter Clausen <lars@metafoo.de>

> ---
> Only needed in linux-next.
> 
> diff --git a/drivers/iio/dac/ad5449.c b/drivers/iio/dac/ad5449.c
> index 5b43030..0ee6f8e 100644
> --- a/drivers/iio/dac/ad5449.c
> +++ b/drivers/iio/dac/ad5449.c
> @@ -124,12 +124,13 @@ static int ad5449_read(struct iio_dev *indio_dev, unsigned int addr,
>  
>  	ret = spi_sync(st->spi, &msg);
>  	if (ret < 0)
> -		return ret;
> +		goto out_unlock;
>  
>  	*val = be16_to_cpu(st->data[1]);
> -	mutex_unlock(&indio_dev->mlock);
>  
> -	return 0;
> +out_unlock:
> +	mutex_unlock(&indio_dev->mlock);
> +	return ret;
>  }
>  
>  static int ad5449_read_raw(struct iio_dev *indio_dev,
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

