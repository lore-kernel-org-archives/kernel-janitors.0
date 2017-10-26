From: Jonathan Cameron <jic23@kernel.org>
Date: Thu, 26 Oct 2017 16:21:18 +0000
Subject: Re: [PATCH] iio/pressure/mpl3115: Improve unlocking of a mutex in mpl3115_trigger_handler()
Message-Id: <20171026172118.6343072c@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b93264eb-3d22-46dc-fe0a-538fbe9e600f@users.sourceforge.net>
In-Reply-To: <b93264eb-3d22-46dc-fe0a-538fbe9e600f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, 26 Oct 2017 16:23:45 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 26 Oct 2017 16:10:46 +0200
> 
> Adjust jump targets so that a call of the function "mutex_unlock" is stored
> at the end of this function implementation.
> Replace three calls by goto statements.
> 
> This issue was detected by using the Coccinelle software.
> 

Markus,

I would suggest only sending on patch like this out at a time in order
to see if there are issues with the approach before you waste your time
generating lots of them.

This has the same issue as in one of the earlier patches.  The resulting
code is harder to read offsetting any gains by unlocking in one place.

Jonathan

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/iio/pressure/mpl3115.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3115.c
> index 7537547fb7ee..f39e6f42a9c0 100644
> --- a/drivers/iio/pressure/mpl3115.c
> +++ b/drivers/iio/pressure/mpl3115.c
> @@ -152,38 +152,36 @@ static irqreturn_t mpl3115_trigger_handler(int irq, void *p)
>  
>  	mutex_lock(&data->lock);
>  	ret = mpl3115_request(data);
> -	if (ret < 0) {
> -		mutex_unlock(&data->lock);
> -		goto done;
> -	}
> +	if (ret < 0)
> +		goto unlock;
>  
>  	memset(buffer, 0, sizeof(buffer));
>  	if (test_bit(0, indio_dev->active_scan_mask)) {
>  		ret = i2c_smbus_read_i2c_block_data(data->client,
>  			MPL3115_OUT_PRESS, 3, &buffer[pos]);
> -		if (ret < 0) {
> -			mutex_unlock(&data->lock);
> -			goto done;
> -		}
> +		if (ret < 0)
> +			goto unlock;
> +
>  		pos += 4;
>  	}
>  
>  	if (test_bit(1, indio_dev->active_scan_mask)) {
>  		ret = i2c_smbus_read_i2c_block_data(data->client,
>  			MPL3115_OUT_TEMP, 2, &buffer[pos]);
> -		if (ret < 0) {
> -			mutex_unlock(&data->lock);
> -			goto done;
> -		}
> +		if (ret < 0)
> +			goto unlock;
>  	}
>  	mutex_unlock(&data->lock);
>  
>  	iio_push_to_buffers_with_timestamp(indio_dev, buffer,
>  		iio_get_time_ns(indio_dev));
> -
> -done:
> +notify_trigger:
>  	iio_trigger_notify_done(indio_dev->trig);
>  	return IRQ_HANDLED;
> +
> +unlock:

Absolutely not.  This is much less readable than the original.

> +	mutex_unlock(&data->lock);
> +	goto notify_trigger;

>  }
>  
>  static const struct iio_chan_spec mpl3115_channels[] = {

