From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Feb 2007 11:56:01 +0000
Subject: Re: [KJ] anyone interested in the "power of 2" stuff?
Message-Id: <Pine.LNX.4.64.0702130632400.4141@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702081713530.5222@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0702081713530.5222@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 13 Feb 2007, Vignesh Babu BM wrote:

>
> On Tue, 2007-02-13 at 04:46 -0500, Robert P. J. Day wrote:
> > On Tue, 13 Feb 2007, Vignesh Babu BM wrote:
> >
> > >
> > > I have a doubt:
> > > There are instances as follows:
> > >
> > > if(!iobase_reg && !is_power_of_2(iobase_reg))
> > > ---where we are checking for 0 at 2 places-both inside and outside of
> > > is_power_of_2
> > >
> > > But the n & (n-1) is just one step.
> > > Is this not more optimised?
> > >
> > > What would you suggest here?
> >
>
> > and while that might seem *superficially* almost the same thing,
> > semantically it's quite different.
> Agreed.
>
> >
> > it might be worth defining a macro:
> >
> >   #define at_most_one_bit_set(n)      ((n) & ((n) - 1))
> >
> > thoughts?
> >
> > rday
> >
>
> There are around 80 instances of code similar to the above. So
> instead of a macro why not do an inline function? And btw where
> would it go?

sorry, i meant an inline function -- force of habit.  but let's not
rush into anything.  for now, just work on those tests that *clearly*
represent power-of-two tests, and nothing else.

so even if you find a test of the form "n & (n - 1)", depending on the
context, the coder might really have meant it to not include zero.
conversely, if you find a test of the form "n != 0 && (n & (n - 1))",
even though that's *exactly* our power-of-two test, it's possible the
coder might have been testing for exactly one bit being set.  (those
tests are, obviously, identical, but semantically, they have different
meanings.)

so, for now, just submit patches for what are *clearly* power-of-two
tests and leave the rest alone.  those can be handled later by a more
appropriate inline function that better represents their semantic
meaning.

rday

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
