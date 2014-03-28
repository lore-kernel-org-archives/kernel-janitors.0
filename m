From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Fri, 28 Mar 2014 14:13:33 +0000
Subject: Re: [patch] i40e: remove an unneeded check
Message-Id: <1396016013.2287.8.camel@jtkirshe-mobl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-TgghS8gJ9ULB+y+Kf0H4"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140328082919.GM25192@mwanda>
In-Reply-To: <20140328082919.GM25192@mwanda>
To: kernel-janitors@vger.kernel.org


--=-TgghS8gJ9ULB+y+Kf0H4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-03-28 at 11:29 +0300, Dan Carpenter wrote:
> We know "ret" is zero here.  No need to check again.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, I have added your patch to my queue.

--=-TgghS8gJ9ULB+y+Kf0H4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCgAGBQJTNYONAAoJEOVv75VaS+3OREEQAJA1DU3Iio2Q+js0mmIQRRhG
f+LKw8ijdlhC51dPDDelZ6S/l7GRsLF98gK4NBNOH+ImGnLP3AnltbpU63vQjGY7
hp0VY2xpeuyrOXoXXKMTEx7lOum5v4YlVwOieYDWiwn7FVBeROWC+DzLox0Ddbnc
JiPADyKPs0ydEoz5u35+K17xSUJYYUF61pPSFExh/5aHCNeS21a2GqeP5ZozNSgA
RxSUtVwq2PLrIR3JWUXlz+SGKEkBqX8JXpjJ8/Zxh8MDJ3dhH8zqwdoUzpZndvDb
8B0R7C0PL0Bq8yniQBxm0XVJW0WyBO/t1dq/V7qBxIiHY7T4Nc0NA4sHh0EWIKjG
VUxaCQ6KD+xkjTvvyPf0HicZqETNcJpzX1aL4MUQFHX+ES3b6FJxn6JaOWifc8f/
BD0006AMr1ItOip1fX8gth442d7Poid1hy3MaNQfIXAp/watM7q+21TYn0yW8Hrm
cFF7aiKZrjCmTmfVfoIhFnh7Ik4viowQU+oLDI4+m1jBfhuu+TgocxfJYtUkOeWs
T2e6+1RENM6oG9M5cAjfit/Sv1F4ZoDBfhTFN3GdzXRjJWPfQkZk0Ihnm1mfTHuA
4Ju4ANBxCEpjzoCk+MZxATzwRHGGjiTBKv80oXlrRoIsw9346t9OaZCXR/B1/t1c
oYCdFuPmhE/8jMr+Xnl1
=H7qt
-----END PGP SIGNATURE-----

--=-TgghS8gJ9ULB+y+Kf0H4--

