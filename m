From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Sep 2019 11:36:30 +0000
Subject: Re: [PATCH] iio: imu: adis16480: clean up a condition
Message-Id: <20190926113630.GF27389@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190926081016.GA2332@mwanda>
 <9e40c550310d6f30e6481329e01061beb474bc33.camel@analog.com>
In-Reply-To: <9e40c550310d6f30e6481329e01061beb474bc33.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Cc: "lars@metafoo.de" <lars@metafoo.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "jic23@kernel.org" <jic23@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>

On Thu, Sep 26, 2019 at 11:06:39AM +0000, Ardelean, Alexandru wrote:
> On Thu, 2019-09-26 at 11:10 +0300, Dan Carpenter wrote:
> > [External]
> > 
> > The "t" variable is unsigned so it can't be less than zero.  We really
> > are just trying to prevent divide by zero bugs so just checking against
> > zero is sufficient.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/iio/imu/adis16480.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
> > index b99d73887c9f..e144e567675d 100644
> > --- a/drivers/iio/imu/adis16480.c
> > +++ b/drivers/iio/imu/adis16480.c
> > @@ -318,7 +318,7 @@ static int adis16480_set_freq(struct iio_dev
> > *indio_dev, int val, int val2)
> >  	unsigned int t, reg;
> 
> I would just change the type of "t" to "int".
> Especially, since "val" & "val2" are "int".
> 

Yeah, but negatives or high values are basically fine.  We only care
zero.

regards,
dan carpenter
