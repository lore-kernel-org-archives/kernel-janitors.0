From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 14 Jan 2007 12:32:07 +0000
Subject: Re: [KJ] deprecated stuff and spin locks
Message-Id: <20070114123207.GA9124@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701140637380.13030@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701140637380.13030@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jan 14, 2007 at 06:51:35AM -0500, Robert P. J. Day wrote:
>   from Documentation/spinlocks.txt:
> ============> "Macros SPIN_LOCK_UNLOCKED and RW_LOCK_UNLOCKED are deprecated and
> will be removed soon. So for any new code dynamic initialization
> should be used:
>
>    spinlock_t xxx_lock;
>    rwlock_t xxx_rw_lock;
>
>    static int __init xxx_init(void)
>    {
>         spin_lock_init(&xxx_lock);
>         rwlock_init(&xxx_rw_lock);
>         ...
>    }
>
>    module_init(xxx_init);
>
> Reasons for deprecation
>   - it hurts automatic lock validators

That's because aforementioned automatic lock validators sucks. :-(

>   - it becomes intrusive for the realtime preemption patches"
> ==============
>
> so ... what exactly does this mean for code cleanup?  the old-style
> code would appear to be along the lines of:
>
>   rpc->e_lock = SPIN_LOCK_UNLOCKED;
>
> correct?  which means the new style would be:
>
>   spin_lock_init(&rpc->e_lock);
>
> do i have that right?

I think, yes.

> in fact, if you check include/linux/spinlock.h,
> you can see the (non-debugging) definition of spin_lock_init():
>
>   # define spin_lock_init(lock)                                   \
>         do { *(lock) = SPIN_LOCK_UNLOCKED; } while (0)

I'm sure some sort of annotation will be inserted later, though, I
haven't followed discussion about spin_lock_init().

> so it really just translates to the old style, just using a new
> wrapper.  so far, so good.  that looks like a bunch of potential
> cleanup, and the same holds for rw_lock_init() and the deprecated
> RW_LOCK_UNLOCKED macro.  but it's not that simple.
>
>   what do you do with static initializations like:
>
>   static struct irq_desc bad_irq_desc = {
>         .handle_irq = handle_bad_irq,
>         .lock = SPIN_LOCK_UNLOCKED
>   };
>
> or
>
>   static spinlock_t winbond_lock = SPIN_LOCK_UNLOCKED;
>
> if you're not supposed to use that macro anymore?  am i missing
> something obvious?

Well, there're almost 1500 examples in the tree.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
