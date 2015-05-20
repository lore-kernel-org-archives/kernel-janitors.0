From: Mark Brown <broonie@kernel.org>
Date: Wed, 20 May 2015 18:10:20 +0000
Subject: Re: [PATCH] regulator: max77686: fix gpio_enabled shift wrapping bug
Message-Id: <20150520181020.GO21577@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Iys0Un1O+0sigPHU"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150515092501.GB21508@mwanda>
 <5555C814.7030405@samsung.com>
 <1431968463.2870.34.camel@perches.com>
In-Reply-To: <1431968463.2870.34.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Dan Carpenter <dan.carpenter@oracle.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--Iys0Un1O+0sigPHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2015 at 10:01:03AM -0700, Joe Perches wrote:
> The code should handle more than 32 bits here because "id"
> can be a value up to MAX77686_REGULATORS (currently 34).

Applied, thanks.

--Iys0Un1O+0sigPHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVXM4LAAoJECTWi3JdVIfQR4kH/RFotDAG5XgctIvcDgkifn2n
I6A7CCqf5L+qkkhQ5O/OCSvacxynXjpHzKv2y7o3Lzim8gpCn4qbx6bSp/9+IbEm
jSVa3UvxwJhaMpnPbSpkmx1Sm9kOyXm/2FsWi8XezO0VMes18a2T5fdixfm4/8zJ
iNIDRDKrj6O1Wi7Pj7n6lb4HPH54HptwSHapGOjvihvHUvTjKVqH4EynTpQ88a+e
KtK2q5lBWsfI+DfdeZaic/GG/OICgaddjmLmHkQO5MzB9X8QZ3Kq6kszNVacrgdQ
3V4iC3PHkLyfCw6T5aY85K2+GmjT0rWLXeA5iqumtPRFnSJAKK9Kx7aNN1yjiho=
=yj3z
-----END PGP SIGNATURE-----

--Iys0Un1O+0sigPHU--
