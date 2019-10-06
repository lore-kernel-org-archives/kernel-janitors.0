From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 06 Oct 2019 08:51:33 +0000
Subject: Re: [PATCH] iio: imu: adis16480: clean up a condition
Message-Id: <20191006095133.24fb89be@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190926081016.GA2332@mwanda>
        <9e40c550310d6f30e6481329e01061beb474bc33.camel@analog.com>
        <20190926113630.GF27389@kadam>
In-Reply-To: <20190926113630.GF27389@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>, "lars@metafoo.de" <lars@metafoo.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>

On Thu, 26 Sep 2019 14:36:30 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Thu, Sep 26, 2019 at 11:06:39AM +0000, Ardelean, Alexandru wrote:
> > On Thu, 2019-09-26 at 11:10 +0300, Dan Carpenter wrote:  
> > > [External]
> > > 
> > > The "t" variable is unsigned so it can't be less than zero.  We really
> > > are just trying to prevent divide by zero bugs so just checking against
> > > zero is sufficient.

I'm not sure that true.  It if were signed we'd be detecting that the
input from userspace was negative.  That is clearly garbage for a frequency
control..  I'll hazard a guess that it was intended to catch that
as well as the divide by 0 case. 

This would be clearer if we first checked that val and val2 are both not
negative, then did the zero test on t.

If people agree, anyone want to spin a patch to do that?

Thanks,

Jonathan

> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/iio/imu/adis16480.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
> > > index b99d73887c9f..e144e567675d 100644
> > > --- a/drivers/iio/imu/adis16480.c
> > > +++ b/drivers/iio/imu/adis16480.c
> > > @@ -318,7 +318,7 @@ static int adis16480_set_freq(struct iio_dev
> > > *indio_dev, int val, int val2)
> > >  	unsigned int t, reg;  
> > 
> > I would just change the type of "t" to "int".
> > Especially, since "val" & "val2" are "int".
> >   
> 
> Yeah, but negatives or high values are basically fine.  We only care
> zero.
> 
> regards,
> dan carpenter
> 
