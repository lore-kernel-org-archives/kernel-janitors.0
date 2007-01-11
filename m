From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 11 Jan 2007 06:44:30 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <Pine.LNX.4.64.0701110143300.12547@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 11 Jan 2007, Jaco Kroon wrote:

> Robert P. J. Day wrote:
> > On Thu, 11 Jan 2007, Darren Jenkins wrote:
> >
> >
> >>also was thinking we should add
> >>
> >>static inline unsigned long round_down_to_power_of_2(unsigned long i)
> >>{
> >>
> >>+     i &= ~(i>>1);    ????
> >>   while (i & (i - 1))
> >>       i &= (i - 1);
> >>
> >>   return i;
> >>}
> >>
> >>which follows from my eirlier idea.
> >
> >
> > sorry, what was the rationale for that extra line up there?
>
> It presumably gets rids of a few zeros.  Take for example 11111 as
> input.  The first line will actually get the right answer off the
> bat as it'll mask out the bottom 4 bits.  However, with something
> like 11011 it'll leave us with 10010 which will again at the very
> least reduce the number of iterations through the loop.  In this
> case one iteration vs three.
>
> I saw a similar idea for the round-up case where we actually test if
> we don't already have a power of two, shift-left by one and and with
> ~i (which is then essentially the exact same of what happens above).
> Whilst it took me a few minutes to just convince myself that the
> orriginal algorithms even work (one of those jewel cases) these
> enhancements are pretty impressive and make mathematical sense.
>
> For reference, here is the round-up "initialisation" statement:
>
>     i = (i & (i-1)) ? ((i<<1) & ~i) : i )

ok, i'll have to look at that for a few minutes to satisfy myself that
it's correct.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
