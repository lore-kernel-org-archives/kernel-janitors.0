From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 27 Jun 2019 07:57:55 +0000
Subject: Re: [PATCH][next] drm/mgag200: add in missing { } around if block
Message-Id: <23172c52-424f-747a-fa2d-117772759345@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="GMMH86bexZKtIQ8AtxPJFk9BipeWf1o9o"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190614143911.21806-1-colin.king@canonical.com>
In-Reply-To: <20190614143911.21806-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GMMH86bexZKtIQ8AtxPJFk9BipeWf1o9o
Content-Type: multipart/mixed; boundary="Zi3yHoGxLgC1dPVV2ZmECEj3hqC0qHWVb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <23172c52-424f-747a-fa2d-117772759345@suse.de>
Subject: Re: [PATCH][next] drm/mgag200: add in missing { } around if block
References: <20190614143911.21806-1-colin.king@canonical.com>
In-Reply-To: <20190614143911.21806-1-colin.king@canonical.com>

--Zi3yHoGxLgC1dPVV2ZmECEj3hqC0qHWVb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

The code still used to work because mgag200 and userspace switch to a
software cursor if the HW cursor is not available. Thank you for fixing
this bug.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Am 14.06.19 um 16:39 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is an if block that is missing the { } curly brackets. Add
> these in.
>=20
> Addresses-Coverity: ("Structurally dead code")
> Fixes: 94dc57b10399 ("drm/mgag200: Rewrite cursor handling")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/mgag200/mgag200_cursor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm=
/mgag200/mgag200_cursor.c
> index f0c61a92351c..117eaedec7aa 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> @@ -99,10 +99,11 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
> =20
>  	/* Pin and map up-coming buffer to write colour indices */
>  	ret =3D drm_gem_vram_pin(pixels_next, 0);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&dev->pdev->dev,
>  			"failed to pin cursor buffer: %d\n", ret);
>  		goto err_drm_gem_vram_kunmap_src;
> +	}
>  	dst =3D drm_gem_vram_kmap(pixels_next, true, NULL);
>  	if (IS_ERR(dst)) {
>  		ret =3D PTR_ERR(dst);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--Zi3yHoGxLgC1dPVV2ZmECEj3hqC0qHWVb--

--GMMH86bexZKtIQ8AtxPJFk9BipeWf1o9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0UdwMACgkQaA3BHVML
eiOSLwf/a25IYHnoB4UAQsiNGDE1rr7BxI7lFDeTm9EOR5//0qkYdxov8KisuA2Y
w111Trf+aFo2nurCKVfidDfrtTjLpz9/KOQDctmzQlFGGzXsHQf+bAA0Q1ZrJaJH
J9bJCVXUWCVh4LLaoaB7fA+XHscjXgzSpQxJ/pbRA9e1r18LFQEa+5KqQ/Bvvafn
vMubMLLNiBY1wz4nTU0GlnOgmLgcOK1GobBRZwkMVgE7CjSc46ZcKy2rLxjzTe7p
nrfE0g7eE2YfKhy9npTllokI/mOb4ydJt6Wr3WLhvaxfOMxDrwYOhdT3CS1jjkuu
NxuypRhJOl0GVMv1Y5DOvXroedOexA==
=wTRU
-----END PGP SIGNATURE-----

--GMMH86bexZKtIQ8AtxPJFk9BipeWf1o9o--
