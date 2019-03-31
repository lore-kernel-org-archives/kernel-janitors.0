From: Pavel Machek <pavel@ucw.cz>
Date: Sun, 31 Mar 2019 18:38:22 +0000
Subject: Re: [PATCH] leds: blinkm: clean up double assignment to data->i2c_addr
Message-Id: <20190331183822.GA7642@amd>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330203757.8877-1-colin.king@canonical.com>
In-Reply-To: <20190330203757.8877-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Jan-Simon Moeller <jansimon.moeller@gmx.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-03-30 20:37:57, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently data->i2c_addr is being assigned twice, first with the
> value 0x09 and then immediately afterwards with the value 0x08.
> The first assignment is redundant and can be removed.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyhCR4ACgkQMOfwapXb+vIs9wCfSrbnqR8+G1kt7IDQ4GohkC+Y
Fb8AoLZDxEbCOlhvhnD0E/a1kGA7v1Fx
=YKgB
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
