From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 27 Nov 2017 08:52:15 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <alpine.DEB.2.20.1711270951450.3445@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>  <alpine.DEB.2.20.1711260648130.2387@hadrien>  <1511676085.20482.18.camel@perches.com>  <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>  <1511735382.20482.27.camel@perches.com> 
 <355029d1-48f5-095e-0d99-bb726d2d56e5@deltatee.com>  <alpine.DEB.2.20.1711270709390.2369@hadrien>  <ec39f4f5-cfab-a184-0f27-7f0172e2984f@deltatee.com>  <alpine.DEB.2.20.1711270732550.2369@hadrien>  <86f3f594-79f7-c2ce-2cc6-f641bd6f55ae@deltatee.com>
 <1511771322.32426.1.camel@perches.com>
In-Reply-To: <1511771322.32426.1.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Logan Gunthorpe <logang@deltatee.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On Mon, 27 Nov 2017, Joe Perches wrote:

> On Sun, 2017-11-26 at 23:40 -0700, Logan Gunthorpe wrote:
> >
> > On 26/11/17 11:34 PM, Julia Lawall wrote:
> > > It would probably be better not to mention the KERN_CONT possibility at
> > > all.
> >
> > Oh? I don't disagree... but what are we supposed to do in these cases?
> > The way v2 of my patch works it just says that there is a missing new
> > line. But Joe calls that a false positive. So if we can't report that
> > it's missing a new line and we can't say it looks like it needs a
> > KERN_CONT, then what can we do? The case is obviously wrong in some way
> > or another so we probably shouldn't just ignore it.

I meant why not only suggest pr_cont?

julia

>
> checkpatch already reports printks without KERN_<level>
>
> # printk should use KERN_* levels
> 		if ($line =~ /\bprintk\s*\(\s*(?!KERN_[A-Z]+\b)/) {
> 			WARN("PRINTK_WITHOUT_KERN_LEVEL",
> 			     "printk() should include KERN_<LEVEL> facility level\n" . $herecurr);
> 		}
>
>
