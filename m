From: Sven Schuster <schuster.sven@gmx.de>
Date: Mon, 12 Jul 2004 16:26:11 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/sbus/char/ minmax removal and
Message-Id: <20040712162611.GA7460@zion.homelinux.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12423989874125341=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40F2B07C.9050108@gmx.net>
In-Reply-To: <40F2B07C.9050108@gmx.net>
To: kernel-janitors@vger.kernel.org


--===============12423989874125341==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Michael,

On Mon, Jul 12, 2004 at 05:38:36PM +0200, Michael Veeck told us:
> This patch (against 2.6.8-rc1) removes minmax-macros and changes calls
> to use kernel.h macros instead.
>=20
> Now heres the problem: Since all that is left on my minmax-todolist are=
=20
> arch-specific-files, is there a way to cross-compile the kernel image so=
=20
> that I can at least test if the patches compile? Sort of like "compile=20
> everything there is, even if its hardware that wont ever exist on my=20
> plattform" ?

maybe

make menuconfig ARCH=3Dinsert_needed_arch_here
make ARCH=3Dinsert_needed_arch_here

???


HTH

Sven

>=20
> Best regards
> Veeck
>=20
>=20

--=20
Linux zion 2.6.8-rc1 #1 Sun Jul 11 23:36:03 CEST 2004 i686 athlon i386 GNU/=
Linux
 18:24:27  up 18:42,  1 user,  load average: 0.03, 0.03, 0.00

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA8rujo4FAdB2PneQRAjBIAJ9h3Ra7MtUIU4Mzj8yDVfZnG6szqgCfTH3r
TT9IJZ25RK7M2ngGjXKAUbg=
=sOm/
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

--===============12423989874125341==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12423989874125341==--
