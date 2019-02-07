From: Dan Murphy <dmurphy@ti.com>
Date: Thu, 07 Feb 2019 13:14:00 +0000
Subject: Re: [PATCH] iio: adc: ads124s08: fix spelling mistake "converions" -> "conversions"
Message-Id: <e083e2af-a00d-fb1f-a860-26c369ac5932@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190207093902.7081-1-colin.king@canonical.com>
In-Reply-To: <20190207093902.7081-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin

Thanks for the patch

On 2/7/19 3:39 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in several dev_err messages. Fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/iio/adc/ti-ads124s08.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads124s08.c b/drivers/iio/adc/ti-ads124s08.c
> index c2cf58908fc8..53f17e4f2f23 100644
> --- a/drivers/iio/adc/ti-ads124s08.c
> +++ b/drivers/iio/adc/ti-ads124s08.c
> @@ -232,7 +232,7 @@ static int ads124s_read_raw(struct iio_dev *indio_dev,
>  
>  		ret = ads124s_write_cmd(indio_dev, ADS124S08_START_CONV);
>  		if (ret) {
> -			dev_err(&priv->spi->dev, "Start converions failed\n");
> +			dev_err(&priv->spi->dev, "Start conversions failed\n");
>  			goto out;
>  		}
>  
> @@ -246,7 +246,7 @@ static int ads124s_read_raw(struct iio_dev *indio_dev,
>  
>  		ret = ads124s_write_cmd(indio_dev, ADS124S08_STOP_CONV);
>  		if (ret) {
> -			dev_err(&priv->spi->dev, "Stop converions failed\n");
> +			dev_err(&priv->spi->dev, "Stop conversions failed\n");
>  			goto out;
>  		}
>  
> @@ -283,12 +283,12 @@ static irqreturn_t ads124s_trigger_handler(int irq, void *p)
>  
>  		ret = ads124s_write_cmd(indio_dev, ADS124S08_START_CONV);
>  		if (ret)
> -			dev_err(&priv->spi->dev, "Start ADC converions failed\n");
> +			dev_err(&priv->spi->dev, "Start ADC conversions failed\n");
>  
>  		buffer[j] = ads124s_read(indio_dev, scan_index);
>  		ret = ads124s_write_cmd(indio_dev, ADS124S08_STOP_CONV);
>  		if (ret)
> -			dev_err(&priv->spi->dev, "Stop ADC converions failed\n");
> +			dev_err(&priv->spi->dev, "Stop ADC conversions failed\n");
>  
>  		j++;
>  	}
> 

Acked-by: Dan Murphy <dmurphy@ti.com>

-- 
------------------
Dan Murphy
