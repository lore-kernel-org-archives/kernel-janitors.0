From: Jonathan Cameron <jonathan.cameron@huawei.com>
Date: Mon, 07 Oct 2019 09:21:07 +0000
Subject: Re: [PATCH] iio: imu: adis16480: clean up a condition
Message-Id: <20191007102107.000067b6@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190926081016.GA2332@mwanda>
        <9e40c550310d6f30e6481329e01061beb474bc33.camel@analog.com>
        <20190926113630.GF27389@kadam>
        <20191006095133.24fb89be@archlinux>
        <20191006181439.GU22609@kadam>
In-Reply-To: <20191006181439.GU22609@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>, "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>, "lars@metafoo.de" <lars@metafoo.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>

On Sun, 6 Oct 2019 21:14:40 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Sun, Oct 06, 2019 at 09:51:33AM +0100, Jonathan Cameron wrote:
> > On Thu, 26 Sep 2019 14:36:30 +0300
> > Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >   
> > > On Thu, Sep 26, 2019 at 11:06:39AM +0000, Ardelean, Alexandru wrote:  
> > > > On Thu, 2019-09-26 at 11:10 +0300, Dan Carpenter wrote:    
> > > > > [External]
> > > > > 
> > > > > The "t" variable is unsigned so it can't be less than zero.  We really
> > > > > are just trying to prevent divide by zero bugs so just checking against
> > > > > zero is sufficient.  
> > 
> > I'm not sure that true.  It if were signed we'd be detecting that the
> > input from userspace was negative.  
> 
> It does a really bad job of that though so it raises more questions than
> answers.  Maybe just one of the parameters is negative or maybe the
> multiply or the addition overflowed?  Should scenarios those be checked?
> 
> It turns out none of those situations matter, only divide by zero needs
> to be checked.

It isn't being nearly paranoid enough. Either val or val2 being
negative is a reason to fault out.  Divide by zero needs handling after
that.  Obviously divide by zero is the only one that causes a crash but
negatives are going to cause rather 'unexpected' results.

What fun.

Jonathan
