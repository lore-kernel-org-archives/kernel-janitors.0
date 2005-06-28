From: Nico Golde <nico@ngolde.de>
Date: Tue, 28 Jun 2005 14:45:36 +0000
Subject: Re: [KJ] typo?
Message-Id: <20050628144536.GC4054@ngolde.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62843423559923606=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050628141624.GA6647@ngolde.de>
In-Reply-To: <20050628141624.GA6647@ngolde.de>
To: kernel-janitors@vger.kernel.org


--===============62843423559923606==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Matthew,

* Matthew Wilcox <matthew@wil.cx> [2005-06-28 16:41]:
> On Tue, Jun 28, 2005 at 04:16:25PM +0200, Nico Golde wrote:
> > Hi,
> > do you think that:
> > printk(KERN_EMERG "Press L1-A to return to the boot prom\n")
> > is a typo?
>=20
> On Sparc, no.  What do you think is a typo about it?

I thought it is because if I understood boot prom correctly
it is something which has to do with networking and booting.
But here a user interaction is meant (because of the press)
and in my opinion this part of the panic code has nothing to
do with networking.
    regards nico
--=20
Nico Golde - JAB: nion@jabber.ccc.de | GPG: 0x73647CFF
http://www.ngolde.de | http://www.muttng.org | http://grml.org=20
VIM has two modes - the one in which it beeps=20
and the one in which it doesn't -- encrypted mail preferred

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCwWKQHYflSXNkfP8RAq8oAJ9yto2Y6exgmJ76hpIh9KP+HIlXFQCfZlAX
7nFHDXNfHsDgAfLdKCvIhZw=
=ku2D
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--

--===============62843423559923606==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62843423559923606==--
