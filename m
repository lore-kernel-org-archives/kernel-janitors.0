From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 15 Apr 2018 19:17:55 +0000
Subject: Re: [PATCH v2 1/2] iio: sca3000: Fix an error handling path in 'sca3000_probe()'
Message-Id: <20180415201755.62a73e7d@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180408194401.18348-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180408194401.18348-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, nfarnesi4@gmail.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun,  8 Apr 2018 21:44:01 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Use 'devm_iio_kfifo_allocate()' instead of 'iio_kfifo_allocate()' in order
> to simplify code and avoid a memory leak in an error path in
> 'sca3000_probe()'. A call to 'sca3000_unconfigure_ring()' was missing.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

I thought about queueing this up as a fix, but as it is unlikely
to be hit and there is another patch (which isn't a fix) dependent
on it I went with the worst of both worlds and took it for the next
merge window whilst marking it for stable.

I added a note to the description to say why for when people see
it next cycle

Thanks,

Jonathan

> ---
> v2: Use a devm_ function to fix the leak reported in v1.
>     This makes 'sca3000_unconfigure_ring()' useless and simplify code.
> ---
>  drivers/iio/accel/sca3000.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
> index f33dadf7b262..562f125235db 100644
> --- a/drivers/iio/accel/sca3000.c
> +++ b/drivers/iio/accel/sca3000.c
> @@ -1277,7 +1277,7 @@ static int sca3000_configure_ring(struct iio_dev *indio_dev)
>  {
>  	struct iio_buffer *buffer;
>  
> -	buffer = iio_kfifo_allocate();
> +	buffer = devm_iio_kfifo_allocate(&indio_dev->dev);
>  	if (!buffer)
>  		return -ENOMEM;
>  
> @@ -1287,11 +1287,6 @@ static int sca3000_configure_ring(struct iio_dev *indio_dev)
>  	return 0;
>  }
>  
> -static void sca3000_unconfigure_ring(struct iio_dev *indio_dev)
> -{
> -	iio_kfifo_free(indio_dev->buffer);
> -}
> -
>  static inline
>  int __sca3000_hw_ring_state_set(struct iio_dev *indio_dev, bool state)
>  {
> @@ -1546,8 +1541,6 @@ static int sca3000_remove(struct spi_device *spi)
>  	if (spi->irq)
>  		free_irq(spi->irq, indio_dev);
>  
> -	sca3000_unconfigure_ring(indio_dev);
> -
>  	return 0;
>  }
>  

