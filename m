From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 17 Mar 2007 22:34:17 +0000
Subject: [KJ] removing discouraged {up,down}_read_non_owner routines
Message-Id: <Pine.LNX.4.64.0703171827400.22331@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  from include/linux/rwsem.h:

===============================extern void down_read_nested(struct rw_semaphore *sem, int subclass);
extern void down_write_nested(struct rw_semaphore *sem, int subclass);
/*
 * Take/release a lock when not the owner will release it.
 *
 * [ This API should be avoided as much as possible - the
 *   proper abstraction for this case is completions. ]
 */
extern void down_read_non_owner(struct rw_semaphore *sem);   <--
extern void up_read_non_owner(struct rw_semaphore *sem);     <--
===============================
  and if you look for all invocations of those two routines, there's
eaxctly one of each, in fs/direct-io.c, which means that, if you could
somehow replace that single example with a completion, you could
delete that entire abstraction.

  sadly though, they're being applied to the "i_alloc_sem"  R/W
semaphore of an inode, and i'm not sure if it's feasible to modify
that member of an inode.

  thoughts?

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
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
