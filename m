From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 17 Feb 2007 14:03:59 +0000
Subject: Re: [KJ] why so many more "down()" than "down_interruptible()"
Message-Id: <Pine.LNX.4.64.0702170902470.24294@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-665039285-1171721039=:24294"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702170754290.23563@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702170754290.23563@CPE00045a9c397f-CM001225dbafb6>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-665039285-1171721039=:24294
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sat, 17 Feb 2007, Arnd Bergmann wrote:

> On Saturday 17 February 2007 14:00, Robert P. J. Day wrote:
> > =A0 that's not what i see. =A0just counting the calls under drivers/,
> > it looks like there's about four times as many calls of down() as
> > down_interruptible(). =A0is there some reason that the actual stats
> > differ so markedly from the claim in love's book? =A0just curious.
>
> Using down_interruptible is hard: You need to be in a place where
> you can return -EINTR (or -ERESTART*) to user space, and you need to
> undo everything that your function did before the down_interruptible
> failed.

oh, i believe your logic.  so it's odd that both love's kernel book
and LDD3 seem adamant that the *interruptible* version is the
preferred one.

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
--0-665039285-1171721039=:24294
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--0-665039285-1171721039=:24294--
