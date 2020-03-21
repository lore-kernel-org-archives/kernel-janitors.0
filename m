From: Pavel Machek <pavel@ucw.cz>
Date: Sat, 21 Mar 2020 15:46:21 +0000
Subject: Re: [PATCH] leds: lm3532: make bitfield 'enabled' unsigned
Message-Id: <20200321154621.GG8386@duo.ucw.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="GUPx2O/K0ibUojHx"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200313171937.220884-1-colin.king@canonical.com>
In-Reply-To: <20200313171937.220884-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-03-13 17:19:37, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The bitfield 'enabled' should bit unsigned, so make it unsigned.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXnY2zQAKCRAw5/Bqldv6
8mk4AJ9gp0fhjV3eJslDQl+7vsTyWVpkFACgttrxg5o1SM8dFpFCBKlNFhfbsLY=
=kzCS
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--
