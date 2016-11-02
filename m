From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 02 Nov 2016 17:57:00 +0000
Subject: Re: [PATCH] drm/sun4i: Fix error handling
Message-Id: <20161102175700.qxqoljcjqse3nblr@lukather>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="i2vnxodjqnkrhirk"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030084926.15303-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030084926.15303-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@linux.ie, wens@csie.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--i2vnxodjqnkrhirk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2016 at 09:49:26AM +0100, Christophe JAILLET wrote:
> 'sun4i_layers_init()' returns an error pointer in case of error, not
> NULL. So test it with IS_ERR.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--i2vnxodjqnkrhirk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYGijnAAoJEBx+YmzsjxAgX40P/AlXfjSaQGT41imUxz8AEkN4
rh1TXxYzZMqTlbDzxE6vSOf94ocKxb1pDm3Nd1fa0gUzpJwCp06DVWYSaSdzlEiK
t4uw5ehrJQYQGMiZd+k8R8eX83O456ptByOwy0Kki3jcn1ebOM53tmz9YS5YTEfR
Y5Npmdse5iYSW//ezE4RlBdDVwGT7J6n1aZXsOBmvZ/C87tXi+pX6oSS8cBvM15B
z8gaRieSMui0wr9v2dcwjqkaDDtN7YeLPttRVLxVvJznvn5ZPq3kqd7XfO43skIn
sLtfiBY6kj3iCAe3bbGL77zU0eiFfODzPgpfEIUwByYvhxnNUnrwL6wEO/1iuGb2
Vjta+H+mYgEFOdTJ+d9M+juOuvUCFMKnthp6MCA6GBAjBgmfwJAlvtvaT+2m5nje
Bv3xtlasi5z3eUGoZJeX2l3TUArV8MILZxbhd2XiVSxeC0jAswEEbmEDJVrrmE9E
0L5EpiB3MrM2RApdK8NV4rekxuZd9rh9KAY8wdI5zn1Cx0X5Ds7pFYYh8r9vIMCQ
zu6LPD6UzQ1XftIi4K30jHxCgXfeqlpIV53Djnkyn/wwlqHnIWzvdMj+ldANAGo1
f8c7FFwd5SZXDZUlQYtMbKmaAo/Xkkpet5Aac3AT+Zp8JekcBok8cxTjMgELEsTn
YCdTBu7N70MldqEPj2dS
=HA0i
-----END PGP SIGNATURE-----

--i2vnxodjqnkrhirk--
