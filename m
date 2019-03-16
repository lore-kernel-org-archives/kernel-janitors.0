From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 16 Mar 2019 16:38:01 +0000
Subject: Re: [PATCH] iio: adc: fix indentation issue, remove extra tab
Message-Id: <20190316163801.42dcfabd@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190314232603.30531-1-colin.king@canonical.com>
        <1552641938.13791.2.camel@analog.com>
In-Reply-To: <1552641938.13791.2.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>
Cc: "colin.king@canonical.com" <colin.king@canonical.com>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, 15 Mar 2019 09:25:38 +0000
"Popa, Stefan Serban" <StefanSerban.Popa@analog.com> wrote:

> On Jo, 2019-03-14 at 23:26 +0000, Colin King wrote:
> > [External]
> > 
> > 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > A return statement is indented one level too deeply; clean this
> > up by removing a tab.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>  
> Acked-by: Stefan Popa <stefan.popa@analog.com>
> 
Applied thanks.

Jonathan

> Thanks!
> 
> > ---
> >  drivers/iio/adc/ad7124.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/ad7124.c b/drivers/iio/adc/ad7124.c
> > index 7d5e5311d8de..659ef37d5fe8 100644
> > --- a/drivers/iio/adc/ad7124.c
> > +++ b/drivers/iio/adc/ad7124.c
> > @@ -411,7 +411,7 @@ static int ad7124_init_channel_vref(struct
> > ad7124_state *st,
> >                         dev_err(&st->sd.spi->dev,
> >                                 "Error, trying to use external voltage
> > reference without a %s regulator.\n",
> >                                 ad7124_ref_names[refsel]);
> > -                               return PTR_ERR(st->vref[refsel]);
> > +                       return PTR_ERR(st->vref[refsel]);
> >                 }
> >                 st->channel_config[channel_number].vref_mv =
> >                         regulator_get_voltage(st->vref[refsel]);
> > --
> > 2.20.1
> >  
