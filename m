From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 05 Feb 2007 18:05:44 +0000
Subject: Re: [KJ] so ... when are all the pending patches unleashed?
Message-Id: <20070205100544.fbe3b98e.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 5 Feb 2007 12:59:08 -0500 (EST) Robert P. J. Day wrote:

> On Mon, 5 Feb 2007, Randy Dunlap wrote:
> 
> > On Mon, 5 Feb 2007 12:21:26 -0500 (EST) Robert P. J. Day wrote:
> >
> > > On Mon, 5 Feb 2007, Randy Dunlap wrote:
> > >
> > > > And lastly, the schedule for everyone to send non-bug-fixes is
> > > > "within 2 weeks of the 2.6.20 announcement" AFAIK.
> > >
> > > that's what i'd heard.  so what this means is that, now that
> > > 2.6.20 is out, there's a 2-week window to try to ram in all of the
> > > non-bugfix related cleanup that we've discussing to get it into
> > > 2.6.21, is that right?
> >
> > Yes, and it won't all go in at one time.  Having it spread out makes
> > bug detection more feasible.
> 
> all right so, not to belabour this but, if i have a patch that i'd
> really like to be applied to this upcoming cycle, and i've submitted
> it, and it doesn't seem to be going anywhere, what's the proper
> procedure to start getting more insistent as that 2-week window starts
> to close so that i don't miss out?

Oh, so this possibly isn't even a KJ patch.  I see.

One element of the proper procedure is to be persistent.

> i'm referring to adding the maturity levels OBSOLETE and DEPRECATED to
> kconfig.  when i first presented that, it seemed to go over well and
> people appeared to like it but, since then ... nothing.

I didn't follow it.  Did any maintainer merge it for testing?
Has it been in -mm for awhile?

> who do i prod when time starts to run out so i don't miss an entire
> release cycle?

Resend it, cc: akpm on it and the kbuild/kconfig people,
include any acks that it received earlier just after your S-O-B...

But if it hasn't been in -mm or some git tree for awhile,
I doubt that it would be merged into the mainline kernel tree
this quickly.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
