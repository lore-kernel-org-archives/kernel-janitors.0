From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 25 Apr 2020 16:54:58 +0000
Subject: Re: [PATCH] iio: dac: ad5593r: Fix a typo in MODULE_DESCRIPTION
Message-Id: <20200425175458.4ba655e0@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200425065653.31203-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200425065653.31203-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, stefan.popa@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 25 Apr 2020 08:56:53 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> This module is related to AD5593R, not AD5592R.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Applied.

Thanks,

Jonathan

> ---
>  drivers/iio/dac/ad5593r.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/dac/ad5593r.c b/drivers/iio/dac/ad5593r.c
> index 44ea3b8117d0..1fbe9c019c7f 100644
> --- a/drivers/iio/dac/ad5593r.c
> +++ b/drivers/iio/dac/ad5593r.c
> @@ -134,5 +134,5 @@ static struct i2c_driver ad5593r_driver = {
>  module_i2c_driver(ad5593r_driver);
>  
>  MODULE_AUTHOR("Paul Cercueil <paul.cercueil@analog.com>");
> -MODULE_DESCRIPTION("Analog Devices AD5592R multi-channel converters");
> +MODULE_DESCRIPTION("Analog Devices AD5593R multi-channel converters");
>  MODULE_LICENSE("GPL v2");
