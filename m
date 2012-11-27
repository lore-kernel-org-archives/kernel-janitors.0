From: Lars-Peter Clausen <lars@metafoo.de>
Date: Tue, 27 Nov 2012 18:40:46 +0000
Subject: Re: [patch] iio:gyro: adis16136: divide by zero in write_frequency()
Message-Id: <50B5092E.7060103@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121127072452.GA8239@elgon.mountain>
In-Reply-To: <20121127072452.GA8239@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/27/2012 08:24 AM, Dan Carpenter wrote:
> It's slightly cleaner to use kstrtouint() because we pass unsigned ints
> to adis16136_set_freq().  On 64 bit systems, if the user passed LONG_MIN
> then it we would get past the test against zero but crash in
> adis16136_set_freq() because we truncate the high bits away.
> 
> 

Thanks,

Acked-By: Lars-Peter Clausen <lars@metafoo.de>

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/iio/gyro/adis16136.c b/drivers/iio/gyro/adis16136.c
> index 05486df..b4ee339 100644
> --- a/drivers/iio/gyro/adis16136.c
> +++ b/drivers/iio/gyro/adis16136.c
> @@ -203,10 +203,10 @@ static ssize_t adis16136_write_frequency(struct device *dev,
>  {
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct adis16136 *adis16136 = iio_priv(indio_dev);
> -	long val;
> +	unsigned int val;
>  	int ret;
>  
> -	ret = kstrtol(buf, 10, &val);
> +	ret = kstrtouint(buf, 10, &val);
>  	if (ret)
>  		return ret;
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

