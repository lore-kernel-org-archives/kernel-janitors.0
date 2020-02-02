From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 02 Feb 2020 15:53:04 +0000
Subject: Re: [PATCH][V2] iio: ad5755: fix spelling mistake "to" -> "too" and grammar
Message-Id: <20200202155304.5eb84ee8@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200123091954.10506-1-colin.king@canonical.com>
        <aae729269a5ab110fae379f88b72a8cbca6c8b13.camel@analog.com>
In-Reply-To: <aae729269a5ab110fae379f88b72a8cbca6c8b13.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Cc: "zzzzPopa, zzzzStefan Serban" <StefanSerban.Popa@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "colin.king@canonical.com" <colin.king@canonical.com>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "lars@metafoo.de" <lars@metafoo.de>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>

On Thu, 23 Jan 2020 12:16:03 +0000
"Ardelean, Alexandru" <alexandru.Ardelean@analog.com> wrote:

> On Thu, 2020-01-23 at 09:19 +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a spelling mistake and grammar mistake in a dev_err
> > message. Fix it.
> >   
> 
> Reviewed-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>

This crossed with Joe observing there are quite a few other nice little bits
of janitorial work to be done in this driver. 

I merged the two together and fiddled the patch description to cover
the result.  Hope no one minds.  Seemed like it would save everyone
some time rather than asking for a v3.

Shout out if I've messed it up or you would rather I change the
various tags.

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks all,

Jonathan

> > ---
> > V2: fix grammar too, thanks to Alexandru Ardelean for spotting this.
> > ---
> >  drivers/iio/dac/ad5755.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/dac/ad5755.c b/drivers/iio/dac/ad5755.c
> > index b9175fb4c8ab..1359a1a92fdc 100644
> > --- a/drivers/iio/dac/ad5755.c
> > +++ b/drivers/iio/dac/ad5755.c
> > @@ -655,7 +655,7 @@ static struct ad5755_platform_data *ad5755_parse_dt(struct
> > device *dev)
> >  	for_each_child_of_node(np, pp) {
> >  		if (devnr >= AD5755_NUM_CHANNELS) {
> >  			dev_err(dev,
> > -				"There is to many channels defined in DT\n");
> > +				"There are too many channels defined in DT\n");
> >  			goto error_out;
> >  		}
> >    
