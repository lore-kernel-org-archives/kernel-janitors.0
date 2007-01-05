From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 05 Jan 2007 19:47:33 +0000
Subject: Re: [KJ] thoughts on cleaning up all this "round up" chaos?
Message-Id: <Pine.LNX.4.64.0701051445330.5124@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701051144360.4700@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701051144360.4700@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 5 Jan 2007, Rich Morgan wrote:

>
> On Fri, January 5, 2007 11:57 am, Robert P. J. Day wrote:
> <snip>
> >   like i said, i'm not sure this is even cleanable anymore.  but, if
> > it was, at a bare minimum, there should be some consensus on a
> > canonical set of macros for kernel.h, perhaps with a consistent naming
> > convention.
> >
> >   thoughts?  this is *clearly* not something that would be handled by
> > a single patch, if it's done at all.
> <snip>
>
> Pardon my ignorance here, but I'm wondering why a massive
> search/replace patch wouldn't work?  If the definition is
> standardized and all references are made the same, why wouldn't it
> work?

because, normally, you're supposed to CC all of the subsystem
maintainers at the same time.  the larger the patch, the more overall
disruptive it is.  and fixing all of that would be disruptive in a
*major* way.

rday

p.s.  and backing up a bit, it's still not clear that what's in
kernel.h *should* be the standard, since it seems rather ad hoc.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
