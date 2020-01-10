From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 10 Jan 2020 08:28:07 +0000
Subject: Re: [PATCH -next] drm/mgag200: Fix typo in parameter description
Message-Id: <ce1a17c8-2af9-a449-16d5-36ddfd7a976e@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="iiEN0Yah1UoVVqZjMQ0y6D7O9EtL3DPmr"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110012523.33053-1-weiyongjun1@huawei.com>
In-Reply-To: <20200110012523.33053-1-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>, Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Kate Stewart <kstewart@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iiEN0Yah1UoVVqZjMQ0y6D7O9EtL3DPmr
Content-Type: multipart/mixed; boundary="pTTiHLHFEWOhHClrPak37aP8iw00UOEbU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wei Yongjun <weiyongjun1@huawei.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Kate Stewart <kstewart@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-ID: <ce1a17c8-2af9-a449-16d5-36ddfd7a976e@suse.de>
Subject: Re: [PATCH -next] drm/mgag200: Fix typo in parameter description
References: <20200110012523.33053-1-weiyongjun1@huawei.com>
In-Reply-To: <20200110012523.33053-1-weiyongjun1@huawei.com>

--pTTiHLHFEWOhHClrPak37aP8iw00UOEbU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.01.20 um 02:25 schrieb Wei Yongjun:
> Fix typo in parameter description.

As Dan said, please mention that it's about a module parameter. The
current commit message appears to refer to a function's parameter.

With the commit message fixed, you can add

Reviewed-by: Thomas Zimemrmann <tzimmermann@suse.de>

Thanks for fixing this bug.

Best regards
Thomas

>=20
> Fixes: 3cacb2086e41 ("drm/mgag200: Add module parameter to pin all buff=
ers at offset 0")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mg=
ag200/mgag200_drv.c
> index 7a5bad2f57d7..2236f8ef20a4 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -28,7 +28,7 @@ MODULE_PARM_DESC(modeset, "Disable/Enable modesetting=
");
>  module_param_named(modeset, mgag200_modeset, int, 0400);
> =20
>  int mgag200_hw_bug_no_startadd =3D -1;
> -MODULE_PARM_DESC(modeset, "HW does not interpret scanout-buffer start =
address correctly");
> +MODULE_PARM_DESC(hw_bug_no_startadd, "HW does not interpret scanout-bu=
ffer start address correctly");
>  module_param_named(hw_bug_no_startadd, mgag200_hw_bug_no_startadd, int=
, 0400);
> =20
>  static struct drm_driver driver;
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--pTTiHLHFEWOhHClrPak37aP8iw00UOEbU--

--iiEN0Yah1UoVVqZjMQ0y6D7O9EtL3DPmr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4YNZsACgkQaA3BHVML
eiM+UQf+J92/hICo707Qje0Q7uVRT1riV5XCPhxBuOUCzDNPRDH15zvvJdL9HbJ0
KG4QGNjuVTGJbndQiglQZXl2pNPOA+zoG7JZAq5x1E7ICGmussuxx3UtLIYY6dak
kyosKHWwu5rzgT2iCPvxbuk1+RNrTrAhj3w+ZfGzD1AX08dJr8Ks2jVgPf55lGzc
u7Of3a6qfJ5OGjYRf4CCMKG8yEKTa/oXQGdSCECmZhlBw1KJQppFt9ME0oj5v7r3
eS3SFcK7TRrD3dAOBizkSZMGpVlmlJscSRmlqy1j3uwfkaPcAEBczStm6ajqSNBO
XMhUrIhoiDfRiKgtaZufX598XDFXIA==
=Gnga
-----END PGP SIGNATURE-----

--iiEN0Yah1UoVVqZjMQ0y6D7O9EtL3DPmr--
