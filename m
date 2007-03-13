From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Mar 2007 22:04:46 +0000
Subject: Re: [KJ] module.h and moduleparam.h:  more header file pedantry
Message-Id: <Pine.LNX.4.64.0703131804080.3737@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703121252430.19315@CPE00045a9c397f-CM001225dbafb6>
 <20070313220517.GA5623@martell.zuzino.mipt.ru>
In-Reply-To: <20070313220517.GA5623@martell.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Wed, 14 Mar 2007, Alexey Dobriyan wrote:

> On Mon, Mar 12, 2007 at 12:59:20PM -0400, Robert P. J. Day wrote:
> >   to my surprise, i learned only today that module.h includes
> > moduleparam.h, which flies in the face of all of the documentation
> > i've ever read which was adamant that i *had* to include moduleparam.h
> > if i was using parameters. i'm guessing this comes as a surprise to
> > the 400+ header files which include both unnecessarily.
> >
> >   so ... in a perfect world, should a module source file that doesn't
> > use parameters *at all* need to include moduleparam.h?
>
> Probably not.
>
> > as it stands
> > now, yes, it does, given some ugly inter-dependencies between the two
> > files.
> >
> >   so, at the very least, programmers can stop including moduleparam.h,
> > unless there's a cleaner way to do all that.
>
> Regardless, of what you'll do: cross-compile test!
>
> After aforementioned removal and adding "struct kernel_param;"
>
> + akmk arm-assabet -k
>   CHK     include/linux/version.h
> make[2]: `include/asm-arm/mach-types.h' is up to date.
>   Using /home/linux/linux-irq-flags-t as source for kernel
>   GEN     /home/linux/build/arm-assabet/Makefile
>   CHK     include/linux/utsrelease.h
>   CHK     include/linux/compile.h
>   CC      arch/arm/nwfpe/fpmodule.o
> arch/arm/nwfpe/fpmodule.c:179: error: syntax error before string constant
> arch/arm/nwfpe/fpmodule.c:179: warning: type defaults to `int' in declaration of `__MODULE_INFO'
> arch/arm/nwfpe/fpmodule.c:179: warning: function declaration isn't a prototype
> arch/arm/nwfpe/fpmodule.c:179: warning: data definition has no type or storage class

oh, i've already been by that and figured out what's going on.  i'm
going to summarize this on the KJ wiki.  it's really quite the mess.

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
