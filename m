From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 18 Jan 2020 13:34:27 +0000
Subject: Re: [PATCH v2] iio: accel: bma400: prevent setting accel scale too low
Message-Id: <20200118133427.07a665f6@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200115181717.GA22797@nessie>
        <20200116100829.thq77nvyqtasdu4j@kili.mountain>
In-Reply-To: <20200116100829.thq77nvyqtasdu4j@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dan Robertson <dan@dlrobertson.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 16 Jan 2020 13:08:29 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This puts an upper bound on "val2" but it also needs to have a lower
> bound (BMA400_SCALE_MIN).
> 
> Fixes: 465c811f1f20 ("iio: accel: Add driver for the BMA400")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to the togreg branch of iio.git and pushed out as testing.
Hopefully I'll sneak in a pull request to get this lined up for
the merge window.

Thanks,

Jonathan

> ---
> v2: the first version just capped it at zero but it should be
>     BMA400_SCALE_MIN (38357).
> 
>  drivers/iio/accel/bma400_core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/bma400_core.c b/drivers/iio/accel/bma400_core.c
> index ab4a158b35af..cc77f89c048b 100644
> --- a/drivers/iio/accel/bma400_core.c
> +++ b/drivers/iio/accel/bma400_core.c
> @@ -752,7 +752,8 @@ static int bma400_write_raw(struct iio_dev *indio_dev,
>  		mutex_unlock(&data->mutex);
>  		return ret;
>  	case IIO_CHAN_INFO_SCALE:
> -		if (val != 0 || val2 > BMA400_SCALE_MAX)
> +		if (val != 0 ||
> +		    val2 < BMA400_SCALE_MIN || val2 > BMA400_SCALE_MAX)
>  			return -EINVAL;
>  
>  		mutex_lock(&data->mutex);
