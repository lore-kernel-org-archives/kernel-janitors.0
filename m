From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 07 Jan 2007 23:18:24 +0000
Subject: Re: [KJ] ruminations on kernel.h
Message-Id: <20070107231824.GS24620@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jan 07, 2007 at 03:55:11PM -0500, Robert P. J. Day wrote:
> On Sun, 7 Jan 2007, Matthew Wilcox wrote:
> > Well, kernel.h really is misc.h or util.h ;-)
> 
> but, actually, it isn't.  as i mentioned, there's *plenty* in there
> that really *does* seem to belong in other, more appropriate files.
> having all that stuff dumped in kernel.h just makes it that much
> harder to make an educated guess as to where to find things like
> macros and function declarations and the like.

By all means move stuff that seems more appropriate elsewhere.
My point was to *not* create a misc.h or util.h

> as another example, the function declarations for the
> simple_strto[u]l[l] routines are in kernel.h, but their
> implementations are in lib/vsprintf.c.  if i was looking for that
> stuff, i would never have guessed that.

I'd suggest <linux/string.h> would be a better place for those.

> and there's lots more where that came from.

Of course.  There's an almost infinite amount of cruft to deal with,
that's why there's this janitor list ...
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
