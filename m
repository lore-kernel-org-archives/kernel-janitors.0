From: Pavel Machek <pavel@ucw.cz>
Date: Mon, 27 Apr 2020 12:13:36 +0000
Subject: Re: [PATCH] leds: trigger: remove redundant assignment to variable ret
Message-Id: <20200427121336.GB544@duo.ucw.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="l76fUT7nc3MelDdI"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200420221229.99150-1-colin.king@canonical.com>
In-Reply-To: <20200420221229.99150-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-04-20 23:12:29, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable ret is being assigned with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqbMcAAKCRAw5/Bqldv6
8o7rAKCm8ntQEIFtZ61dXMpp4NXClLfyAQCfZtfwQz4pO6W+FS3+iyVfQR//BYc=
=omzN
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
