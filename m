From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 20 Jun 2007 22:07:04 +0000
Subject: Re: [KJ] [PATCH] Centralize checking for adequate version of gcc.
Message-Id: <Pine.LNX.4.64.0706201806250.3201@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 20 Jun 2007, Matthew Wilcox wrote:

> On Wed, Jun 20, 2007 at 11:38:07PM +0200, Adrian Bunk wrote:
> > On Fri, Jun 15, 2007 at 06:52:17AM -0400, Robert P. J. Day wrote:
> > >...
> > > --- a/include/linux/compiler.h
> > > +++ b/include/linux/compiler.h
> > >...
> > > +#elif __GNUC__ = 4 && __GNUC_MINOR__ = 1 && __GNUC_PATCHLEVEL__ = 0
> > > +# warning gcc-4.1.0 is known to miscompile the kernel.  A different compiler version is recommended.
> > > +#elif __GNUC__ = 4
> > >  # include <linux/compiler-gcc4.h>
> > >...
> >
> > This breaks compilation with gcc 4.1.0
>
> Also perhaps a more serious problem is that instead of emitting the
> warning once, it's now emitted for every single file.

ok, i see the problem.  an #error is once, but a #warning is forever.

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
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
