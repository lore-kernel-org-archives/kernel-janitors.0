From: Pavel Machek <pavel@ucw.cz>
Date: Sat, 23 Mar 2019 09:29:04 +0000
Subject: Re: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <20190323092904.GA24127@amd>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="J/dobhs11T7y2rNN"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024523.162210-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024523.162210-1-yuehaibing@huawei.com>
To: kernel-janitors@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-03-23 02:45:23, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/leds/leds-lt3593.c: In function 'lt3593_led_probe':
> drivers/leds/leds-lt3593.c:69:19: warning:
>  variable 'flags' set but not used [-Wunused-but-set-variable]
>=20
> It's never used since inroduction in
> commit 8cd7d6daba93 ("leds: lt3593: Add device tree probing glue")
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Does the driver work for you? I mean... take a look at the code, those
flags seem to be needed.

You probably want to cc original author of the commit.

									Pavel

> ---
>  drivers/leds/leds-lt3593.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
> index 54f0e5dbdbd0..912b8d1bbd92 100644
> --- a/drivers/leds/leds-lt3593.c
> +++ b/drivers/leds/leds-lt3593.c
> @@ -66,7 +66,6 @@ static int lt3593_led_probe(struct platform_device *pde=
v)
>  	struct lt3593_led_data *led_data;
>  	struct fwnode_handle *child;
>  	int ret, state =3D LEDS_GPIO_DEFSTATE_OFF;
> -	enum gpiod_flags flags =3D GPIOD_OUT_LOW;
>  	const char *tmp;
> =20
>  	if (!dev->of_node)
> @@ -101,10 +100,8 @@ static int lt3593_led_probe(struct platform_device *=
pdev)
>  	if (!fwnode_property_read_string(child, "default-state", &tmp)) {
>  		if (!strcmp(tmp, "keep")) {
>  			state =3D LEDS_GPIO_DEFSTATE_KEEP;
> -			flags =3D GPIOD_ASIS;
>  		} else if (!strcmp(tmp, "on")) {
>  			state =3D LEDS_GPIO_DEFSTATE_ON;
> -			flags =3D GPIOD_OUT_HIGH;
>  		}
>  	}
>=20
>=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyV/GAACgkQMOfwapXb+vLgHwCgmvPRJmz0gFD14tdIdyUntDD9
aVIAniZjxfF+8p3L0NMOeedaW3IDwDzn
=2BCe
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
