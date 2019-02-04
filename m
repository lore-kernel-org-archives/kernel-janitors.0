From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Feb 2019 07:48:20 +0000
Subject: Re: [PATCH] staging: comedi: dt2811: fix integer overflow in multiply
Message-Id: <20190204074820.GC2581@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190202215916.25753-1-colin.king@canonical.com>
 <20190203112904.GA2563@kadam>
In-Reply-To: <20190203112904.GA2563@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Feb 03, 2019 at 02:29:04PM +0300, Dan Carpenter wrote:
> > diff --git a/drivers/staging/comedi/drivers/dt2811.c b/drivers/staging/comedi/drivers/dt2811.c
> > index 05207a519755..820e75f850ff 100644
> > --- a/drivers/staging/comedi/drivers/dt2811.c
> > +++ b/drivers/staging/comedi/drivers/dt2811.c
> > @@ -323,7 +323,8 @@ static unsigned int dt2811_ns_to_timer(unsigned int *nanosec,
> >  		for (_mult = 0; _mult <= 7; _mult++) {
> >  			unsigned int div = dt2811_clk_dividers[_div];
> >  			unsigned int mult = dt2811_clk_multipliers[_mult];
> > -			unsigned long long divider = div * mult;
> > +			unsigned long long divider > > +				(unsigned long long)div * mult;
> 
> The max "div" can be is 12.  The max "mult" can be is 10,000,000.  So
> this is a false positive because there is no overflow.  The code is not
> complicated.  Unfortunately, Smatch has the exact same problem...

Smatch actually parses this correctly, but I had a power failure over
the weekend that messed up my results.

regards,
dan carpenter
