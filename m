From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 27 Nov 2017 06:40:05 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <alpine.DEB.2.20.1711270738470.2369@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>  <alpine.DEB.2.20.1711260648130.2387@hadrien>  <85bdbab8-8b7e-91a9-7199-a0e39041aef1@deltatee.com>  <alpine.DEB.2.20.1711261807590.2111@hadrien>  <3fc88c02-b9b6-80a3-0c41-63e0806d34aa@deltatee.com> 
 <alpine.DEB.2.20.1711261912150.2111@hadrien> <1511746526.20482.38.camel@perches.com>
In-Reply-To: <1511746526.20482.38.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Logan Gunthorpe <logang@deltatee.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On Sun, 26 Nov 2017, Joe Perches wrote:

> On Sun, 2017-11-26 at 19:17 +0100, Julia Lawall wrote:
> > I just assume that a printk that has no KERN_ is adding a
> > newline, which is my understanding of Joe's comment.
>
> More precisely:
>
> Any printk without an initial KERN_CONT prepends a newline
> if the last printk content char emitted that is not part
> of a printk timestamp/header was not a newline.

Ah, I misunderstood.  I thought it was any printk that has no KERN
indicator at all.  That I can fix.

julia
