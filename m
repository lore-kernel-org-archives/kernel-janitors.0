From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 01 Feb 2007 12:01:13 +0000
Subject: Re: [KJ] the *right* way to do conditional compilation
Message-Id: <Pine.LNX.4.64.0702010656260.13953@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 1 Feb 2007, Mehul Jani wrote:

> > net/atm/mpoa_proc.c
> > arch/mips/gt64120/momenco_ocelot/dbg_io.c
> > arch/mips/momentum/ocelot_c/dbg_io.c
> > arch/mips/momentum/ocelot_g/dbg_io.c
> >
> > should still be cleaned up, though.
>
> Cool!!! If its not too much in heat ,let me know the kernel version
> you are using. I will put forward a patch for it. Else it your
> baby!!!

i already sent in a patch for the last three, given how trivial those
changes were (and the fact that i've exchanged email with the MIPS
maintainer before).  haven't touched the first one, but i'll deal with
that later.  i originally guessed this would be a much larger cleanup
job but clearly it wasn't that big a deal.

> Hope you are not making changes to dead CONFIG variables ;-) Jst to
> remind you.

i've sent in *some*, but a lot of them aren't as straightforward as
you would first think.  i'd wait until 2.6.20 comes out, and
everything that's queued up gets into the main tree before going any
further.

i've also posted on LKML that subsystem maintainers might want to run
that script and try to clean up their own stuff first.

rday

p.s.  i always submit patches against the latest linux git repo.

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
