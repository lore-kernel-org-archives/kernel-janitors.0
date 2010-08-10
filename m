From: Jonathan Cameron <jic23@cam.ac.uk>
Date: Tue, 10 Aug 2010 09:40:50 +0000
Subject: Re: [patch 2/2] Staging: iio: unlock on error paths
Message-Id: <4C611EA2.4040006@cam.ac.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100810054005.GP9031@bicker>
In-Reply-To: <20100810054005.GP9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/10/10 06:40, Dan Carpenter wrote:
> hmc5843_set_operating_mode() and set_range() didn't unlock on error
> paths.
> 
> Also in hmc5843_set_operating_mode() it wasn't clear if we should return
> "status", "error" or "count" so I changed it all to return "ret" and
> then for consistency I did the same for set_range().
> 
> I also changed it to propagate the error codes from lower levels instead
> of simply returning -EINVAL for everything.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
NAK.  Julia Lawall beat you to it.
http://lkml.org/lkml/2010/8/4/408

Thanks anyway.

Jonathan
> 
> diff --git a/drivers/staging/iio/magnetometer/hmc5843.c b/drivers/staging/iio/magnetometer/hmc5843.c
> index 3d3bac4..7c52038 100644
> --- a/drivers/staging/iio/magnetometer/hmc5843.c
> +++ b/drivers/staging/iio/magnetometer/hmc5843.c
> @@ -216,26 +216,28 @@ static ssize_t hmc5843_set_operating_mode(struct device *dev,
>  	struct hmc5843_data *data = indio_dev->dev_data;
>  	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
>  	unsigned long operating_mode = 0;
> -	s32 status;
> -	int error;
> +	ssize_t ret = 0;
> +
>  	mutex_lock(&data->lock);
> -	error = strict_strtoul(buf, 10, &operating_mode);
> -	if (error)
> -		return error;
> +	ret = strict_strtoul(buf, 10, &operating_mode);
> +	if (ret)
> +		goto exit;
>  	dev_dbg(dev, "set Conversion mode to %lu\n", operating_mode);
> -	if (operating_mode > MODE_SLEEP)
> -			return -EINVAL;
> +	if (operating_mode > MODE_SLEEP) {
> +		ret = -EINVAL;
> +		goto exit;
> +	}
>  
> -	status = i2c_smbus_write_byte_data(client, this_attr->address,
> +	ret = i2c_smbus_write_byte_data(client, this_attr->address,
>  					operating_mode);
> -	if (status) {
> -		count = -EINVAL;
> +	if (ret)
>  		goto exit;
> -	}
>  	data->operating_mode = operating_mode;
>  
>  exit:
>  	mutex_unlock(&data->lock);
> +	if (!ret)
> +		ret = count;
>  	return count;
>  }
>  static IIO_DEVICE_ATTR(operating_mode,
> @@ -434,24 +436,27 @@ static ssize_t set_range(struct device *dev,
>  	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
>  	struct hmc5843_data *data = indio_dev->dev_data;
>  	unsigned long range = 0;
> -	int error;
> +	ssize_t ret;
> +
>  	mutex_lock(&data->lock);
> -	error = strict_strtoul(buf, 10, &range);
> -	if (error)
> -		return error;
> +	ret = strict_strtoul(buf, 10, &range);
> +	if (ret)
> +		goto exit;
>  	dev_dbg(dev, "set range to %lu\n", range);
> -
> -	if (range > RANGE_6_5)
> -		return -EINVAL;
> +	if (range > RANGE_6_5) {
> +		ret = -EINVAL;
> +		goto exit;
> +	}
>  
>  	data->range = range;
>  	range = range << RANGE_GAIN_OFFSET;
> -	if (i2c_smbus_write_byte_data(client, this_attr->address, range))
> -		count = -EINVAL;
> +	ret = i2c_smbus_write_byte_data(client, this_attr->address, range);
>  
> +exit:
>  	mutex_unlock(&data->lock);
> -	return count;
> -
> +	if (!ret)
> +		ret = count;
> +	return ret;
>  }
>  static IIO_DEVICE_ATTR(magn_range,
>  			S_IWUSR | S_IRUGO,

