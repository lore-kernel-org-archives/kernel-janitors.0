From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 04 Jun 2007 12:00:17 +0000
Subject: Re: [KJ] another project or two
Message-Id: <20070604120017.GZ23968@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706040528251.31127@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706040528251.31127@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jun 04, 2007 at 05:31:23AM -0400, Robert P. J. Day wrote:
>   also, something i've been thinking about for a while is the
> feasibility of centralizing a lot of the identical information that is
> duplicated across all of the include/asm-* header files.  as an
> example, if you take a look at all of the include/asm-*/types.h files,
> there's a lot of absolutely identical content.
> 
>   i'm wondering if there's any value to factoring all the common
> content and just leaving the differences in the arch-specific files.
> thoughts?

My thought is "Bad idea".  An example of this is asm/errno.h.  Before,
when I wanted to know what -27 was, I would go and look in asm/errno.h.
Now, I have to look in asm/errno.h which may direct me to
asm-generic/errno.h, which redirects me to asm-generic/errno-base.h,
which tells me it's EFBIG.  Worse, not all arches use
asm-generic/errno.h, so I may look in the wrong file by mistake.

The other response in this thread suggested that centralising things
would reduce compile time.  This obviously can't be true; we're
opening, reading and closing two additional files.

What *is* a win is providing a mechanism for adding a new
errno/type/whatever to every architecture, without editing 27 header
files.  The normal way to do something like this is:

<linux/foo.h>
includes <asm/foo.h>

#ifndef THINGY
#define THINGY *suitale definition*
#endif

which allows architectures to override it when they need to.

I know it looks wasteful, redundant and possibly even error-prone to
define the same things over and over in asm/types.h, but it really is
better than the alternative.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
