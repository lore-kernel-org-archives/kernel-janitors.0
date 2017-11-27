From: Logan Gunthorpe <logang@deltatee.com>
Date: Mon, 27 Nov 2017 04:00:36 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <355029d1-48f5-095e-0d99-bb726d2d56e5@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
 <alpine.DEB.2.20.1711260648130.2387@hadrien>
 <1511676085.20482.18.camel@perches.com>
 <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
 <1511735382.20482.27.camel@perches.com>
In-Reply-To: <1511735382.20482.27.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On 26/11/17 03:29 PM, Joe Perches wrote:
> This proposal has a very high false positive rate.

The only actual false positive you've pointed out is the one that is
just incorrect in the wrong way (the author should have used a KERN_CONT
but did not). I could easily do something similar to what Julia proposes
and produce a different warning if the string ends in a space. But I
don't see any bullet proof way for any script to deduce what the author
actually meant.

> Keep at it though.
> Maybe something useful will be produced with more effort.

Unless there's more actually constructive criticism I don't think I'll
be getting any further with this.

Logan
