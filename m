From: Nico Golde <nico@ngolde.de>
Date: Tue, 28 Jun 2005 16:03:08 +0000
Subject: Re: [KJ] typo?
Message-Id: <20050628160308.GB19341@ngolde.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24952797163321883=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050628141624.GA6647@ngolde.de>
In-Reply-To: <20050628141624.GA6647@ngolde.de>
To: kernel-janitors@vger.kernel.org


--===============24952797163321883==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi
* Matthew Wilcox <matthew@wil.cx> [2005-06-28 17:43]:
> On Tue, Jun 28, 2005 at 04:45:36PM +0200, Nico Golde wrote:
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
>=20
> I think you misunderstand what a boot prom is.  There is no typo here.

Please explain, why it is no typo..
regards nico
--=20
Nico Golde - JAB: nion@jabber.ccc.de | GPG: 0x73647CFF
http://www.ngolde.de | http://www.muttng.org | http://grml.org=20
VIM has two modes - the one in which it beeps=20
and the one in which it doesn't -- encrypted mail preferred

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCwXS8HYflSXNkfP8RAnyUAKCF8KhY4NFU2N6Fcce1wjqNnUHuxACglxJV
g8t+95JG7npPQ/VHazuy148=
=2+8Z
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--

--===============24952797163321883==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24952797163321883==--
