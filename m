From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 01 Feb 2007 14:44:30 +0000
Subject: Re: [KJ] can someone clarify the changes to the spinlock API?
Message-Id: <Pine.LNX.4.64.0702010941540.15061@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702010732070.14212@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702010732070.14212@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 1 Feb 2007, Matthew Wilcox wrote:

> On Thu, Feb 01, 2007 at 07:50:08AM -0500, Robert P. J. Day wrote:
> > note carefully how the (now deprecated) SPIN_LOCK_UNLOCKED macro was
> > utterly generic -- it didn't need any args, so you could easily
> > allocate an array of them in one go:
> >
> >   arch/sparc/lib/atomic32.c:  [0 ... (ATOMIC_HASH_SIZE-1)] = SPIN_LOCK_UNLOCKED
>
> Is there anyone other than sparc32 creating an array of spinlocks?
> On parisc, we use an array of raw_spinlock_t, and I suspect sparc32
> should do the same.

$ grep -r "\.\.\..*SPIN_LOCK_UNLOCKED" .
./arch/sparc/lib/atomic32.c:    [0 ... (ATOMIC_HASH_SIZE-1)] = SPIN_LOCK_UNLOCKED
./arch/cris/arch-v32/kernel/smp.c:spinlock_t cris_atomic_locks[] = { [0 ... LOCK_COUNT - 1] = SPIN_LOCK_UNLOCKED};
./arch/parisc/lib/bitops.c:     [0 ... (ATOMIC_HASH_SIZE-1)]  = __RAW_SPIN_LOCK_UNLOCKED
./arch/mips/kernel/gdb-stub.c:  [0 ... NR_CPUS-1] = __RAW_SPIN_LOCK_UNLOCKED,
./arch/powerpc/platforms/iseries/htab.c:        { [0 ... 63] = SPIN_LOCK_UNLOCKED};

so there's sparc, cris and powerpc.  and you're right, they should be
using raw spinlocks.  off to slap together another patch.  or two.

rday
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
