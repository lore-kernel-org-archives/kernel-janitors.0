From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 21 Apr 2018 16:10:59 +0000
Subject: Re: [PATCH 48/61] staging: iio: adc: simplify getting .drvdata
Message-Id: <20180421171059.5ea717aa@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
        <20180419140641.27926-49-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-49-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org

On Thu, 19 Apr 2018 16:06:18 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Applied, thanks,

Jonathan

> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/staging/iio/adc/ad7606_par.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7606_par.c b/drivers/staging/iio/adc/ad7606_par.c
> index 3eb6f8f312dd..a34c2a1d5373 100644
> --- a/drivers/staging/iio/adc/ad7606_par.c
> +++ b/drivers/staging/iio/adc/ad7606_par.c
> @@ -18,8 +18,7 @@
>  static int ad7606_par16_read_block(struct device *dev,
>  				   int count, void *buf)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
>  	struct ad7606_state *st = iio_priv(indio_dev);
>  
>  	insw((unsigned long)st->base_address, buf, count);
> @@ -34,8 +33,7 @@ static const struct ad7606_bus_ops ad7606_par16_bops = {
>  static int ad7606_par8_read_block(struct device *dev,
>  				  int count, void *buf)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
>  	struct ad7606_state *st = iio_priv(indio_dev);
>  
>  	insb((unsigned long)st->base_address, buf, count * 2);

