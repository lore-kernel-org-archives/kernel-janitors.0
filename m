From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Sat, 17 Feb 2007 15:56:57 +0000
Subject: Re: [KJ] why so many more "down()" than "down_interruptible()"
Message-Id: <20070217155657.GA5498@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702170754290.23563@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702170754290.23563@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sat, Feb 17, 2007 at 09:03:59AM -0500, Robert P. J. Day wrote:
> On Sat, 17 Feb 2007, Arnd Bergmann wrote:
>=20
> > On Saturday 17 February 2007 14:00, Robert P. J. Day wrote:
> > > =A0 that's not what i see. =A0just counting the calls under drivers/,
> > > it looks like there's about four times as many calls of down() as
> > > down_interruptible(). =A0is there some reason that the actual stats
> > > differ so markedly from the claim in love's book? =A0just curious.
> >
> > Using down_interruptible is hard: You need to be in a place where
> > you can return -EINTR (or -ERESTART*) to user space, and you need to
> > undo everything that your function did before the down_interruptible
> > failed.
>=20
> oh, i believe your logic.  so it's odd that both love's kernel book
> and LDD3 seem adamant that the *interruptible* version is the
> preferred one.
>=20

I think there's no contradiction here. Preffered method is not always the=20
easiest one. You don't want your system to hang entirely and lose your work
cause of a weird locking bug.

--=20
Ahmed S. Darwish
http://darwish.07.googlepages.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
