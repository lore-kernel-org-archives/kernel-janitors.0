From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 16 Feb 2007 20:33:48 +0000
Subject: Re: [KJ] removing R/W semaphore content from standard semaphore.h
Message-Id: <20070216123348.1842f5be.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 16 Feb 2007 15:23:25 -0500 (EST) Robert P. J. Day wrote:

> On Fri, 16 Feb 2007, Randy Dunlap wrote:
> 
> > On Fri, 16 Feb 2007 14:10:19 -0500 (EST) Robert P. J. Day wrote:
> >
> > >   if someone could clarify this, i'd appreciate it.  i recently
> > > submitted a patch that removed any inclusions of "linux/rwsem.h"
> > > from the semaphore.h files, since standard semaphore header files
> > > should *not* be pulling in any R/W sem stuff -- the R/W semaphores
> > > now have their own rwsem.h header file.
> >
> > My turn for a question:  when you make such a change that affects
> > many $ARCH (arch/*), do you build multiple architectures to see if
> > the patch causes any problems?
> 
>   no, since i have access only to an x86 platform.  but in answer to
> the question you *really* wanted to ask, no, i don't think i'm being
> irresponsible in submitting multi-arch patches when i can't actually
> test them, since i tend to restrict those patches to fairly obvious
> stuff.
> 
...
> so the fact that jan, andrew and linus agree with my logic makes me
> feel like i'm on safe ground here.  and if that patch *does* cause
> some other architecture build to break, then, quite simply, that
> architecture has a bug in the code and it's easily fixed with a simple
> #include.

So Andrew did the multi-arch build and didn't see errors/warnings
from your patch.  Normally it's the patch submitter's responsibility
(if possible; if not, so be it).  They didn't simply agree with your
logic -- the patch was tested by being built on many arches.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
