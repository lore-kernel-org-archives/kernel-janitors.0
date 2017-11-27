From: Joe Perches <joe@perches.com>
Date: Mon, 27 Nov 2017 09:03:21 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <1511773401.32426.21.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
          <alpine.DEB.2.20.1711260648130.2387@hadrien>
          <85bdbab8-8b7e-91a9-7199-a0e39041aef1@deltatee.com>
          <alpine.DEB.2.20.1711261807590.2111@hadrien>
          <3fc88c02-b9b6-80a3-0c41-63e0806d34aa@deltatee.com>
          <alpine.DEB.2.20.1711261912150.2111@hadrien>
         <1511746526.20482.38.camel@perches.com>
         <alpine.DEB.2.20.1711270738470.2369@hadrien>
         <alpine.DEB.2.20.1711270741190.2369@hadrien>
In-Reply-To: <alpine.DEB.2.20.1711270741190.2369@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Logan Gunthorpe <logang@deltatee.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>

On Mon, 2017-11-27 at 07:42 +0100, Julia Lawall wrote:
> On Mon, 27 Nov 2017, Julia Lawall wrote:
> > On Sun, 26 Nov 2017, Joe Perches wrote:
> > > On Sun, 2017-11-26 at 19:17 +0100, Julia Lawall wrote:
> > > > I just assume that a printk that has no KERN_ is adding a
> > > > newline, which is my understanding of Joe's comment.
> > > 
> > > More precisely:
> > > 
> > > Any printk without an initial KERN_CONT prepends a newline
> > > if the last printk content char emitted that is not part
> > > of a printk timestamp/header was not a newline.
> > 
> > Ah, I misunderstood.  I thought it was any printk that has no KERN
> > indicator at all.  That I can fix.
> 
> Although I guess that in that case the whole exercise is pointless?
> Because every print will at runtime be followed by another print, which
> will add either the newline or a continuation.

Kinda yes and no.

A printk without a newline termination is not emitted
as output until the next printk call.

This can cause issues on quiescent systems as the printk
is not emitted for potentially a very long time.

Also, any thread interleaving can still cause misformatted
output.

and:

All the historical printks without KERN_CONT worked well
until the commit that broke them by requiring KERN_CONT.

But now these consecutive calls to printk which used to be
emitted on on a single line are printed on multiple lines.

The title of the commit is wrong as KERN_CONT was not
necessary before this change.
---
commit 4bcc595ccd80decb4245096e3d1258989c50ed41
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Oct 8 20:32:40 2016 -0700

printk: reinstate KERN_CONT for printing continuation lines
---

So IMO it's _somewhat_ useful to try to update the printks
without either
KERN_CONT or with a KERN_<LEVEL> but
without a newline.

As the above commit is about a year old, most of the cases
in the code that are actually likely have been fixed by now.

