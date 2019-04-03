From: Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 03 Apr 2019 20:49:50 +0000
Subject: Re: [PATCH] i2c: nomadik: remove an unnecessary NULL check in nmk_i2c_remove()
Message-Id: <20190403204950.r6ptd6qpritsgshr@ninjato>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ojyuo72apf2wxnsx"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328141609.GL32590@kadam>
In-Reply-To: <20190328141609.GL32590@kadam>
To: kernel-janitors@vger.kernel.org


--ojyuo72apf2wxnsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2019 at 05:16:09PM +0300, Dan Carpenter wrote:
> "res" can't be NULL because it's a pointer to somewhere in the middle of
> the "adev" struct.  Also probe() succeeded so there is no need to check
> here.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-next, thanks!


--ojyuo72apf2wxnsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlylHG4ACgkQFA3kzBSg
Kbb7zQ/7ByY3pF9Qvk1iebKYpjJdVNcJRsmdLzX4GGlKqeaquI0NXBjovHGpwzt2
2hGebuLSVTbv1LJhoPzNjxE5uXq5j4dfAss7u7lBvU4xiqgyyxMR2dHgbF2jKjKg
o7UvE/OFv91BGTx7pDNasIKzFfZSxhGoBZOuA8C1CxZrmOSaZsh8PnOmZFGfROjT
Lm0it/ekr/j5mv51S7b105eW47DF1KiiiuVrTMeZEJQT7H6JpzE3r90Oq1g+8VCO
HxIR9PD2m8XZ18pkYbX16kFPYQBCPdLckiQuwcz1zyeI28ubnvDHlu//4EuMsaYK
U4B8jJ6ndhjKmUJXC4qUxepFRlyBNYD/dT48ABqeYwHB1yA0+6cgqe09Xo4x+kDt
ADcriu0rSqT//buGrLgSb4J/+g3XbOupfjqOflBF8Nd7Bhm8+pP86RgYcglRw5bf
1gAYUMLg+fp+qFzk8/hPaQyCijly8j5NXaE4fixiWKRbFARtnGvnxIhuREZJAvzy
0jpMrFkodOolhAmUXNOD0iaUqD6XajtozpvhkJxpxHRVSDKyRGkl2lT7R8sSRlgG
6CXs3MKV3HESqHLRN5IbfPK6RMzQdLAVSbjdAiTMjz4Isaia9TxjR7O9gge/3xGe
bbiRpg12QIY6TFanZpQXrT/Qv3w8QL8eV7lANIceKksKwSaGZvg=
=CSlK
-----END PGP SIGNATURE-----

--ojyuo72apf2wxnsx--
