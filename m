From: Joe Perches <joe@perches.com>
Date: Sun, 26 Nov 2017 06:01:25 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <1511676085.20482.18.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
         <alpine.DEB.2.20.1711260648130.2387@hadrien>
In-Reply-To: <alpine.DEB.2.20.1711260648130.2387@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Logan Gunthorpe <logang@deltatee.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>

On Sun, 2017-11-26 at 06:51 +0100, Julia Lawall wrote:
> 
> On Sat, 25 Nov 2017, Logan Gunthorpe wrote:
> 
> > Check for lines with a log function using a relatively strict regular
> > expression catching only printk, dev_* and pr_* functions. Once
> > one is found, accumulate further lines for any functions that
> > are split over multiple lines.
> 
> I don't understand at all the second sentence.  Are you staying with the
> same call, or moving on to other calls?  Also, it would be the call that
> is split over multiple lines, not the function split over multiple lines.
> 
> I think this would have been much easier with Cocccinelle where the code
> is parsed and the control-flow graph is available to see whether there is
> a pr_cont afterwards.  But if it works, then it is surely good enough.

It doesn't really work.

Many of the messages aren't missing newlines.

I only looked a the first few dozen instances, but many of
them aren't really missing newlines, but are now missing a
KERN_CONT annotation.

This is because Linus changed how printk worked awhile
ago in

commit 4bcc595ccd80decb4245096e3d1258989c50ed41
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Oct 8 20:32:40 2016 -0700

printk: reinstate KERN_CONT for printing continuation lines

Most of that commit message is BS, but the net effect is
that now printks must have a KERN_<LEVEL> marker or a
newline is inserted before the format.

Also, this patch logic will be very confused by patch
blocks and not files.

