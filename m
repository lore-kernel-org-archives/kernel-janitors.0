From: "David Laight" <David.Laight@ACULAB.COM>
Date: Wed, 10 Oct 2012 14:59:00 +0000
Subject: RE: [patch] isdn: fix a wrapping bug in isdn_ppp_ioctl()
Message-Id: <AE90C24D6B3A694183C094C60CF0A2F6026B7033@saturn3.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121010093816.GA3669@elgon.mountain> <1349864358.2386.27.camel@joe-AO722> <m21uh67csy.fsf@igel.home> <1349874007.2386.42.camel@joe-AO722> <m2sj9m5sz5.fsf@igel.home> <1349880119.2386.46.camel@joe-AO722>
In-Reply-To: <1349880119.2386.46.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Andreas Schwab <schwab@linux-m68k.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Masanari Iida <standby24x7@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



> -----Original Message-----
> From: netdev-owner@vger.kernel.org [mailto:netdev-owner@vger.kernel.org] On Behalf Of Joe Perches
> Sent: 10 October 2012 15:42
> To: Andreas Schwab
> Cc: Dan Carpenter; Karsten Keil; David S. Miller; Masanari Iida; netdev@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: Re: [patch] isdn: fix a wrapping bug in isdn_ppp_ioctl()
> 
> On Wed, 2012-10-10 at 15:58 +0200, Andreas Schwab wrote:
> > Sorry, I was misremembering the history of the bit ops.  There has
> > historically been issues with varying bit order, but noadays set_bit is
> > always defined consistently with C shifts.
> 
> No worries.  Anyway, the change was suggested to aid
> reader comprehension.  If it doesn't (and it seems not)
> then it's not worth it.
> 
> Anyway, there is still the open question of an overrun/info
> leak.
> 
> > > -           if ((r = set_arg(argp, protos, 8 * sizeof(long))))
> 
> set_arg's 2nd arg is bytes not bits.

Seems to me the code is expecting 256 bits of data, not any multiple of int,
long or anything else.

	David



