From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 04 May 2007 16:39:41 +0000
Subject: Re: [KJ] what's the point of all those "#if[n]def __KERNEL__"
Message-Id: <Pine.LNX.4.64.0705041230230.25295@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1376106618-1178296781=:25295"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705040337450.19670@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705040337450.19670@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1376106618-1178296781=:25295
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, 4 May 2007, Arnd Bergmann wrote:

> On Friday 04 May 2007, Robert P. J. Day wrote:
> > =A0 i'm well aware that the point of the conditional __KERNEL__
> > directives is to identify header file content that isn't appropriate
> > for userspace, so it can be stripped out when running "make
> > headers_install". =A0but is there any *other* purpose to that check?
>
> not any more
>
> > that is, if a header file is not being exported to userspace, is there
> > any point to having a test of that sort?
>
> no
>
> > =A0 i'm only asking because i was poking around and noticed that
> > lots of header files contain a check of that sort that aren't marked
> > for export to userspace. =A0for example. some arch/ppc headers:
> >
> > $ grep -r "#if.*__KERNEL__" arch/ppc
> > arch/ppc/platforms/mvme5100.h:#ifdef __KERNEL__
> > arch/ppc/platforms/mbx.h:#ifdef __KERNEL__
> > arch/ppc/platforms/pq2ads.h:#ifdef __KERNEL__
> > arch/ppc/platforms/tqm8xx.h:#ifdef __KERNEL__
> > arch/ppc/platforms/ivms8.h:#ifdef __KERNEL__
> > ... snip ...
> >
> > those headers certainly don't get anywhere near userspace, so what
> > exactly are they testing for? =A0i'm just curious.
>
> This is historic baggage. ppc used to install all headers
> and therefore we had #ifdf __KERNEL__ in most of them to avoid
> the contents to be seen.

i'm wondering if there's any value (as a short KJ project) to go
through the header files and rip out that historical cruft.

a while back, i submitted a few patches that removed, from the Kbuild
files, any header files that ended up being empty (files whose content
was *entirely* contained within the "__KERNEL_" symbol).  but i never
bothered looking for header files that had those proprocessor
directives for no good reason.

obviously, stuff like that doesn't hurt, it's just, you know, icky.

rday
--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=3DMain_Page
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--8323328-1376106618-1178296781=:25295
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--8323328-1376106618-1178296781=:25295--
