From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 27 Nov 2017 06:11:28 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <alpine.DEB.2.20.1711270709390.2369@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com> <alpine.DEB.2.20.1711260648130.2387@hadrien> <1511676085.20482.18.camel@perches.com> <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com> <1511735382.20482.27.camel@perches.com>
 <355029d1-48f5-095e-0d99-bb726d2d56e5@deltatee.com>
In-Reply-To: <355029d1-48f5-095e-0d99-bb726d2d56e5@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On Sun, 26 Nov 2017, Logan Gunthorpe wrote:

>
>
> On 26/11/17 03:29 PM, Joe Perches wrote:
> > This proposal has a very high false positive rate.
>
> The only actual false positive you've pointed out is the one that is
> just incorrect in the wrong way (the author should have used a KERN_CONT
> but did not). I could easily do something similar to what Julia proposes
> and produce a different warning if the string ends in a space.

I don't have a different warning if the string ends in a space.  I have a
different warning when one possible control-flow path is fine and another
control-flow path is not.  The space thing relates to guessing whether
some other printing API function needs a newline or not.

julia

> But I
> don't see any bullet proof way for any script to deduce what the author
> actually meant.
>
> > Keep at it though.
> > Maybe something useful will be produced with more effort.
>
> Unless there's more actually constructive criticism I don't think I'll
> be getting any further with this.
>
> Logan
>
