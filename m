From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 01 Feb 2007 12:50:08 +0000
Subject: [KJ] can someone clarify the changes to the spinlock API?
Message-Id: <Pine.LNX.4.64.0702010732070.14212@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  (i've asked about this (on LKML) before but don't recall ever seeing
a response so i'll give it another shot here.)

  once upon a time, you could create an unlocked spinlock with:

  spinlock_t mylock = SPIN_LOCK_UNLOCKED;

note carefully how the (now deprecated) SPIN_LOCK_UNLOCKED macro was
utterly generic -- it didn't need any args, so you could easily
allocate an array of them in one go:

  arch/sparc/lib/atomic32.c:  [0 ... (ATOMIC_HASH_SIZE-1)] = SPIN_LOCK_UNLOCKED

since all of those spinlocks were absolutely identical.

  however, that macro has been deprecated in favour of the newer

#define DEFINE_SPINLOCK(x)  spinlock_t x = __SPIN_LOCK_UNLOCKED(x)

which, as you can see, clearly takes as an argument the name of the
spinlock you want to create:

...
./mm/slob.c:static DEFINE_SPINLOCK(slob_lock);
./mm/slob.c:static DEFINE_SPINLOCK(block_lock);
./mm/sparse.c:  static DEFINE_SPINLOCK(index_init_lock);
...

and so on.

  so you won't create a *generic* spinlock anymore, you'll create a
*named* spinlock.  this means that you won't see generic structure
member initializations anymore, like:

  static struct atm_dev atmtcp_control_dev = {
        .ops            = &atmtcp_c_dev_ops,
        .type           = "atmtcp",
        .number         = 999,
        .lock           = SPIN_LOCK_UNLOCKED     <-- deprecated
  };

rather, you'll see named initialization, as in:

  static struct rcu_ctrlblk rcu_ctrlblk = {
        .cur = -300,
        .completed = -300,
        .lock = __SPIN_LOCK_UNLOCKED(&rcu_ctrlblk.lock),   <-- newer
        .cpumask = CPU_MASK_NONE,
  };

that sounds reasonable, but that also means you can't allocate an
array of them all at once as you could before.  so what do you do in
cases like that?

  is there a coherent write-up on this change and everything it
implies?  might be nice if there were a page on this added to the
wiki.  :-)

rday

p.s.  the same change applies to the R/W form of spinlocks as well.

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
