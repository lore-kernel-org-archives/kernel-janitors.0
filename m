From: Wolfram Sang <w.sang@pengutronix.de>
Date: Fri, 05 Aug 2011 22:37:40 +0000
Subject: Re: [PATCH 4/4] drivers/leds/leds-pca9532.c: delete useless
Message-Id: <20110805223740.GA31186@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="envbJBWh7q8WU6mo"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312453774-23333-1-git-send-email-julia@diku.dk>
 <1312453774-23333-5-git-send-email-julia@diku.dk>
In-Reply-To: <1312453774-23333-5-git-send-email-julia@diku.dk>
To: Julia Lawall <julia@diku.dk>
Cc: Riku Voipio <riku.voipio@iki.fi>, kernel-janitors@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2011 at 12:29:34PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>=20
> Delete nontrivial initialization that is immediately overwritten by the
> result of an allocation function.
>=20
> The semantic match that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @@
> type T;
> identifier i;
> expression e;
> @@
>=20
> (
> T i =3D \(0\|NULL\|ERR_PTR(...)\);
> |
> -T i =3D e;
> +T i;
> )
> ... when !=3D i
> i =3D \(kzalloc\|kcalloc\|kmalloc\)(...);
>=20
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

BTW LED patches seem to go via akpm these days...

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk48cLQACgkQD27XaX1/VRvo0QCgr9txxteL7yxbL+aVvNVQ/XJv
GZ8AniX4IXkwQyKyB08Q3qzCZGpPJQEu
=zTrG
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
