From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 14 Jan 2007 12:49:40 +0000
Subject: Re: [KJ] deprecated stuff and spin locks
Message-Id: <Pine.LNX.4.64.0701140748230.13354@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701140637380.13030@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701140637380.13030@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 14 Jan 2007, Alexey Dobriyan wrote:

> On Sun, Jan 14, 2007 at 06:51:35AM -0500, Robert P. J. Day wrote:
> >   from Documentation/spinlocks.txt:
> > ============> > "Macros SPIN_LOCK_UNLOCKED and RW_LOCK_UNLOCKED are deprecated and
> > will be removed soon. So for any new code dynamic initialization
> > should be used:
...
> >   what do you do with static initializations like:
> >
> >   static struct irq_desc bad_irq_desc = {
> >         .handle_irq = handle_bad_irq,
> >         .lock = SPIN_LOCK_UNLOCKED
> >   };
> >
> > or
> >
> >   static spinlock_t winbond_lock = SPIN_LOCK_UNLOCKED;
> >
> > if you're not supposed to use that macro anymore?  am i missing
> > something obvious?
>
> Well, there're almost 1500 examples in the tree.

i know.  but if the documentation insists that all those invocations
will be removed someday, *somebody* better have an idea of what
they're all going to be replaced with.  :-)

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
