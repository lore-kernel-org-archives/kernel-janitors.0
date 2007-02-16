From: Frederik Deweerdt <deweerdt@free.fr>
Date: Fri, 16 Feb 2007 21:45:18 +0000
Subject: Re: [KJ] removing R/W semaphore content from standard semaphore.h
Message-Id: <20070217213142.GD32060@slug>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702161405230.3503@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 16, 2007 at 03:23:25PM -0500, Robert P. J. Day wrote:
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
>   no, since i have access only to an x86 platform.  
In case you'd want to cross-compile, eldk
(http://www.denx.de/wiki/DULG/ELDK) has some pre-built toolchains for
x86 to arm, mips and ppc.

Regards,
Frederik
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
