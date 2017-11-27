From: Joe Perches <joe@perches.com>
Date: Mon, 27 Nov 2017 17:28:06 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <1511803686.32426.54.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
         <alpine.DEB.2.20.1711260648130.2387@hadrien>
         <1511676085.20482.18.camel@perches.com>
         <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
         <1511735382.20482.27.camel@perches.com>
         <355029d1-48f5-095e-0d99-bb726d2d56e5@deltatee.com>
         <alpine.DEB.2.20.1711270709390.2369@hadrien>
         <ec39f4f5-cfab-a184-0f27-7f0172e2984f@deltatee.com>
         <alpine.DEB.2.20.1711270732550.2369@hadrien>
         <86f3f594-79f7-c2ce-2cc6-f641bd6f55ae@deltatee.com>
         <1511771322.32426.1.camel@perches.com>
         <a0c147a5-a727-0ce8-a0c3-200fe3b17e4a@deltatee.com>
In-Reply-To: <a0c147a5-a727-0ce8-a0c3-200fe3b17e4a@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>

On Mon, 2017-11-27 at 10:20 -0700, Logan Gunthorpe wrote:
> 
> On 27/11/17 01:28 AM, Joe Perches wrote:
> > checkpatch already reports printks without KERN_<level>
> > 
> > # printk should use KERN_* levels
> > 		if ($line =~ /\bprintk\s*\(\s*(?!KERN_[A-Z]+\b)/) {
> > 			WARN("PRINTK_WITHOUT_KERN_LEVEL",
> > 			     "printk() should include KERN_<LEVEL> facility level\n" . $herecurr);
> > 		}
> > 
> 
> Yes, but that kind of misses the mark in a similar way a new line 
> warning misses the mark. Consider:

It doesn't miss any mark.  It simply informs.
Correctness when fixing are a different world of problems.

