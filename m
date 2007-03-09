From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 09 Mar 2007 01:38:50 +0000
Subject: [KJ] semaphores versus mutexes
Message-Id: <Pine.LNX.4.64.0703082031050.14629@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i'm not sure if there's some (lots of?) potential cleanup here, so
if someone can clarify this, i'd be ever so grateful.

  from what i read (and i could be way offbase), the semaphore.h
header files technically define general counting semaphores, while the
more specific mutex.h header files define strictly *binary*
sempahores.  is that correct so far?

  if that's true, then it would seem to follow that the semaphore.h
files shouldn't define anything related strictly to mutexes, but at
the moment, that's not what's happening.  asm-i386/semaphore.h
contains stuff like:

=============#define DECLARE_MUTEX(name) __DECLARE_SEMAPHORE_GENERIC(name,1)
#define DECLARE_MUTEX_LOCKED(name) __DECLARE_SEMAPHORE_GENERIC(name,0)
...
static inline void init_MUTEX (struct semaphore *sem)
{
        sema_init(sem, 1);
}

static inline void init_MUTEX_LOCKED (struct semaphore *sem)
{
        sema_init(sem, 0);
}
=============
which would seem to belong more properly in mutex.h, no?

  instead of DECLARE_MUTEX, one would use mutex.h's DEFINE_MUTEX, no?
and instead of init_MUTEX(), you would use mutex_init(), right?
except that mutex.h has no equivalent to DECLARE_MUTEX_LOCKED or
init_MUTEX_LOCKED that i can see.

  can someone clarify what should be happening here in a perfect
world?  thanks.

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
