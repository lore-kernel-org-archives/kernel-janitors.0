From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 16 Mar 2007 10:34:19 +0000
Subject: Re: [KJ] module.h versus moduleparam.h
Message-Id: <Pine.LNX.4.64.0703160624340.26564@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703142027100.7167@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0703142027100.7167@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 16 Mar 2007, Anupam Kapoor wrote:

> On 3/15/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> >
> >
> >   i've summarized my thoughts on the moduleparam.h header file issue
> > here:
> >
> > http://fsdev.net/wiki/index.php?title=Moduleparam.h
> >
> >   any thoughts?
>
>
> how about talking to individual driver maintainers for doing
> picewise cleanups ? the assumption here being that the bulk of
> changes need to be applied to drivers.

but before starting any cleanup, we first have to establish that
there's any cleanup to be *done*.  even if the current situation is
totally chaotic, one can also say, "hey, it's working, don't mess with
it," and it may be that that's the right thing to do.

but as you can read at that wiki page, there's definite confusion on
the part of lots of developers as to what they have to include in
terms of header files to use module parameters.  if you decide to
separate those two header files (which is quite easy to do), then you
can see that there are 576 source files (under drivers/) that will
suddenly fail to compile since they make use of module parameters but
won't be including the contents of moduleparam.h anymore.  ouch.

so, first things first -- what *should* the situation be?  any
opinions?

rday

p.s.  from that wiki page, you can also see that there appear to be 42
source files (again, just under drivers/) that include moduleparam.h
for no reason whatever.  so, regardless of what the final decision is,
*those* files should be cleanable.

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
