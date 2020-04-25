From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 25 Apr 2020 17:01:10 +0000
Subject: Re: [PATCH][next] iio: adc: ad7476: remove redundant null check on an array
Message-Id: <20200425180110.3ffa5696@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200424130419.22940-1-colin.king@canonical.com>
        <f2c6d3f3f8f884e87f1c9895fe99b77e8f4c1e3e.camel@analog.com>
In-Reply-To: <f2c6d3f3f8f884e87f1c9895fe99b77e8f4c1e3e.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Cc: "lars@metafoo.de" <lars@metafoo.de>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "Bogdan, Dragos" <Dragos.Bogdan@analog.com>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "colin.king@canonical.com" <colin.king@canonical.com>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, 24 Apr 2020 15:01:26 +0000
"Ardelean, Alexandru" <alexandru.Ardelean@analog.com> wrote:

> On Fri, 2020-04-24 at 14:04 +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The null check on st->chip_info->convst_channel is redundant because
> > convst_channel is a 2 element array of struct iio_chan_spec objects
> > and this can never be null. Fix this by removing the null check.
> >   
> 
> Reviewed-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
Applied to the togreg branch of iio.git and pushed out as testing.
I didn't take this as a fix as it's not doing any harm in the meantime
whilst this patch goes the slow route.

Thanks,

Jonathan

> 
> > Addresses-Coverity: ("Array compared against 0")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/iio/adc/ad7476.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/ad7476.c b/drivers/iio/adc/ad7476.c
> > index e9984a38fc4c..4e816d714ad2 100644
> > --- a/drivers/iio/adc/ad7476.c
> > +++ b/drivers/iio/adc/ad7476.c
> > @@ -309,7 +309,7 @@ static int ad7476_probe(struct spi_device *spi)
> >  	indio_dev->num_channels = 2;
> >  	indio_dev->info = &ad7476_info;
> >  
> > -	if (st->convst_gpio && st->chip_info->convst_channel)
> > +	if (st->convst_gpio)
> >  		indio_dev->channels = st->chip_info->convst_channel;
> >  	/* Setup default message */
> >    
