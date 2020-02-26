From: Pavel Machek <pavel@ucw.cz>
Date: Wed, 26 Feb 2020 13:35:42 +0000
Subject: Re: [PATCH -next] leds: leds-bd2802: remove set but not used variable 'pdata'
Message-Id: <20200226133542.GC4080@duo.ucw.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="QRj9sO5tAVLaXnSD"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108015322.51103-1-yuehaibing@huawei.com>
In-Reply-To: <20200108015322.51103-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-01-08 01:53:22, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/leds/leds-bd2802.c: In function 'bd2802_probe':
> drivers/leds/leds-bd2802.c:663:35: warning:
>  variable 'pdata' set but not used [-Wunused-but-set-variable]
>=20
> commit 4c3718f9d6a6 ("leds: bd2802: Convert to use GPIO descriptors")
> left behind this unused variable.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks, applied.
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZ0LgAKCRAw5/Bqldv6
8pH4AJ9xvxAZkpy6T7XHvo8qDEytYkQFMQCgsyB2TzRbBnybDx7t/BwUvk621bg=
=WhOt
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
