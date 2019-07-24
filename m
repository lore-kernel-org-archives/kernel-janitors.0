From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 24 Jul 2019 07:40:25 +0000
Subject: Re: [PATCH -next] drm/mga: remove set but not used variable 'buf_priv'
Message-Id: <14af485d-a73f-d6bc-a93b-8d44bb64112a@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="w08pszPqwMWrvXc6cnxtdPDspNYAOpysW"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190724014619.32665-1-yuehaibing@huawei.com>
In-Reply-To: <20190724014619.32665-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--w08pszPqwMWrvXc6cnxtdPDspNYAOpysW
Content-Type: multipart/mixed; boundary="keAZ2cF4X0e3pWJPZIIcbGIHjjW7RjWlp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: YueHaibing <yuehaibing@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hulk Robot <hulkci@huawei.com>
Message-ID: <14af485d-a73f-d6bc-a93b-8d44bb64112a@suse.de>
Subject: Re: [PATCH -next] drm/mga: remove set but not used variable
 'buf_priv'
References: <20190724014619.32665-1-yuehaibing@huawei.com>
In-Reply-To: <20190724014619.32665-1-yuehaibing@huawei.com>

--keAZ2cF4X0e3pWJPZIIcbGIHjjW7RjWlp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 24.07.19 um 03:46 schrieb YueHaibing:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/gpu/drm/mga/mga_state.c: In function 'mga_dma_iload':
> drivers/gpu/drm/mga/mga_state.c:945:22: warning:
>  variable 'buf_priv' set but not used [-Wunused-but-set-variable]
>=20
> It is never used, so can be removed.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/mga/mga_state.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mga/mga_state.c b/drivers/gpu/drm/mga/mga_=
state.c
> index 77a0b006f066..0dec4062e5a2 100644
> --- a/drivers/gpu/drm/mga/mga_state.c
> +++ b/drivers/gpu/drm/mga/mga_state.c
> @@ -942,7 +942,6 @@ static int mga_dma_iload(struct drm_device *dev, vo=
id *data, struct drm_file *fi
>  	struct drm_device_dma *dma =3D dev->dma;
>  	drm_mga_private_t *dev_priv =3D dev->dev_private;
>  	struct drm_buf *buf;
> -	drm_mga_buf_priv_t *buf_priv;
>  	drm_mga_iload_t *iload =3D data;
>  	DRM_DEBUG("\n");
> =20
> @@ -959,7 +958,6 @@ static int mga_dma_iload(struct drm_device *dev, vo=
id *data, struct drm_file *fi
>  		return -EINVAL;
> =20
>  	buf =3D dma->buflist[iload->idx];
> -	buf_priv =3D buf->dev_private;
> =20
>  	if (mga_verify_iload(dev_priv, iload->dstorg, iload->length)) {
>  		mga_freelist_put(dev, buf);
>=20

Thanks!

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--keAZ2cF4X0e3pWJPZIIcbGIHjjW7RjWlp--

--w08pszPqwMWrvXc6cnxtdPDspNYAOpysW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl04C20ACgkQaA3BHVML
eiOUewf/Qnu3ijQ7oRow2rPhHQLuyjtcMtyhMV6IHBrlSJ4caVNeUT7WchUEEpgH
dfrV7e4ozjQoUoRRjIkgmtyF9VIgTaC7f8DUXPaHbdKdFto4eqxHkzq9Qvlahj/L
yLvA3vqNO2Xqqg4ImipzD5+NdyLb6+XUg3qlqR0Io5qq9/1jgwC1+thVchD3KHT6
qbFeEF7cwV5+EkZr8Mu8dnu0zNn5pR844LBkTgIEnTHO5IcwDJcxUNabQTvu3hXx
/WW49SYOwBW+ImQofxlQaegzuoxoF0mfZlaB13tszTP7LQzp4W4zdA2UeZG0zw3r
sVW38ZbC5iyfbj1ZO/72ezcBH+7w4Q==
=bbRi
-----END PGP SIGNATURE-----

--w08pszPqwMWrvXc6cnxtdPDspNYAOpysW--
