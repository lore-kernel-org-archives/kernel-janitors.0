From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 10 Oct 2007 09:31:10 +0000
Subject: Re: [PATCH] Add macro to round down to nearest power of two.
Message-Id: <Pine.LNX.4.64.0710100528140.22406@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0708270907270.929@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0708270907270.929@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 10 Oct 2007, Richard Knutsson wrote:

> Robert P. J. Day wrote:
> > On Wed, 5 Sep 2007, vignesh babu wrote:
> >
> >
> > > Resending this...as I did not get the mail thru KJ...
> > >
> > > Robert,
> > >
> > >  Maybe its late, but I would still like to discuss if it is
> > > needed-is_power_of_2 has '2' and not 'two' which I think is
> > > easier to work with. I was hoping that the 2 macros that you
> > > have coded can also be named with a '2' in them than a 'two'.
> > >
> > > There have been many changes that went in already based on these
> > > 2 macros.I have the cleanup patches ready(for log2.h AND all the
> > > changes that went in), but my net at home went down, should be
> > > up in a few hours and so i should be able to mail in the
> > > cleanups in a few hours.
> > >
> > > If you and others feel that the 'two's can be replaced with '2'
> > > then I would push in the patches by tonight.
> > >
> >
> > sorry for the delay in answering this -- i suspect we're stuck
> > with "two" since that's what the existing roundup macro used.
> > does anyone else have a strong opinion on this either way?
> > personally, i would have preferred "2", but it might be too late
> > for that.
> >
> Just grep'ed for 'roundup_pow_of_two' and found only 45 occurrences
> in 27 files (log2.h included), so imho I think it is still possible
> to change this. I would suggest to rename the roundup_pow_of_two()
> and then make a #define to preserve the old name until it been
> cleaned up. (would guess 10-11 patches to clean this up, so if there
> is something else to patch on those subsystems...)

if it's not a drastically disruptive change, i'm certainly in favour
of the simpler variation.  in fact, thinking about it, it would make
sense to make things even more consistent and choose one of "power_of"
or "pow_of" to use uniformly throughout the tree, don't you think?

it's rather silly to have "is_power_of_2" while we have
"roundup_pow_of_2", wouldn't you say?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
