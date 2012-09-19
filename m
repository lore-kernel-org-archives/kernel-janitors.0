From: Lars-Peter Clausen <lars@metafoo.de>
Date: Wed, 19 Sep 2012 17:08:05 +0000
Subject: Re: [patch] iio: dac/ad5755: signedness bug in ad5755_setup_pdata()
Message-Id: <5059FBF5.7070703@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120919062700.GA28864@elgon.mountain>
In-Reply-To: <20120919062700.GA28864@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/19/2012 08:27 AM, Dan Carpenter wrote:
> We need "ret" to be signed for the error handling to work correctly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks,

Acked-by: Lars-Peter Clausen <lars@metafoo.de>

> 
> diff --git a/drivers/iio/dac/ad5755.c b/drivers/iio/dac/ad5755.c
> index e6dbe5f..5db3506 100644
> --- a/drivers/iio/dac/ad5755.c
> +++ b/drivers/iio/dac/ad5755.c
> @@ -451,9 +451,9 @@ static int __devinit ad5755_setup_pdata(struct iio_dev *indio_dev,
>  	const struct ad5755_platform_data *pdata)
>  {
>  	struct ad5755_state *st = iio_priv(indio_dev);
> -	unsigned int ret;
>  	unsigned int val;
>  	unsigned int i;
> +	int ret;
>  
>  	if (pdata->dc_dc_phase > AD5755_DC_DC_PHASE_90_DEGREE ||
>  		pdata->dc_dc_freq > AD5755_DC_DC_FREQ_650kHZ ||
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

