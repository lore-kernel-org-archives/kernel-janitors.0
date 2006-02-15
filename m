From: Nico Golde <nico@ngolde.de>
Date: Wed, 15 Feb 2006 16:30:21 +0000
Subject: Re: [KJ] [PATCH] Fix warning in drivers/usb/media/ov511.c
Message-Id: <20060215163021.GC6292@ngolde.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70619962605116982=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139970072.25492.4.camel@localhost.localdomain>
In-Reply-To: <1139970072.25492.4.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org


--===============70619962605116982==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hallo Greg,

* Greg KH <greg@kroah.com> [2006-02-15 11:14]:
> On Tue, Feb 14, 2006 at 08:21:12PM -0600, Matthew Martin wrote:
[...]=20
> >  	struct usb_ov511 *ov =3D cd_to_ov(cd);
> > -	unsigned char exp;
> > +	unsigned char exp =3D '\0';
>=20
> What's wrong with just "0" here?

Nothing, doesnt matter.
Regards Nico
--=20
Nico Golde - JAB: nion@jabber.ccc.de | GPG: 0x73647CFF
http://www.ngolde.de | http://www.muttng.org | http://grml.org
Forget about that mouse with 3/4/5 buttons -
gimme a keyboard with 103/104/105 keys!

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFD81cdHYflSXNkfP8RAqDtAJ0WNdUcyaQw5mPSEd8CrpT7X9I4UgCfZkar
rUWtPtrSSlmbwrSGA8VMU6o=
=E8JT
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--

--===============70619962605116982==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70619962605116982==--
