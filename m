From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 10 Nov 2019 11:48:23 +0000
Subject: Re: [PATCH] iio: temperature: ltc2983: fix u32 read into a unsigned long long
Message-Id: <20191110114823.2bbe87b0@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191105202818.90065-1-colin.king@canonical.com>
        <dab9cfd93e6affa5d94f078154c3e181303bbf47.camel@analog.com>
In-Reply-To: <dab9cfd93e6affa5d94f078154c3e181303bbf47.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Sa, Nuno" <Nuno.Sa@analog.com>
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "colin.king@canonical.com" <colin.king@canonical.com>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "lars@metafoo.de" <lars@metafoo.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 6 Nov 2019 14:19:52 +0000
"Sa, Nuno" <Nuno.Sa@analog.com> wrote:

> On Tue, 2019-11-05 at 20:28 +0000, Colin King wrote:
> > 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the read of temp using of_property_read_u32_index is
> > reading
> > a u32 value into a unsigned long long.  This relies on machine
> > endianness
> > to work correctly, so fix this by reading a u32 value and setting
> > temp
> > to this value.
> > 
> > Addresses-Coverity: ("Reliance on integer endianness")
> > Fixes: f110f3188e56 ("iio: temperature: Add support for LTC2983")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/iio/temperature/ltc2983.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iio/temperature/ltc2983.c
> > b/drivers/iio/temperature/ltc2983.c
> > index ddf47023364b..d39c0d6b77f1 100644
> > --- a/drivers/iio/temperature/ltc2983.c
> > +++ b/drivers/iio/temperature/ltc2983.c
> > @@ -444,8 +444,10 @@ static struct ltc2983_custom_sensor
> > *__ltc2983_custom_sensor_new(
> >  			else
> >  				temp = __convert_to_raw(temp,
> > resolution);
> >  		} else {
> > -			of_property_read_u32_index(np, propname, index,
> > -						   (u32 *)&temp);
> > +			u32 t32;
> > +
> > +			of_property_read_u32_index(np, propname, index,
> > &t32);
> > +			temp = t32;
> >  		}
> >  
> >  		for (j = 0; j < n_size; j++)  
> 
> Acked-by: Nuno Sá <nuno.sa@analog.com>
> 

A slight complexity around this one. I'm not sure I'll have time for a pull
before the merge window (as Greg will only take them to about 1 week before
that opens so we get some exposure in Linux next).

As a result I'll have to sit on this one until Linus comments on rc7, probably
later today.  Otherwise it'll be material for stable post release.

If I seem to have lost it give me a poke and we'll make sure it goes into 
an early rc instead of at the merge window.

Thanks,

Jonathan

> Thanks,
> Nuno Sá
