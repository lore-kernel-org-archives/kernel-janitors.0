From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 28 May 2007 17:46:56 +0000
Subject: Re: [KJ] replacing old-style "non-seekable" errors with "no_llseek"
Message-Id: <Pine.LNX.4.64.0705281342510.12930@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1096468754-1180374416=:12930"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705271722580.13051@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705271722580.13051@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1096468754-1180374416=:12930
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, 28 May 2007, Arnd Bergmann wrote:

> On Sunday 27 May 2007, Robert P. J. Day wrote:
> > can be rewritten more cleanly using the no_llseek() helper routine,
> > and just assigning no_llseek to the llseek member of the
> > file_operations struct, as in:
> >
> > =A0 =A0 .llseek =3D no_llseek
> >
> > and deleting the old routine. =A0am i reading that correctly? =A0or is
> > there more to it than that?
>
> Actually, that is outdated as well.
>
> If the file descriptor cannot be seeked, you should set the open
> operation to nonseekable_open, or call that function from the
> driver's own open function.

ah, yes, i see that further down in the very article i linked to:

  http://lwn.net/Articles/97154/

so, in a nutshell, is whether something is seekable a yes/no
proposition?  or are there shades of gray to worry about?

that is, if it's obvious that some device is being set to be
non-seekable using one of the older techniques, is it appropriate to
just make it non-seekable using nonseekable_open()?

if not, is there some example in the kernel tree you can point at that
shows cases that deviate from the norm?  thanks.

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
--8323328-1096468754-1180374416=:12930
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--8323328-1096468754-1180374416=:12930--
