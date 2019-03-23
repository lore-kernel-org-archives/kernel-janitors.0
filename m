From: Pavel Machek <pavel@ucw.cz>
Date: Sat, 23 Mar 2019 10:15:58 +0000
Subject: Re: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <20190323101558.GC24127@amd>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="WfZ7S8PLGjBY9Voh"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024523.162210-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024523.162210-1-yuehaibing@huawei.com>
To: kernel-janitors@vger.kernel.org


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-03-23 11:13:25, Daniel Mack wrote:
> On 23/3/2019 10:55 AM, YueHaibing wrote:
> >>> ---
> >>>  drivers/leds/leds-lt3593.c | 3 ---
> >>>  1 file changed, 3 deletions(-)
> >>>
> >>> diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
> >>> index 54f0e5dbdbd0..912b8d1bbd92 100644
> >>> --- a/drivers/leds/leds-lt3593.c
> >>> +++ b/drivers/leds/leds-lt3593.c
> >>> @@ -66,7 +66,6 @@ static int lt3593_led_probe(struct platform_device =
*pdev)
> >>>  	struct lt3593_led_data *led_data;
> >>>  	struct fwnode_handle *child;
> >>>  	int ret, state =3D LEDS_GPIO_DEFSTATE_OFF;
> >>> -	enum gpiod_flags flags =3D GPIOD_OUT_LOW;
> >>>  	const char *tmp;
> >>> =20
> >>>  	if (!dev->of_node)
> >>> @@ -101,10 +100,8 @@ static int lt3593_led_probe(struct platform_devi=
ce *pdev)
> >>>  	if (!fwnode_property_read_string(child, "default-state", &tmp)) {
> >>>  		if (!strcmp(tmp, "keep")) {
> >>>  			state =3D LEDS_GPIO_DEFSTATE_KEEP;
> >>> -			flags =3D GPIOD_ASIS;
> >>>  		} else if (!strcmp(tmp, "on")) {
> >>>  			state =3D LEDS_GPIO_DEFSTATE_ON;
> >>> -			flags =3D GPIOD_OUT_HIGH;
> >>>  		}
>=20
> With only a single statement left in either branch, you can now remove
> the curly braces as well.

If I look at code below, there's no difference between DEFSTATE_KEEP
and DEFSTATE_ON, right? I can't see how it works.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyWB14ACgkQMOfwapXb+vLLwQCgr+gJ1AAZWzuzZXtKFybdY6mM
44sAn3LAJEhFs0+0/3H7J07t2OetOM57
=r+Rg
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
