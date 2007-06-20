From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 20 Jun 2007 21:53:38 +0000
Subject: Re: [KJ] [PATCH] Centralize checking for adequate version of gcc.
Message-Id: <20070620215338.GW8154@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 20, 2007 at 11:38:07PM +0200, Adrian Bunk wrote:
> On Fri, Jun 15, 2007 at 06:52:17AM -0400, Robert P. J. Day wrote:
> >...
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> >...
> > +#elif __GNUC__ = 4 && __GNUC_MINOR__ = 1 && __GNUC_PATCHLEVEL__ = 0
> > +# warning gcc-4.1.0 is known to miscompile the kernel.  A different compiler version is recommended.
> > +#elif __GNUC__ = 4
> >  # include <linux/compiler-gcc4.h>
> >...
> 
> This breaks compilation with gcc 4.1.0

Also perhaps a more serious problem is that instead of emitting the
warning once, it's now emitted for every single file.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
