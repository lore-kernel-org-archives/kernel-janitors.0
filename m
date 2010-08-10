From: Jonathan Cameron <jic23@cam.ac.uk>
Date: Tue, 10 Aug 2010 09:40:00 +0000
Subject: Re: [patch 1/2] Staging: iio: signedness bug
Message-Id: <4C611E70.5030902@cam.ac.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100810053733.GO9031@bicker>
In-Reply-To: <20100810053733.GO9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/10/10 06:37, Dan Carpenter wrote:
> i2c_smbus_read_byte_data() returns an s32 type.  We need to change
> "rate" to signed for the error handling to work.
> 
> Also I changed it to propogate the error code instead of just returning
> -EINVAL.  Other error codes could be -EAGAIN for example.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Jonathan Cameron <jic23@cam.ac.uk>

Thanks
> 
> diff --git a/drivers/staging/iio/magnetometer/hmc5843.c b/drivers/staging/iio/magnetometer/hmc5843.c
> index 92f6c6f..3d3bac4 100644
> --- a/drivers/staging/iio/magnetometer/hmc5843.c
> +++ b/drivers/staging/iio/magnetometer/hmc5843.c
> @@ -385,11 +385,11 @@ static ssize_t show_sampling_frequency(struct device *dev,
>  	struct iio_dev *indio_dev = dev_get_drvdata(dev);
>  	struct i2c_client *client = to_i2c_client(indio_dev->dev.parent);
>  	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
> -	u32 rate;
> +	s32 rate;
>  
>  	rate = i2c_smbus_read_byte_data(client,  this_attr->address);
>  	if (rate < 0)
> -		return -EINVAL;
> +		return rate;
>  	rate = (rate & RATE_BITMASK) >> RATE_OFFSET;
>  	return sprintf(buf, "%s\n", regval_to_samp_freq[rate]);
>  }

