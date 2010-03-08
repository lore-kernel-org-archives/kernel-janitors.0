From: Wolfram Sang <w.sang@pengutronix.de>
Date: Mon, 08 Mar 2010 04:02:13 +0000
Subject: Re: [patch] regulator: handle kcalloc() failure
Message-Id: <20100308040213.GI8548@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cVp8NMj01v+Em8Se"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100307123645.GB6469@bicker>
In-Reply-To: <20100307123645.GB6469@bicker>
To: Dan Carpenter <error27@gmail.com>, Liam Girdwood <lrg@slimlogic.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Julia Lawall <julia@diku.dk>, Dmitry Torokhov <dtor@mail.ru>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--cVp8NMj01v+Em8Se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 07, 2010 at 03:36:45PM +0300, Dan Carpenter wrote:
> Return -ENOMEM if kcalloc() fails
>=20
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--cVp8NMj01v+Em8Se
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkuUdsUACgkQD27XaX1/VRtE4gCguQme9vkTrK7Ww6xVRphvsqkZ
qBkAmgM2i1HCenHtTlQ2P+y/iTluAxbk
=UZGt
-----END PGP SIGNATURE-----

--cVp8NMj01v+Em8Se--
