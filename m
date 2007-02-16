From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 16 Feb 2007 20:23:25 +0000
Subject: Re: [KJ] removing R/W semaphore content from standard semaphore.h
Message-Id: <Pine.LNX.4.64.0702161511520.20237@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 16 Feb 2007, Randy Dunlap wrote:

> On Fri, 16 Feb 2007 14:10:19 -0500 (EST) Robert P. J. Day wrote:
>
> >   if someone could clarify this, i'd appreciate it.  i recently
> > submitted a patch that removed any inclusions of "linux/rwsem.h"
> > from the semaphore.h files, since standard semaphore header files
> > should *not* be pulling in any R/W sem stuff -- the R/W semaphores
> > now have their own rwsem.h header file.
>
> My turn for a question:  when you make such a change that affects
> many $ARCH (arch/*), do you build multiple architectures to see if
> the patch causes any problems?

  no, since i have access only to an x86 platform.  but in answer to
the question you *really* wanted to ask, no, i don't think i'm being
irresponsible in submitting multi-arch patches when i can't actually
test them, since i tend to restrict those patches to fairly obvious
stuff.

  in this case, even though this is touching every arch-specific
semaphore.h file (and could conceivably break stuff), even a couple of
those header files openly admit that R/W sem stuff shouldn't be in
them anymore, as in:

/*
 * Remove spinlock-based RW semaphores; RW semaphore definitions are
 * now in rwsem.h and we use the generic lib/rwsem.c implementation...

that makes me feel fairly confident that i'm doing the right thing.
and the only breakage that might occur is if some code has needed R/W
semaphores but has been picking up the definitions thru semaphore.h
simply by accident all this time.

  i tested that patch under x86 and i found only *one* header file
that had that property -- include/linux/quota.h -- for which a patch i
submitted has already been applied:

commit ae4472aa03d38b11f334dc0030b82e0c9f249af9
Author: Robert P. J. Day <rpjday@mindspring.com>
Date:   Mon Feb 12 00:51:52 2007 -0800

    [PATCH] QUOTA: Have <linux/quota.h> include <linux/rwsem.h> explicitly

    Since quota.h declares a R/W semaphore, it should include rwsem.h
    explicitly.

    Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>
    Acked-by: Jan Kara <jack@suse.cz>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

so the fact that jan, andrew and linus agree with my logic makes me
feel like i'm on safe ground here.  and if that patch *does* cause
some other architecture build to break, then, quite simply, that
architecture has a bug in the code and it's easily fixed with a simple
#include.

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
