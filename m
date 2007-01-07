From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 07 Jan 2007 20:55:11 +0000
Subject: Re: [KJ] ruminations on kernel.h
Message-Id: <Pine.LNX.4.64.0701071550430.17438@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 7 Jan 2007, Matthew Wilcox wrote:

> On Sun, Jan 07, 2007 at 03:24:41PM -0500, Robert P. J. Day wrote:
> >   the various utility macros (ARRAY_SIZE, FIELD_SIZE, min/max,
> > container_of, etc.) might fit better into a file called macros.h or
> > util.h.
> >
> >   then there's all the debugging/logging stuff -- the priority macros,
> > loglevel stuff, pr_debug, pr_info, etc.  why not a new file called
> > "debug.h"?
> >
> >   anyway, you get the idea.  there doesn't seem to be much rhyme or
> > reason for what has been tossed into kernel.h.
>
> Well, kernel.h really is misc.h or util.h ;-)

but, actually, it isn't.  as i mentioned, there's *plenty* in there
that really *does* seem to belong in other, more appropriate files.
having all that stuff dumped in kernel.h just makes it that much
harder to make an educated guess as to where to find things like
macros and function declarations and the like.

as another example, the function declarations for the
simple_strto[u]l[l] routines are in kernel.h, but their
implementations are in lib/vsprintf.c.  if i was looking for that
stuff, i would never have guessed that.

and there's lots more where that came from.

rday

p.s.  and having stuff scattered around the tree like that also makes
it harder to generate the kernel-doc output, since you typically have
to gather a number of widely-separated files just to generate the
documentation for a single section.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
