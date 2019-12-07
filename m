From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 07 Dec 2019 11:01:57 +0000
Subject: Re: [PATCH] iio: adc: ti-ads7950: Fix a typo in an error message
Message-Id: <20191207110157.35dd39eb@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204064535.13025-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191204064535.13025-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, justinpopo6@gmail.com, linus.walleij@linaro.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed,  4 Dec 2019 07:45:35 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Fix a typo:
>    s/get get/to get/
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Applied,

Thanks,

Jonathan

> ---
>  drivers/iio/adc/ti-ads7950.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> index 2e66e4d586ff..f9edc1207f75 100644
> --- a/drivers/iio/adc/ti-ads7950.c
> +++ b/drivers/iio/adc/ti-ads7950.c
> @@ -602,7 +602,7 @@ static int ti_ads7950_probe(struct spi_device *spi)
>  
>  	st->reg = devm_regulator_get(&spi->dev, "vref");
>  	if (IS_ERR(st->reg)) {
> -		dev_err(&spi->dev, "Failed get get regulator \"vref\"\n");
> +		dev_err(&spi->dev, "Failed to get regulator \"vref\"\n");
>  		ret = PTR_ERR(st->reg);
>  		goto error_destroy_mutex;
>  	}
