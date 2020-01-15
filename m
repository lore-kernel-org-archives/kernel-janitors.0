From: Dan Robertson <dan@dlrobertson.com>
Date: Wed, 15 Jan 2020 18:17:17 +0000
Subject: Re: [PATCH] iio: accel: bma400: integer underflow setting accel scale
Message-Id: <20200115181717.GA22797@nessie>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200115174531.p623ukjibn6kg6zz@kili.mountain>
In-Reply-To: <20200115174531.p623ukjibn6kg6zz@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 15, 2020 at 08:45:31PM +0300, Dan Carpenter wrote:
> We put an upper bound on "val2" but we also need to prevent negative
> values.
> 
> Fixes: 465c811f1f20 ("iio: accel: Add driver for the BMA400")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/iio/accel/bma400_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/bma400_core.c b/drivers/iio/accel/bma400_core.c
> index ab4a158b35af..ffc7b146bbfc 100644
> --- a/drivers/iio/accel/bma400_core.c
> +++ b/drivers/iio/accel/bma400_core.c
> @@ -752,7 +752,7 @@ static int bma400_write_raw(struct iio_dev *indio_dev,
>  		mutex_unlock(&data->mutex);
>  		return ret;
>  	case IIO_CHAN_INFO_SCALE:
> -		if (val != 0 || val2 > BMA400_SCALE_MAX)
> +		if (val != 0 || val2 < 0 || val2 > BMA400_SCALE_MAX)

AFAIK if val2 is less than BMA400_SCALE_MIN we should return -EINVAL.

Cheers,

 -Dan
