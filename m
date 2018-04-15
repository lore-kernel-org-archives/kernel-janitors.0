From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 15 Apr 2018 19:19:04 +0000
Subject: Re: [PATCH v2 2/2] iio: sca3000: Handle errors returned by 'sca3000_configure_ring()' in 'sca3000_pr
Message-Id: <20180415201904.37142f8b@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180408194415.18399-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180408194415.18399-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, nfarnesi4@gmail.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun,  8 Apr 2018 21:44:15 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'sca3000_configure_ring()' can fail, so test its return value and
> propagate it if needed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.  Thanks,

Jonathan

> ---
> Same as v1
> ---
>  drivers/iio/accel/sca3000.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
> index 562f125235db..4dceb75e3586 100644
> --- a/drivers/iio/accel/sca3000.c
> +++ b/drivers/iio/accel/sca3000.c
> @@ -1481,7 +1481,9 @@ static int sca3000_probe(struct spi_device *spi)
>  	}
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  
> -	sca3000_configure_ring(indio_dev);
> +	ret = sca3000_configure_ring(indio_dev);
> +	if (ret)
> +		return ret;
>  
>  	if (spi->irq) {
>  		ret = request_threaded_irq(spi->irq,

