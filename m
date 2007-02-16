From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 16 Feb 2007 19:59:44 +0000
Subject: Re: [KJ] removing R/W semaphore content from standard semaphore.h
Message-Id: <20070216115944.71830000.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 16 Feb 2007 14:10:19 -0500 (EST) Robert P. J. Day wrote:

> 
>   if someone could clarify this, i'd appreciate it.  i recently
> submitted a patch that removed any inclusions of "linux/rwsem.h" from
> the semaphore.h files, since standard semaphore header files should
> *not* be pulling in any R/W sem stuff -- the R/W semaphores now have
> their own rwsem.h header file.

My turn for a question:  when you make such a change that affects
many $ARCH (arch/*), do you build multiple architectures to see if
the patch causes any problems?


>   however, some of the semaphore.h files contain the following macro
> definition:
> 
> $ grep RW_LOCK_BIAS $(find . -name semaphore.h)
> ./include/asm-frv/semaphore.h:#define RW_LOCK_BIAS               0x01000000
> ./include/asm-m68knommu/semaphore.h:#define RW_LOCK_BIAS         0x01000000
> ./include/asm-m68k/semaphore.h:#define RW_LOCK_BIAS              0x01000000
> ./include/asm-h8300/semaphore.h:#define RW_LOCK_BIAS             0x01000000
> ./include/asm-cris/semaphore.h:#define RW_LOCK_BIAS              0x01000000
> 
>   for the same reason as above, i'm fairly certain that *those* macros
> should be removed from the regular semaphore.h files.  what does that
> macro represent?  and where should it *properly* be defined?  thanks.

RW_LOCK_BIAS seems to be explained (only) in
include/asm-arm*/locks.h:
/*
 * The value 0x01000000 supports up to 128 processors and
 * lots of processes.  BIAS must be chosen such that sub'ing
 * BIAS once per CPU will result in the long remaining
 * negative.
 */
#define RW_LOCK_BIAS      0x01000000


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
