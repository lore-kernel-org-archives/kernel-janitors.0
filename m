From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Dec 2004 12:31:19 +0000
Subject: Re: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <200412201331.19917.arnd@arndb.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29746866994755239=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190903.GA30192@muc.de>
In-Reply-To: <20041219190903.GA30192@muc.de>
To: kernel-janitors@vger.kernel.org


--===============29746866994755239==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_XYsxB96FEOPwubs";
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit


--Boundary-02=_XYsxB96FEOPwubs
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On S=FCnndag 19 Dezember 2004 20:47, Matthew Wilcox wrote:
> On Sun, Dec 19, 2004 at 08:09:03PM +0100, Andi Kleen wrote:
> > Here's a proposed janitor project if anybody is interested:
> >=20
> > The current gcc 4.0 snapshots include some more warnings in -Wall
> > and changed some existing ones which makes a kernel compilation quite n=
oisy.=20
>=20
> I think it would get more takers if people didn't have to compile a new
> gcc. =A0If we had a list of -W... flags in older gccs that could simulate
> 90% of the warnings, this would make it possible for more people to work
> on it.

Maybe someone can make gcc-4 build logs available similar to the ones at
http://developer.osdl.org/cherry/compile/. In many cases it's not even
necessary to produce the warning with your own compiler in order to fix
it. This could also be combined with warnings from the various sparse-like
code checkers.

 Arnd <><



--Boundary-02=_XYsxB96FEOPwubs
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBxsYX5t5GS2LDRf4RAlSSAJ9VTZcb0toS/kO2lwVPXzWsEFOIfACfXXK/
uXz0t8fBHVCFHQrE/seriM4=
=PTy/
-----END PGP SIGNATURE-----

--Boundary-02=_XYsxB96FEOPwubs--

--===============29746866994755239==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29746866994755239==--
