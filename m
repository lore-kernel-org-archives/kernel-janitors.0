From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 01 Feb 2007 10:36:28 +0000
Subject: Re: [KJ] the *right* way to do conditional compilation
Message-Id: <Pine.LNX.4.64.0702010534020.13347@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 1 Feb 2007, Mehul Jani wrote:

> > a quick note:  most people on this list are already aware of how the
> > kernel kbuild structure does conditional compilation of source files
> > based on kernel configuration.  e.g., in net/atm/Makefile:
> >
> > ...
> > obj-$(CONFIG_ATM) += atm.o
> > ...
> >
> > so the source file net/atm/atm.o won't be compiled unless the
> > config option ATM is selected.  so far, so good.
> >
> > the *wrong* way to do this is shown in that same directory.  in that
> > same Makefile:
> >
> > ...
> > mpoa-objs       := mpc.o mpoa_caches.o mpoa_proc.o
> > ...
>
>
> So instances like above will have to be located and .....

actually, i just ran a quick script and i found only four files that
seem to be like this, so it's not that big a deal after all:

  net/atm/mpoa_proc.c
  arch/mips/gt64120/momenco_ocelot/dbg_io.c
  arch/mips/momentum/ocelot_c/dbg_io.c
  arch/mips/momentum/ocelot_g/dbg_io.c

should still be cleaned up, though.

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
