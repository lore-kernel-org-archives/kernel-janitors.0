From: Mark Brown <broonie@kernel.org>
Date: Fri, 28 Jun 2019 14:36:28 +0000
Subject: Re: [PATCH][next] regulator: lp87565: fix missing break in switch statement
Message-Id: <20190628143628.GJ5379@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="YPJ8CVbwFUtL7OFW"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627131639.6394-1-colin.king@canonical.com>
In-Reply-To: <20190627131639.6394-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Keerthy <j-keerthy@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--YPJ8CVbwFUtL7OFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2019 at 02:16:39PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the LP87565_DEVICE_TYPE_LP87561_Q1 case does not have a
> break statement, causing it to fall through to a dev_err message.
> Fix this by adding in the missing break statement.

This doesn't apply against current code, please check and resend.

--YPJ8CVbwFUtL7OFW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0WJewACgkQJNaLcl1U
h9DWSwf/fWJcNMzQ0hbKhW6O4MWjfhdLsKRJMZucvTMjF88x6m0tLqengpmOKGCi
dONoVEtGU8VQ+y+HssN7utIBx01H8e3Hs0/uLhUAkqgTdDc3pXPA9hdwqwLIfd+/
I+fNP2IoaU+mToQuD+JmIB2FEHn4KWyZSa7Z/ioV/bj2/tXMOA4zZzZjuqbFJWfi
Ahiz89WLNBqa6QKQs4JtuFb2nbBqZwOged0TNGRSeQoWN+mwlZiq5w7tjETWdJtz
+8mDkTiqgQAuLL2lf86D9K5tqzNZHLaOJ6Vm7/h5W7F4GVG23uEDsrBZm013ZBTW
lcPPI9loppwvqM1I8YMT9noJFqHHFQ==
=e0rj
-----END PGP SIGNATURE-----

--YPJ8CVbwFUtL7OFW--
