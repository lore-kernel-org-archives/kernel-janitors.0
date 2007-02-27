From: "Douglas Landgraf" <dougsland@gmail.com>
Date: Tue, 27 Feb 2007 18:07:05 +0000
Subject: Re: [KJ] [PATCH] 3c505.c: replacing strcpy to strncpy
Message-Id: <68cac7520702271007r38b1caedi432ea271f598b83@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070225173528.GB3595@localhost.localdomain>
In-Reply-To: <20070225173528.GB3595@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi guys,

    I agree with Ethan, we can use strlcpy() instead of
strcpy()/strncpy()/memcpy() in this case.

Nowadays, we already have two modules using this function:
[douglas@localhost net]$ grep strlcpy *.c
acenic.c:       strlcpy(info->driver, "acenic", sizeof(info->driver));
acenic.c:               strlcpy(info->bus_info, pci_name(ap->pdev),
acenic.mod.c:   { 0x73e20c1c, "strlcpy" },
hp100.c:        strlcpy(lp->id, eid, HP100_SIG_LEN);


Note this part of strlcpy article from http://lwn.net:

"Linus agreed that following OpenBSD's lead was the right way forward,
and strlcpy() is in his BitKeeper repository, waiting for 2.5.71.
There has also been a flurry of activity to convert kernel code over
to the new function. By the time 2.6.0 comes out, strncpy() may no
longer have a place in the Linux kernel."

Source: http://lwn.net/Articles/33812/

Sincerely,
Douglas Schilling Landgraf

On 2/27/07, burns.ethan@gmail.com <burns.ethan@gmail.com> wrote:
> On Tue, Feb 27, 2007 at 06:31:18PM +0100, Bernhard R. Link wrote:
> > * burns.ethan@gmail.com <burns.ethan@gmail.com> [070227 17:41]:
> > > Looks like strlcpy() would solve both these problems.
> >
> > While there may be cases where it is useful, it normally solves
> > a problem that is not there.
> >
> >         ssize = strlen(src) + 1;
> >         if( ssize > dsize )
> >                 return ERROR;
> >         memcpy(dest, src, ssize);
> >
> > is the same like
> >
> > >     ssize = strlcpy(dest, src, dsize);
> > >     if (ssize >= dsize - 1)
> > >             return ERROR;
> > >
> > > Here we have dest guaranteed to be terminated, and if the source string is
> > > greater than the dest - 1 (for the '\0'), we can bail out.
>
> Sure, however your way allows for the dest buff length test to be left off
> (forgotten).  If the convention was to use strlcpy() the test is forced by
> requiring the length argument to be passed.  strlcpy() uses memcpy()
> under-the-hood anyway so there's no real efficiency differences here, AFAIK.
>
> Also, the strlcpy() version is 1 line shorter (which is not *terribly*
> important) and arguably more readable (not a very strong argument).
>
> Finally if truncation is not a problem, strlcpy() handles this case just
> as fine as anything and is probably preferable to a memcpy() with a length
> test.  So might as well use strlcpy() in both places for consistency.
>
>
>                 --Ethan
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
