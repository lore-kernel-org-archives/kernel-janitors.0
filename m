From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 14 Jan 2007 16:12:58 +0000
Subject: [KJ] [SOLVED] Re:  deprecated stuff and spin locks
Message-Id: <Pine.LNX.4.64.0701141104540.7763@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
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

ok, here's how i see it.  in the numerous cases where you have a spin
lock as part of a structure that is currently being initialized
thusly (eg. from drivers/char/keyboard.c):

struct vt_spawn_console vt_spawn_con = {
        .lock = SPIN_LOCK_UNLOCKED,
        .pid  = NULL,
        .sig  = 0,
};

that will have to be rewritten considerably more awkwardly using the
underlying macro (eg. from drivers/char/random.c):

static struct entropy_store input_pool = {
        .poolinfo = &poolinfo_table[0],
        .name = "input",
        .limit = 1,
        .lock = __SPIN_LOCK_UNLOCKED(&input_pool.lock),
        .pool = input_pool_data
};

  note how, unlike the generic SPIN_LOCK_UNLOCKED macro, the
__SPIN_LOCK_UNLOCKED requires an argument of the address of the spin
lock in question.  yeesh.

  given that there are a number of those invocations in the tree
already:

  $ grep -r __SPIN_LOCK_UNLOCKED *

i have to assume that that represents the new syntax, yes?  can anyone
else clarify this?  i can see a number of changes that will have to be
made:

  $ grep -r "= SPIN_LOCK_UNLOCKED" *

rday

p.s.  the same appears to be true for R/W spin locks as well, but i'd
feel more comfortable if someone more knowledgeable could confirm this
one way or the other.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
