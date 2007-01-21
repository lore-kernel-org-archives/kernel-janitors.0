From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 21 Jan 2007 09:30:22 +0000
Subject: Re: [KJ] standardizing on boolean variables?
Message-Id: <Pine.LNX.4.64.0701210425140.16544@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 21 Jan 2007, Alexey Dobriyan wrote:

> On Sun, Jan 21, 2007 at 03:36:33AM -0500, Robert P. J. Day wrote:
> > p.s.  the source file drivers/scsi/BusLogic.c repeatedly refers to the
> > token "true", but it's not clear where *that's" being defined.  goes
> > gcc actually recognize the token "true"?  that's supposed to be
> > defined in C99's <stdbool.h>, but that's clearly not being used here.
>
> When in doubt see preprocessor output:
>
> 	make drivers/scsi/BusLogic.i
>
> 	# 1 "/home/linux/linux-irq-flags-t/include/linux/stddef.h" 1
> 	# 15 "/home/linux/linux-irq-flags-t/include/linux/stddef.h"
> 	enum {
> 	 false = 0,
> 	 true = 1
> 	};
>
> Indeed, "true" is right there.

ah, quite right, i missed that.  but that, of course, just raises
another question -- why have two different sets of tokens representing
boolean values?  should programmers use the upper or lower case form?
and why did the person who wrote BusLogic.c do it differently from
everyone else?  so many pedantic, anal-retentive questions.

but back to the question at hand -- is there any fundamental problem
with trying to define a standard by defining TRUE and FALSE macros in
types.h?  certainly, that would also require some simultaneous fixes
to the source tree, where those new macros would clash with existing
code, like in drivers/net/wireless/strip.c, where one would have to
remove the conflicting:

  enum { FALSE = 0, TRUE = 1 };

but i'm guessing things like that would be rare.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
