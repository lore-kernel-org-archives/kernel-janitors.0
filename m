From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 21 Oct 2018 14:45:03 +0000
Subject: Re: [PATCH][V2] iio: adc: ina2xx: add in early -EINVAL returns in case statements
Message-Id: <20181021154503.5141163f@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181016161418.29213-1-colin.king@canonical.com>
        <3078823.PklSZE2rHu@pebbles>
In-Reply-To: <3078823.PklSZE2rHu@pebbles>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Stefan =?UTF-8?B?QnLDvG5z?= <stefan.bruens@rwth-aachen.de>
Cc: Colin King <colin.king@canonical.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 16 Oct 2018 20:26:57 +0200
Stefan Brüns <stefan.bruens@rwth-aachen.de> wrote:

> On Dienstag, 16. Oktober 2018 18:14:18 CEST Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Static analysis with CoverityScan is throwing warnings that specific
> > case statements are missing breaks.  Rather than adding breaks, add
> > return -EINVAL to the specific case statements to clarify the
> > error return paths. Fix also saves 50 bytes.
> > 
> > Before:
> >    text	   data	    bss	    dec	    hex	filename
> >   21418	   4936	    128	  26482	   6772	drivers/iio/adc/ina2xx-adc.o
> > 
> > After:
> >   dec	    hex	filename
> >   21370	   4936	    128	  26434	   6742	drivers/iio/adc/ina2xx-adc.o
> > 
> > (gcc 8.2, x86-64)
> > 
> > Detected by CoverityScan, CID#1462408 ("Missing break in switch")
> > 
> > ---
> > 
> > V2: use returns instead of break statements to keep with the
> > current style used in the switch statement.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>  
> 
> Reviewed-by: Stefan Brüns <stefan.bruens@rwth-aachen.de>

Thanks, and applied to the togreg branch of iio.git and pushed
out as testing for the autobuilders to play with it.

Note however that I was confused when there appeared to be no sign off
in the patch from Colin after applying.  It ended up below an
additional cut line so git am dropped it.

All fixed up now.

Thanks,

Jonathan

> 
> > ---
> >  drivers/iio/adc/ina2xx-adc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
> > index d1239624187d..bdd7cba6f6b0 100644
> > --- a/drivers/iio/adc/ina2xx-adc.c
> > +++ b/drivers/iio/adc/ina2xx-adc.c
> > @@ -250,6 +250,7 @@ static int ina2xx_read_raw(struct iio_dev *indio_dev,
> >  			*val2 = chip->shunt_resistor_uohm;
> >  			return IIO_VAL_FRACTIONAL;
> >  		}
> > +		return -EINVAL;
> > 
> >  	case IIO_CHAN_INFO_HARDWAREGAIN:
> >  		switch (chan->address) {
> > @@ -262,6 +263,7 @@ static int ina2xx_read_raw(struct iio_dev *indio_dev,
> >  			*val = chip->range_vbus == 32 ? 1 : 2;
> >  			return IIO_VAL_INT;
> >  		}
> > +		return -EINVAL;
> >  	}
> > 
> >  	return -EINVAL;  
> 
> 
