From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 05 Apr 2020 11:59:48 +0000
Subject: Re: [PATCH][next] iio: dac: ad5770r: fix off-by-one check on maximum number of channels
Message-Id: <20200405125948.76aa343a@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200403125838.71271-1-colin.king@canonical.com>
        <84628ce3f18d1a1ab50f76d04386dbef46f151b3.camel@analog.com>
In-Reply-To: <84628ce3f18d1a1ab50f76d04386dbef46f151b3.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Cc: "stefan.popa@analog.com" <stefan.popa@analog.com>, "Tachici, Alexandru" <Alexandru.Tachici@analog.com>, "Caprioru, Mircea" <Mircea.Caprioru@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "colin.king@canonical.com" <colin.king@canonical.com>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "lars@metafoo.de" <lars@metafoo.de>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, 3 Apr 2020 13:26:00 +0000
"Ardelean, Alexandru" <alexandru.Ardelean@analog.com> wrote:

> On Fri, 2020-04-03 at 13:58 +0100, Colin King wrote:
> > [External]
> > 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently there is an off-by-one check on the number of channels that
> > will cause an arry overrun in array st->output_mode when calling the
> > function d5770r_store_output_range. Fix this by using >= rather than >
> > to check for maximum number of channels.
> >   
> 
> Reviewed-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> 
> > Addresses-Coverity: ("Out-of-bounds access")
> > Fixes: cbbb819837f6 ("iio: dac: ad5770r: Add AD5770R support")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to the fixes-togreg branch of iio.git.

thanks

Jonathan

> > ---
> >  drivers/iio/dac/ad5770r.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/dac/ad5770r.c b/drivers/iio/dac/ad5770r.c
> > index a98ea76732e7..2d7623b9b2c0 100644
> > --- a/drivers/iio/dac/ad5770r.c
> > +++ b/drivers/iio/dac/ad5770r.c
> > @@ -525,7 +525,7 @@ static int ad5770r_channel_config(struct ad5770r_state
> > *st)
> >  		ret = fwnode_property_read_u32(child, "num", &num);
> >  		if (ret)
> >  			return ret;
> > -		if (num > AD5770R_MAX_CHANNELS)
> > +		if (num >= AD5770R_MAX_CHANNELS)
> >  			return -EINVAL;
> >  
> >  		ret = fwnode_property_read_u32_array(child,  
