From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 21 Apr 2018 16:07:54 +0000
Subject: Re: [PATCH 18/61] iio: common: cros_ec_sensors: simplify getting .drvdata
Message-Id: <20180421170754.4f3ab554@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
        <20180419140641.27926-19-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-19-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org

On Thu, 19 Apr 2018 16:05:48 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Applied, thanks.

Jonathan

> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> index a620eb5ce202..3df6c0e09832 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> @@ -448,8 +448,7 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_core_write);
>  
>  static int __maybe_unused cros_ec_sensors_prepare(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
>  	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
>  
>  	if (st->curr_sampl_freq = 0)
> @@ -471,8 +470,7 @@ static int __maybe_unused cros_ec_sensors_prepare(struct device *dev)
>  
>  static void __maybe_unused cros_ec_sensors_complete(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
>  	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
>  
>  	if (st->curr_sampl_freq = 0)

