From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 09 Mar 2007 12:16:13 +0000
Subject: [KJ] replace "{up,down}_read_non_owner" with completion?
Message-Id: <Pine.LNX.4.64.0703090711520.1288@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  the header file linux/rwsem.h describes a couple of R/W semaphore
routines and discourages their use:

=====================/*
 * Take/release a lock when not the owner will release it.
 *
 * [ This API should be avoided as much as possible - the
 *   proper abstraction for this case is completions. ]
 */
extern void down_read_non_owner(struct rw_semaphore *sem);
extern void up_read_non_owner(struct rw_semaphore *sem);
=====================
  in fact, in the entire source tree, there is only one example of the
use of these routines:  fs/direct-io.c.

  would it be possible to transform that to use a completion instead,
and remove those two routines from the kernel entirely?  i haven't
looked at this closely yet so it may be that there's no way to avoid
the current usage.

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
