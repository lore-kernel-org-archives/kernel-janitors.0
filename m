From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 07 Jun 2007 16:17:42 +0000
Subject: [KJ] remove all content specific to GCC < 3.2??
Message-Id: <Pine.LNX.4.64.0706071212280.29467@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is it relatively safe to strip the kernel tree of any content that
is conditional upon unacceptably old versions of GCC?

  the header file linux/compiler.h already rejects the use of old gnu
compilers:

...
#if __GNUC__ >= 4
# include <linux/compiler-gcc4.h>
#elif __GNUC__ = 3 && __GNUC_MINOR__ >= 2
# include <linux/compiler-gcc3.h>
#else
# error Sorry, your compiler is too old/not recognized.
#endif
...

so clearly any gcc < 3.2 is dead in the water, which suggests that any
content dependent on that can be tossed as well.  as a starting point,
one can search for the macro __GNUC_MINOR__ to find:

arch/arm/kernel/asm-offsets.c:#if (__GNUC__ = 3 && __GNUC_MINOR__ < 3)
arch/ia64/kernel/head.S:#if (__GNUC__ = 3 && __GNUC_MINOR__ < 3)
arch/ia64/kernel/ia64_ksyms.c:#  if (__GNUC__ = 3 && __GNUC_MINOR__ < 3)
arch/ia64/oprofile/backtrace.c:#if (__GNUC__ = 3 && __GNUC_MINOR__ < 3)
include/asm-mips/compiler.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ >= 4)
include/asm-alpha/compiler.h:#if __GNUC__ = 3 && __GNUC_MINOR__ >= 4 || __GNUC__ > 3
include/asm-alpha/compiler.h:# if __GNUC__ = 3 && __GNUC_MINOR__ >= 4 || __GNUC__ > 3
include/asm-s390/irqflags.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ > 2)
include/asm-s390/bitops.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ > 2)
include/asm-s390/bitops.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ > 2)
include/asm-s390/spinlock.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ > 2)
include/asm-s390/atomic.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ > 2)
include/asm-s390/atomic.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ > 2)
include/asm-s390/atomic.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ > 2)
include/asm-s390/atomic.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ > 2)
include/asm-s390/timex.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ > 2)
include/asm-s390/timex.h:#if __GNUC__ > 3 || (__GNUC__ = 3 && __GNUC_MINOR__ > 2)
include/asm-sparc/bug.h:    (__GNUC__ = 3 && __GNUC_MINOR__ > 3) || \
include/asm-sparc/bug.h:    (__GNUC__ = 3 && __GNUC_MINOR__ = 3 && __GNUC_PATCHLEVEL__ >= 4)
include/asm-ia64/spinlock.h:#if (__GNUC__ = 3 && __GNUC_MINOR__ < 3)
include/asm-ia64/gcc_intrin.h:#if __GNUC__ >= 4 || (__GNUC__ = 3 && __GNUC_MINOR__ >= 4)
include/asm-ia64/module.h:	"gcc-" __stringify(__GNUC__) "." __stringify(__GNUC_MINOR__)
include/linux/compiler.h:#elif __GNUC__ = 3 && __GNUC_MINOR__ >= 2
include/linux/compiler-gcc3.h:#if __GNUC_MINOR__ >= 3
include/linux/compiler-gcc3.h:#if __GNUC_MINOR__ >= 4
include/asm-x86_64/bitops.h:#if __GNUC__ < 4 || (__GNUC__ = 4 && __GNUC_MINOR__ < 1)
init/main.c:#if (__GNUC__ < 3) || (__GNUC__ = 3 && __GNUC_MINOR__ < 2)
init/main.c:#if __GNUC__ = 4 && __GNUC_MINOR__ = 1 && __GNUC_PATCHLEVEL__ = 0
scripts/gcc-version.sh:MINOR=$(echo __GNUC_MINOR__ | $compiler -E -xc - | tail -n 1)

  seems like a lot of that can be removed.  anyone want to deal with
that if it seems like a viable project?

rday

p.s.  obviously, there might be more than what's listed above, i just
did a quick grep off the top of my head.

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
