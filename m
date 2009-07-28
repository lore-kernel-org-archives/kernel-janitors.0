From: Wolfram Sang <w.sang@pengutronix.de>
Date: Tue, 28 Jul 2009 16:31:04 +0000
Subject: Re: [rtc-linux] [PATCH 7/9] drivers/rtc: correct error-handling
Message-Id: <20090728163104.GA15033@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Qxx1br4bt0+wmkIi"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907281755000.28189@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907281755000.28189@ask.diku.dk>
To: rtc-linux@googlegroups.com
Cc: p_gortmaker@yahoo.com, a.zummo@towertech.it, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2009 at 05:55:33PM +0200, Julia Lawall wrote:
>=20
> From: Julia Lawall <julia@diku.dk>
>=20
> This code is not executed before ds1307->rtc has been successfully
> initialized to the result of calling rtc_device_register.  Thus the test
> that ds1307->rtc is not NULL is always true.
>=20
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @match exists@
> expression x, E;
> statement S1, S2;
> @@
>=20
> x =3D rtc_device_register(...)
> ... when !=3D x =3D E
> (
> *  if (x =3D=3D NULL || ...) S1 else S2
> |
> *  if (x =3D=3D NULL && ...) S1 else S2
> )
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpvJ8gACgkQD27XaX1/VRsSigCfTHe/XDNQayLcO0AEucqjr9rH
PT4AoIVxzAQLC7hVJ/s1QBfelzqno9AM
=pgDD
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
