From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 18 Aug 2019 17:55:44 +0000
Subject: Re: [PATCH] iio: dac: ad5380: fix incorrect assignment to val
Message-Id: <20190818185544.66c32add@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815115846.21800-1-colin.king@canonical.com>
        <876a4d5190828619f75365863cc6bf2cfea4ffea.camel@analog.com>
In-Reply-To: <876a4d5190828619f75365863cc6bf2cfea4ffea.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Cc: "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "colin.king@canonical.com" <colin.king@canonical.com>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "lars@metafoo.de" <lars@metafoo.de>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, 16 Aug 2019 06:16:26 +0000
"Ardelean, Alexandru" <alexandru.Ardelean@analog.com> wrote:

> On Thu, 2019-08-15 at 12:58 +0100, Colin King wrote:
> > [External]
> >   
> 
> Reviewed-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
Applied to the fixes-togreg branch of iio.git.

Thanks,

Jonathan

> 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the pointer val is being incorrectly incremented
> > instead of the value pointed to by val. Fix this by adding
> > in the missing * indirection operator.
> > 
> > Addresses-Coverity: ("Unused value")
> > Fixes: c03f2c536818 ("staging:iio:dac: Add AD5380 driver")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/iio/dac/ad5380.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/dac/ad5380.c b/drivers/iio/dac/ad5380.c
> > index 4335214800d2..2ebe08326048 100644
> > --- a/drivers/iio/dac/ad5380.c
> > +++ b/drivers/iio/dac/ad5380.c
> > @@ -220,7 +220,7 @@ static int ad5380_read_raw(struct iio_dev *indio_dev,
> >  		if (ret)
> >  			return ret;
> >  		*val >>= chan->scan_type.shift;
> > -		val -= (1 << chan->scan_type.realbits) / 2;
> > +		*val -= (1 << chan->scan_type.realbits) / 2;
> >  		return IIO_VAL_INT;
> >  	case IIO_CHAN_INFO_SCALE:
> >  		*val = 2 * st->vref;  
