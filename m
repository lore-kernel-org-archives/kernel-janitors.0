From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 16 Feb 2007 19:10:19 +0000
Subject: [KJ] removing R/W semaphore content from standard semaphore.h files
Message-Id: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  if someone could clarify this, i'd appreciate it.  i recently
submitted a patch that removed any inclusions of "linux/rwsem.h" from
the semaphore.h files, since standard semaphore header files should
*not* be pulling in any R/W sem stuff -- the R/W semaphores now have
their own rwsem.h header file.

  however, some of the semaphore.h files contain the following macro
definition:

$ grep RW_LOCK_BIAS $(find . -name semaphore.h)
./include/asm-frv/semaphore.h:#define RW_LOCK_BIAS               0x01000000
./include/asm-m68knommu/semaphore.h:#define RW_LOCK_BIAS         0x01000000
./include/asm-m68k/semaphore.h:#define RW_LOCK_BIAS              0x01000000
./include/asm-h8300/semaphore.h:#define RW_LOCK_BIAS             0x01000000
./include/asm-cris/semaphore.h:#define RW_LOCK_BIAS              0x01000000

  for the same reason as above, i'm fairly certain that *those* macros
should be removed from the regular semaphore.h files.  what does that
macro represent?  and where should it *properly* be defined?  thanks.

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
