From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 14 May 2017 15:22:02 +0000
Subject: Re: [PATCH] iio: adc: ti_am335x_adc: allocating too much in probe
Message-Id: <217724b6-7331-dc10-61eb-05ce489ae375@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170510055109.i2aql4xg4rovcqmw@mwanda>
In-Reply-To: <20170510055109.i2aql4xg4rovcqmw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Andrew F. Davis" <afd@ti.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Vignesh R <vigneshr@ti.com>, Mugunthan V N <mugunthanvnm@ti.com>, Lee Jones <lee.jones@linaro.org>, Michael Engl <michael.engl@wjw-solutions.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/05/17 06:51, Dan Carpenter wrote:
> We should be allocating enough information for a tiadc_device struct
> which is about 400 bytes but instead we allocate enough for a second
> iio_dev struct which is over 2000 bytes.
> 
> Fixes: fea89e2dfcea ("iio: adc: ti_am335x_adc: use variable names for sizeof() operator")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Applied to the fixes-togreg branch of iio.git.

Thanks,

Jonathan
> 
> diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_adc.c
> index 4282ceca3d8f..6cbed7eb118a 100644
> --- a/drivers/iio/adc/ti_am335x_adc.c
> +++ b/drivers/iio/adc/ti_am335x_adc.c
> @@ -614,7 +614,7 @@ static int tiadc_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> -	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*indio_dev));
> +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*adc_dev));
>   	if (indio_dev = NULL) {
>   		dev_err(&pdev->dev, "failed to allocate iio device\n");
>   		return -ENOMEM;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

