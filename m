From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 08 Jan 2007 07:09:18 +0000
Subject: Re: [KJ] ruminations on kernel.h
Message-Id: <Pine.LNX.4.64.0701080206110.19496@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701071524240.14075@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 7 Jan 2007, Paul Bonser wrote:

> On 1/7/07, Ahmed S. Darwish <darwish.07@gmail.com> wrote:
> > I think so too, Kernel.h is just a collection of loosly connected maros.
> > Even the naming of the header relate nothing to its contents (printk Macros,
> > container_of, ..).
> > But will the community accept it easily ?. I mean this will mean patching a
> > very
> > big number of files to use the new names/header files.
> >
> > >   thoughts?  i might whip up a patch just to get some feedback.
> >
> > If the community accepted it, I have some time to handle the task of
> > patching
> > the files to use the new header files.
>
> As a temporary step, kernel.h could be changed to include the files
> that the macros are partitioned out into, and then it could be
> encouraged to include only the actual needed files in any newly
> created files and the existing files that include kernel.h could be
> more slowly converted over to just include the files they need. What
> does everyone think of this idea? Is it too much of a hack, or a
> more graceful way to transition?

that's exactly the approach i was thinking of, to minimize the
disruption.  and the advantage would be that it might make the
generated kernel-doc output more organized, since you could include
those header files individually and break the kernel-doc into more
independent chunks.

i'll give it some more thought.  there's little point trying anything
like this until 2.6.20 is out.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
