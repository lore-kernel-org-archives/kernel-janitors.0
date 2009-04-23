From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 23 Apr 2009 20:24:11 +0000
Subject: Re: is there a "single_bit_set" macro somewhere?
Message-Id: <alpine.LFD.2.00.0904231618210.5753@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.2.00.0904231307160.12567@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.0904231307160.12567@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 23 Apr 2009, Julia Lawall wrote:

> On Thu, 23 Apr 2009, Robert P. J. Day wrote:
>
> > On Thu, 23 Apr 2009, Julia Lawall wrote:
> >
> > > I found 8 occurrences with the following Coccinelle semantic match:
> > >
> > > @@ expression n; @@
> > >
> > > * (n & (n-1)) = 0
> > >
> > >
> > > The most unpleasant was:
> > >
> > > (!(((fp)->ipend & ~0x30) & (((fp)->ipend & ~0x30) - 1)))
> > >
> > > in the file arch/blackfin/kernel/traps.c.
> > >
> > > At least some of them seemed to have comments nearby that suggested
> > > that searching for a single 1-bit was indeed the goal.  I haven't
> > > looked at all of them, though.
> >
> >   behold, the power of shell and REs, which searches for four
> > variations of that test:
>
> Actually, it seems that it was specifying = 0 that was not really
> necessary.  Perhaps the possibility of parentheses is useful too.
>
> With the following semantic patch, I find 93 occurrences.
>
> @@ expression n; @@
>
> * (n) & ((n)-1)
>
> That could indeed be worth doing something about, if they are indeed all
> representing a check for a single bit.

  they're not.  we're actually now discussing this on the main LKML,
but that construct -- n & (n - 1) -- has two semantic meanings:

  a) power of two?
  b) single bit set?

  mathematically, those two things have the same form but
*semantically* they're read very differently, which is why i'm
proposing to add a simple function or two for single-bit testing that
would make a lot of the code easier to read.

rday
--

====================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Linked In:                             http://www.linkedin.com/in/rpjday
Twitter:                                       http://twitter.com/rpjday
====================================
