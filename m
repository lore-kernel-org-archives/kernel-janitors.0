From: Nico Golde <nico@ngolde.de>
Date: Tue, 28 Jun 2005 16:06:59 +0000
Subject: Re: [KJ] typo?
Message-Id: <20050628160659.GC19341@ngolde.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68066246988559564=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050628141624.GA6647@ngolde.de>
In-Reply-To: <20050628141624.GA6647@ngolde.de>
To: kernel-janitors@vger.kernel.org


--===============68066246988559564==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,
* maximilian attems <janitor@sternwelten.at> [2005-06-28 18:04]:
> On Tue, 28 Jun 2005, Nico Golde wrote:
>=20
> > * Matthew Wilcox <matthew@wil.cx> [2005-06-28 16:41]:
> > > On Tue, Jun 28, 2005 at 04:16:25PM +0200, Nico Golde wrote:
> > > > Hi,
> > > > do you think that:
> > > > printk(KERN_EMERG "Press L1-A to return to the boot prom\n")
> > > > is a typo?
> > >=20
> > > On Sparc, no.  What do you think is a typo about it?
> >=20
> > I thought it is because if I understood boot prom correctly
> > it is something which has to do with networking and booting.
> > But here a user interaction is meant (because of the press)
> > and in my opinion this part of the panic code has nothing to
> > do with networking.
> >     regards nico
>=20
> please use more recent sources.

i used 2.6.12-git10

> for people not used to sparc the message got really improved:
>                 printk(KERN_EMERG "Press Stop-A (L8-A) to return to the b=
oot prom\n");
> remember my first time glaring at it. :)
>=20
> anyway if you aren't exposed to sparc you could ignore code inside of
> #ifdef __sparc__

ok thanks!
regards nico

--=20
Nico Golde - JAB: nion@jabber.ccc.de | GPG: 0x73647CFF
http://www.ngolde.de | http://www.muttng.org | http://grml.org=20
VIM has two modes - the one in which it beeps=20
and the one in which it doesn't -- encrypted mail preferred

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCwXWiHYflSXNkfP8RAtCPAJ9UFD/XTCtG6ylj65rrlSAo9MNhDQCbBFWX
uQnaW5dzZ1Nd4HP0kfAH6q8=
=d03k
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--

--===============68066246988559564==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68066246988559564==--
