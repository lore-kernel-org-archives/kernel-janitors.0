From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 07 Jun 2007 12:45:25 +0000
Subject: [KJ] the rules for replacing DECLARE_MUTEX with DEFINE_MUTEX?
Message-Id: <Pine.LNX.4.64.0706070838130.18229@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i know that there's been a fair amount of work done lately in terms
of replacing regular semaphores with the newer "mutex", and i just
want to clarify under what circumstances that can be done.

  first, a mutex is strictly a binary semaphore so it can't possibly
be used in place of a general counting semaphore. (well, duh.)

  in addition, mutexes can generally be used only in a limited
locality, where the process that locks the mutex must be the same one
that unlocks it, so even strictly binary semaphores might not be
convertable to mutexes.

  as i read it, the obvious places where actual mutexes could be used
would be places like, say, drivers/spi/spi.c:

...
static DECLARE_MUTEX(board_lock);
...
    down(&board_lock);
    list_add_tail(&bi->list, &board_list);
    up(&board_lock);
...

  first, the fact that the mutex itself is static means it's going to
be used only within this file context.  and that restricted locality
where it's actually used is what i interpret as a good hint that that
semaphore could be replaced by a mutex.

  is that a good summary of the rules?  am i missing anything
critical?

rday

p.s.  no, i have no interest in submitting patches for this, i just
wanted to make sure i understood the general rules.
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
