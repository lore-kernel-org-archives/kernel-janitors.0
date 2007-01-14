From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 14 Jan 2007 12:55:31 +0000
Subject: Re: [KJ] deprecated stuff and spin locks
Message-Id: <Pine.LNX.4.64.0701140754290.13391@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701140637380.13030@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701140637380.13030@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 14 Jan 2007, Alexey Dobriyan wrote:

> On Sun, Jan 14, 2007 at 06:51:35AM -0500, Robert P. J. Day wrote:

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

well ... matthew whitehead wanted a project. :-)

rday

p.s.  there seem to be a number of potential cleanups that aren't
listed in the current TO DO list.  how does one get extra tasks added
there?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
