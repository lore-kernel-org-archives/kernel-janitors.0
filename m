From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 27 Aug 2020 09:21:34 +0000
Subject: Re: [PATCH] drm/mgag200: fix spelling mistake "expeced" -> "expected"
Message-Id: <63a54e7a-38ce-d32f-f7c0-ca04707ae8de@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="fPWsxPpPJj3E4g7J17m5zELBoVw8eziG9"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200826084727.42703-1-colin.king@canonical.com>
In-Reply-To: <20200826084727.42703-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fPWsxPpPJj3E4g7J17m5zELBoVw8eziG9
Content-Type: multipart/mixed; boundary="FoGFcXpSXbDSMaDgetwZhxIi6Q8ObDg3w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <63a54e7a-38ce-d32f-f7c0-ca04707ae8de@suse.de>
Subject: Re: [PATCH] drm/mgag200: fix spelling mistake "expeced" -> "expected"
References: <20200826084727.42703-1-colin.king@canonical.com>
In-Reply-To: <20200826084727.42703-1-colin.king@canonical.com>

--FoGFcXpSXbDSMaDgetwZhxIi6Q8ObDg3w
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 26.08.20 um 10:47 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in a drm_warn message. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks! Applied to drm-misc-next.

Best regards
Thomas

> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mg=
ag200/mgag200_drv.c
> index b282b0e42c2d..771b26aeee19 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -168,7 +168,7 @@ static void mgag200_g200_interpret_bios(struct mga_=
device *mdev,
>  		return;
>  	}
>  	if (pins_len !=3D expected_length[version]) {
> -		drm_warn(dev, "Unexpected BIOS PInS size: %d expeced: %d\n",
> +		drm_warn(dev, "Unexpected BIOS PInS size: %d expected: %d\n",
>  			 pins_len, expected_length[version]);
>  		return;
>  	}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--FoGFcXpSXbDSMaDgetwZhxIi6Q8ObDg3w--

--fPWsxPpPJj3E4g7J17m5zELBoVw8eziG9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9Hex4UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOBQAgAiL4kFTimHbHupiRn5WOvA4vbyT6w
lwXW36ZGshiV84ZvnTQ0/IboK15tbYUBcf/AgfkoVDsG4DTyI40z5W/e/ULzM7EA
ePIjzJb0dPPyAEzo2GIL6Xxp8zfAwP3U6OXrlYYPlVLaIh53qYVD9+oTHgRln2LZ
e/hVlpck4I4ZknAWnvSEi3h2dfWSdgUe7BwfJkr6aha0REAO0sZ5KQ7WMQL4a3Xs
dGti4fST0KPjaNVsj01ism/v0Vso3J7Hn8bNrc0UqHOS/Vy1gwJw1hLr3KU9Tras
S9MFDhVG7t6EzdjtJ86dBQ6Us+b8XGbiUUGO0ivrbbfsi6pg7y3eNp4SaA==
=jjLa
-----END PGP SIGNATURE-----

--fPWsxPpPJj3E4g7J17m5zELBoVw8eziG9--
