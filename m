From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 12 Apr 2020 10:00:28 +0000
Subject: Re: [PATCH] iio: imu: adis: Add a missing '\n' in a log message
Message-Id: <20200412110005.79af5069@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410171224.4633-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200410171224.4633-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alexandru.ardelean@analog.com, lars@metafoo.de, Michael.Hennerich@analog.com, stefan.popa@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 10 Apr 2020 19:12:24 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
> 
> Fixes: 1fd456702692 ("iio: imu: adis: add support product ID check in adis_initial_startup")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Applied thanks,

Jonathan

> ---
>  drivers/iio/imu/adis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/imu/adis.c b/drivers/iio/imu/adis.c
> index a8afd01de4f3..2e7d0d337f8f 100644
> --- a/drivers/iio/imu/adis.c
> +++ b/drivers/iio/imu/adis.c
> @@ -419,7 +419,7 @@ int __adis_initial_startup(struct adis *adis)
>  
>  	if (prod_id != adis->data->prod_id)
>  		dev_warn(&adis->spi->dev,
> -			 "Device ID(%u) and product ID(%u) do not match.",
> +			 "Device ID(%u) and product ID(%u) do not match.\n",
>  			 adis->data->prod_id, prod_id);
>  
>  	return 0;
