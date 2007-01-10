From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 10 Jan 2007 09:23:59 +0000
Subject: Re: [KJ] what's the deal with using real "boolean" variables?
Message-Id: <Pine.LNX.4.64.0701100419550.15184@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701100337460.11933@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 10 Jan 2007, Richard Knutsson wrote:

> Robert P. J. Day wrote:
> >   is there a consensus on how to use actual C99 boolean variables in
> > the kernel source? C99 defines the unsigned integer type "_Bool" and,
> > from that point on, it's all downhill:
> >
> <snip>
> > ./include/linux/types.h:typedef _Bool                   bool;
> >
> This is the one that was added to replace the rest.

so the approved way to define boolean variables is with "bool," then?
ok, that makes sense.  i was asking since that would be the obvious
return type of something like "is_power_of_2()", of course.

> There is also 'true' and 'false' defined (enum'ed) in include/linux/stddef.h.
>
> A few file-systems, including ntfs, has been converted to this one.

ah, yes, i see that now.  it might be worth submitting a short patch
to update "CodingStyle" to mention all of this, if this is in fact the
consensus.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
