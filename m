From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 14 May 2007 21:44:05 +0000
Subject: Re: [KJ] what's the current story on cli()/sti()/save_flags() ...?
Message-Id: <20070514144405.d82f60c2.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705141556360.15521@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705141556360.15521@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 14 May 2007 17:19:32 -0400 (EDT) Robert P. J. Day wrote:

> On Mon, 14 May 2007, Francois Romieu wrote:
> 
> > Robert P. J. Day <rpjday@mindspring.com> :
> > [...]
> > > but there's still a fair bit of that stuff in the kernel source tree.
> > > the file Documentation/spinlocks.txt also talks about replacing:
> > >
> > >         unsigned long flags;
> > >
> > >         save_flags(flags); cli();
> > >          ... critical section ...
> > >         restore_flags(flags);
> > >
> > > with something like:
> > >
> > >    spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;
> >
> > It should probably use spin_lock_init() instead.
> 
> yeah, i realize that, i was just copying and pasting from the Doc
> file which still refers to the old-style spinlocks.
> 
> > [...]
> > > so, theoretically, what's the goal WRT to those allegedly
> > > deprecated routines?  are they supposed to be gone by now or what?
> >
> > They ought to be gone in driver (non-platform) code. Consider serial
> > drivers a bit special and check the archives of the l-k if you want
> > to hack them.
> 
> just running
> 
>   $ grep -r "cli();" drivers
> 
> shows a fair bit of that stuff left, but some of it is in drivers that
> i think have been given up on.  in any event, there's still lots left,
> but i'm not about to run out and start removing it.  i was just
> curious.

It's usually not a simple (or rote) transformation.
People have tried doing that and had their patches rejected.

I expect that cli et al will stay with us for awhile because very
few people with the skills to make the changes also have hardware
where they can be tested (and they don't care about these very much
either).


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
