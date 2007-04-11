From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 11 Apr 2007 05:47:09 +0000
Subject: Re: [KJ] remove SPIN_LOCK_UNLOCKED
Message-Id: <Pine.LNX.4.64.0704110140480.7851@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070410181654.GA10525@arun.site> <Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr>
 <Pine.LNX.4.64.0704101722030.24526@CPE00045a9c397f-CM001225dbafb6>
 <Pine.LNX.4.61.0704102327460.32056@yvahk01.tjqt.qr> <ada7isjq52p.fsf@cisco.com>
 <Pine.LNX.4.64.0704101743520.24794@CPE00045a9c397f-CM001225dbafb6>
 <20070410220804.GI26692@parisc-linux.org>
In-Reply-To: <20070410220804.GI26692@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Roland Dreier <rdreier@cisco.com>, kernelnewbies@nl.linux.org, kernel-janitors@lists.osdl.org, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org

On Tue, 10 Apr 2007, Matthew Wilcox wrote:

> On Tue, Apr 10, 2007 at 05:45:07PM -0400, Robert P. J. Day wrote:
> > that works fine if you're defining a single spinlock, but what do you
> > do in cases like this:
> >
> > arch/sparc/lib/atomic32.c:      [0 ... (ATOMIC_HASH_SIZE-1)] = SPIN_LOCK_UNLOCKED
> >
> > that is, when you're assigning an array of them?  you still need
> > some kind of generic, unnamed spinlock in those circumstances, no?
>
> That's a special case for architecture-only code.  It's not to be
> used by drivers.

be that as it may, it still means you need to take it into account
whenever someone says they want to entirely remove the
SPIN_LOCK_UNLOCKED macro from the source tree, as suggested in
Documentation/spinlocks.txt.

if you do that removal, you can always replace SPIN_LOCK_UNLOCKED with
its current definition of __SPIN_LOCK_UNLOCKED(old_style_spin_init),
or what have you.  but you would obviously have to replace it with
*something* that represents an unnamed spinlock if SPIN_LOCK_UNLOCKED
goes away.

rday

p.s.  just FYI:

$ grep -r "\.\.\..*SPIN_LOCK_UNLOCKED" *
arch/sparc/lib/atomic32.c:      [0 ... (ATOMIC_HASH_SIZE-1)] = SPIN_LOCK_UNLOCKED
arch/cris/arch-v32/kernel/smp.c:spinlock_t cris_atomic_locks[] = { [0 ... LOCK_COUNT - 1] = SPIN_LOCK_UNLOCKED};
arch/parisc/lib/bitops.c:       [0 ... (ATOMIC_HASH_SIZE-1)]  = __RAW_SPIN_LOCK_UNLOCKED
arch/mips/kernel/gdb-stub.c:    [0 ... NR_CPUS-1] = __RAW_SPIN_LOCK_UNLOCKED,
arch/powerpc/platforms/iseries/htab.c:  { [0 ... 63] = SPIN_LOCK_UNLOCKED};

so, as matthew says, it's clearly not for drivers.

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
