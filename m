From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 16 Feb 2007 20:28:26 +0000
Subject: Re: [KJ] removing R/W semaphore content from standard semaphore.h
Message-Id: <Pine.LNX.4.64.0702161524480.20237@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 16 Feb 2007, Randy Dunlap wrote:
...
> >   however, some of the semaphore.h files contain the following macro
> > definition:
> >
> > $ grep RW_LOCK_BIAS $(find . -name semaphore.h)
> > ./include/asm-frv/semaphore.h:#define RW_LOCK_BIAS               0x01000000
> > ./include/asm-m68knommu/semaphore.h:#define RW_LOCK_BIAS         0x01000000
> > ./include/asm-m68k/semaphore.h:#define RW_LOCK_BIAS              0x01000000
> > ./include/asm-h8300/semaphore.h:#define RW_LOCK_BIAS             0x01000000
> > ./include/asm-cris/semaphore.h:#define RW_LOCK_BIAS              0x01000000
> >
> >   for the same reason as above, i'm fairly certain that *those*
> > macros should be removed from the regular semaphore.h files.
> > what does that macro represent?  and where should it *properly* be
> > defined?  thanks.
>
> RW_LOCK_BIAS seems to be explained (only) in
> include/asm-arm*/locks.h:
> /*
>  * The value 0x01000000 supports up to 128 processors and
>  * lots of processes.  BIAS must be chosen such that sub'ing
>  * BIAS once per CPU will result in the long remaining
>  * negative.
>  */
> #define RW_LOCK_BIAS      0x01000000

i'm guessing there's some cleanup to be done here since look at the
variety of files that define that macro:

$ grep -rl "#define RW_LOCK_BIAS" *
include/asm-frv/semaphore.h
include/asm-arm26/locks.h
include/asm-m68knommu/semaphore.h
include/asm-i386/rwlock.h
include/asm-sh/spinlock_types.h
include/asm-arm/locks.h
include/asm-m32r/spinlock_types.h
include/asm-m68k/semaphore.h
include/asm-h8300/semaphore.h
include/asm-x86_64/rwlock.h
include/asm-cris/arch-v32/spinlock.h
include/asm-cris/semaphore.h

  so who should be defining it?  semaphore.h?  locks.h?  spinlock.h?
rwlock.h?  spinlock_types.h?  definitely a bit of a mess, no?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
