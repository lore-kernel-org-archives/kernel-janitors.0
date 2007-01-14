From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 14 Jan 2007 11:51:35 +0000
Subject: [KJ] deprecated stuff and spin locks
Message-Id: <Pine.LNX.4.64.0701140637380.13030@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  from Documentation/spinlocks.txt:
============"Macros SPIN_LOCK_UNLOCKED and RW_LOCK_UNLOCKED are deprecated and
will be removed soon. So for any new code dynamic initialization
should be used:

   spinlock_t xxx_lock;
   rwlock_t xxx_rw_lock;

   static int __init xxx_init(void)
   {
        spin_lock_init(&xxx_lock);
        rwlock_init(&xxx_rw_lock);
        ...
   }

   module_init(xxx_init);

Reasons for deprecation
  - it hurts automatic lock validators
  - it becomes intrusive for the realtime preemption patches"
==============

so ... what exactly does this mean for code cleanup?  the old-style
code would appear to be along the lines of:

  rpc->e_lock = SPIN_LOCK_UNLOCKED;

correct?  which means the new style would be:

  spin_lock_init(&rpc->e_lock);

do i have that right?  in fact, if you check include/linux/spinlock.h,
you can see the (non-debugging) definition of spin_lock_init():

  # define spin_lock_init(lock)                                   \
        do { *(lock) = SPIN_LOCK_UNLOCKED; } while (0)

so it really just translates to the old style, just using a new
wrapper.  so far, so good.  that looks like a bunch of potential
cleanup, and the same holds for rw_lock_init() and the deprecated
RW_LOCK_UNLOCKED macro.  but it's not that simple.

  what do you do with static initializations like:

  static struct irq_desc bad_irq_desc = {
        .handle_irq = handle_bad_irq,
        .lock = SPIN_LOCK_UNLOCKED
  };

or

  static spinlock_t winbond_lock = SPIN_LOCK_UNLOCKED;

if you're not supposed to use that macro anymore?  am i missing
something obvious?

rday

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
