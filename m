From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 04 Feb 2007 18:57:35 +0000
Subject: [KJ] what's all this "RW_LOCK_BIAS" stuff?
Message-Id: <Pine.LNX.4.64.0702041351150.3067@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  just digging around in the semaphore stuff and i'm not sure what
this "RW_LOCK_BIAS" stuff is all about:

$ grep -r "define RW_LOCK_BIAS" *
include/asm-frv/semaphore.h:#define RW_LOCK_BIAS                 0x01000000
include/asm-arm26/locks.h:#define RW_LOCK_BIAS      0x01000000
include/asm-arm26/locks.h:#define RW_LOCK_BIAS_STR "0x01000000"
include/asm-m68knommu/semaphore.h:#define RW_LOCK_BIAS           0x01000000
include/asm-i386/rwlock.h:#define RW_LOCK_BIAS           0x01000000
include/asm-i386/rwlock.h:#define RW_LOCK_BIAS_STR      "0x01000000"
include/asm-sh/spinlock_types.h:#define RW_LOCK_BIAS             0x01000000
include/asm-arm/locks.h:#define RW_LOCK_BIAS      0x01000000
include/asm-arm/locks.h:#define RW_LOCK_BIAS_STR "0x01000000"
include/asm-arm/locks.h:#define RW_LOCK_BIAS      0x01000000
include/asm-arm/locks.h:#define RW_LOCK_BIAS_STR "0x01000000"
include/asm-m32r/spinlock_types.h:#define RW_LOCK_BIAS           0x01000000
include/asm-m32r/spinlock_types.h:#define RW_LOCK_BIAS_STR       "0x01000000"
include/asm-m68k/semaphore.h:#define RW_LOCK_BIAS                0x01000000
include/asm-h8300/semaphore.h:#define RW_LOCK_BIAS               0x01000000
include/asm-x86_64/rwlock.h:#define RW_LOCK_BIAS                 0x01000000
include/asm-x86_64/rwlock.h:#define RW_LOCK_BIAS_STR     "0x01000000"
include/asm-cris/arch-v32/spinlock.h:#define RW_LOCK_BIAS 0x01000000
include/asm-cris/semaphore.h:#define RW_LOCK_BIAS             0x01000000

  is it really necessary for all of these header files to be defining
those macros to have identical values?  just curious.  and all that
seems to be related to the small number of "rwlock.h" files:

$ find . -name rwlock.h
./include/asm-i386/rwlock.h
./include/asm-um/rwlock.h
./include/asm-x86_64/rwlock.h

  thoughts?

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
