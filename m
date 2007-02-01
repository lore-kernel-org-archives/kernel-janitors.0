From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 01 Feb 2007 14:40:00 +0000
Subject: Re: [KJ] the *right* way to do conditional compilation
Message-Id: <Pine.LNX.4.64.0702010938230.15042@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 1 Feb 2007, Matthew Wilcox wrote:

> On Thu, Feb 01, 2007 at 04:44:36AM -0500, Robert P. J. Day wrote:
> >   the *wrong* way to do this is shown in that same directory.  in that
> > same Makefile:
> >
> >   ...
> >   mpoa-objs       := mpc.o mpoa_caches.o mpoa_proc.o
> >   ...
> >
> > but if you look at the source file mpoa_proc.c, you'll see that its
> > *entire* contents are surrounded by
> >
> >   #ifdef CONFIG_PROC_FS
> >   ...
> >   #endif /* CONFIG_PROC_FS */
> >
> >   that's just silly.  it would clearly(?) make more sense for the
> > Makefile entry to read:
> >
> >   obj-$(CONFIG_PROC_FS) += mpoa_proc.o
> >
> > or something to that effect, would it not?
>
> Not.  If CONFIG_PROC_FS=y and CONFIG_ATM_MPOA=m, you just built
> mpoa_proc.o into the kernel and left it out of mpoa.ko.
> Documentation/kbuild/makefiles.txt says the right way to do this is:
>
> mpoa-y			:= mpc.o mpoa_caches.o
> mpoa-$(CONFIG_PROC_FS)	+= mpoa_proc.o

i was fairly sure it wasn't as simple as the other example, which is
why i added "or something to that effect."  thanks.  i'll whip up a
patch, while i'm on a roll here.

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
