From: Jonathan Cameron <jic23@kernel.org>
Date: Wed, 20 Feb 2019 10:51:17 +0000
Subject: Re: [PATCH -next] iio: adc: ingenic: remove redundant dev_err call in ingenic_adc_probe()
Message-Id: <20190220105117.40104d25@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218065735.159915-1-weiyongjun1@huawei.com>
In-Reply-To: <20190218065735.159915-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Artur Rojek <contact@artur-rojek.eu>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 18 Feb 2019 06:57:35 +0000
Wei Yongjun <weiyongjun1@huawei.com> wrote:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Fixes: 1a78daea107d ("IIO: add Ingenic JZ47xx ADC driver.")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Hi

The patch is good, but the fixes tag is too strong.  We don't want
the noise of backporting the dropping of an overly verbose bit
of error printing. It's not doing any harm, just not doing any
good either!  So, let us keep this as low priority tidy up.

Applied to the togreg branch of iio.git with that tag dropped.

Thanks,

Jonathan
> ---
>  drivers/iio/adc/ingenic-adc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
> index 6ee1673deb0d..8f9c125939a8 100644
> --- a/drivers/iio/adc/ingenic-adc.c
> +++ b/drivers/iio/adc/ingenic-adc.c
> @@ -302,10 +302,8 @@ static int ingenic_adc_probe(struct platform_device *pdev)
>  
>  	mem_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	adc->base = devm_ioremap_resource(dev, mem_base);
> -	if (IS_ERR(adc->base)) {
> -		dev_err(dev, "Unable to ioremap mmio resource\n");
> +	if (IS_ERR(adc->base))
>  		return PTR_ERR(adc->base);
> -	}
>  
>  	adc->clk = devm_clk_get(dev, "adc");
>  	if (IS_ERR(adc->clk)) {
> 
> 
> 
